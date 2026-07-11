import 'package:blockchain_utils/exception/exception/rpc_error.dart';
import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:blockchain_utils/service/models/params.dart';
import 'package:blockchain_utils/utils/amount/amount/amount.dart';
import 'package:blockchain_utils/utils/binary/utils.dart';
import 'package:blockchain_utils/utils/numbers/rational/big_rational.dart';
import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:blockchain_utils/utils/string/string.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/auth/v1beta1/src/auth.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/auth/v1beta1/src/query.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/src/query.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/tendermint/v1beta1/src/query.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/src/service.dart';
import 'package:cosmos_sdk/sdk/address/address/address.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/constants/const.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/grpc/grpc.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/rest/methods/message.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/methods/abci/abci_with_result.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/methods/tx/broadcast_tx_sync.dart';
import 'package:cosmos_sdk/sdk/provider/types/types.dart';
import 'package:cosmos_sdk/proto_messages/ethermint/feemarket/v1/models.dart'
    as etheremint;
import 'package:cosmos_sdk/proto_messages/cosmos/evm/feemarket/v1/models.dart'
    as cosmos_evm;
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';

mixin CosmosQuickServiceApi<PROVIDER extends IProvider> {
  PROVIDER get provider;
  List<CosmosProviderApi> get supportedApis;
  Future<T> foldApi<T extends Object>({
    required Future<T> Function(IProvider provider) onTendermint,
    required Future<T> Function(IProvider provider) onRest,
    required Future<T> Function(IGrpcProvider provider) onGrpc,
    CosmosProviderApi? api,
  }) async {
    if (api == null) {
      if (supportedApis.contains(CosmosProviderApi.tendermint)) {
        api = CosmosProviderApi.tendermint;
      } else if (supportedApis.contains(CosmosProviderApi.rest)) {
        api = CosmosProviderApi.rest;
      } else if (supportedApis.contains(CosmosProviderApi.grpc)) {
        api = CosmosProviderApi.grpc;
      }
    }
    return await switch (api) {
      CosmosProviderApi.tendermint => await onTendermint(provider),
      CosmosProviderApi.rest => await onRest(provider),
      CosmosProviderApi.grpc => () async {
        final provider = this.provider;
        if (provider is! IGrpcProvider) {
          throw const DartCosmosSdkPluginException(
            "Unexpected gRPC provider type.",
          );
        }
        return await onGrpc(provider);
      }(),
      _ =>
        throw DartCosmosSdkPluginException(
          "Unsupported api.",
          details: {
            "api": api?.name,
            "supportedApis": CosmosProviderApi.cosmosApis
                .map((e) => e.name)
                .join(", "),
          },
        ),
    };
  }

  Future<T> query<T extends CosmosProtoMessage>(
    ICosmosProtoQueryMessage<T> message, {
    Duration? timeout,
    CosmosProviderApi? api,
  }) async {
    return await foldApi(
      api: api,
      onTendermint:
          (provider) => provider.request(
            TendermintRequestAbciQuery(request: message),
            timeout: timeout,
          ),
      onRest:
          (provider) => provider.request(
            CosmosRestRequestMessage(request: message),
            timeout: timeout,
          ),
      onGrpc:
          (provider) => provider.request(
            CosmosGrpcRequestMessage(request: message),
            timeout: timeout,
          ),
    );
  }

  Future<dynamic> queryDynamic<T extends CosmosProtoMessage>(
    ICosmosProtoQueryMessage<T> message, {
    Duration? timeout,
  }) async {
    return await foldApi(
      onTendermint:
          (provider) => provider.requestDynamic(
            TendermintRequestAbciQuery(request: message),
            timeout: timeout,
          ),
      onRest:
          (provider) => provider.requestDynamic(
            CosmosRestRequestMessage(request: message),
            timeout: timeout,
          ),
      onGrpc:
          (provider) => provider.requestDynamic(
            CosmosGrpcRequestMessage(request: message),
            timeout: timeout,
          ),
    );
  }

  Future<GetLatestBlockResponse> getLatestBlock({Duration? timeout}) async {
    final result = await query(const GetLatestBlockRequest(), timeout: timeout);
    return result;
  }

  Future<String?> networkBech32({Duration? timeout}) async {
    final result = await query(const Bech32PrefixRequest(), timeout: timeout);
    return result.bech32Prefix;
  }

  Future<BigInt> totalSupply(String denom, {Duration? timeout}) async {
    final result = await query(
      QuerySupplyOfRequest(denom: denom),
      timeout: timeout,
    );
    final amount = result.amount?.amount;
    if (amount == null) return BigInt.zero;
    return BigintUtils.parse(amount);
  }

  Future<BigInt?> getBlockHeight({Duration? timeout}) async {
    final result = await getLatestBlock(timeout: timeout);
    return result.block?.header?.height;
  }

  Future<List<Coin>> getAddressCoins(
    CosmosBaseAddress address, {
    Duration? timeout,
  }) async {
    final request = QuerySpendableBalancesRequest(address: address.address);
    final result = await query(request, timeout: timeout);
    return result.balances;
  }

  Future<BigInt> getBalance(
    CosmosBaseAddress address,
    String denom, {
    Duration? timeout,
  }) async {
    final coins = await getAddressCoins(address, timeout: timeout);
    final nativeToken = coins.firstWhereNullable((e) => e.denom == denom);
    final balance = nativeToken?.amount;
    if (balance == null) return BigInt.zero;
    return BigintUtils.parse(balance);
  }

  Future<String> chainId({Duration? timeout}) async {
    final block = await getLatestBlock(timeout: timeout);
    final chainId = block.block?.header?.chainId;
    if (chainId == null) {
      throw const RPCError(
        message: "Unexpected service response. missing chaind id.",
      );
    }
    return chainId;
  }

  Future<BaseAccount?> tryGetAccount(
    CosmosBaseAddress address, {
    Duration? timeout,
  }) async {
    try {
      final request = QueryAccountInfoRequest(address: address.address);
      final result = await query(request, timeout: timeout);
      return result.info;
    } on RPCError catch (e) {
      if (CosmosProviderUtils.itemNotFound(e.errorCode)) return null;
      rethrow;
    }
  }

  Future<BaseAccount> getAccount(
    CosmosBaseAddress address, {
    Duration? timeout,
  }) async {
    final request = QueryAccountInfoRequest(address: address.address);
    final result = await query(request, timeout: timeout);
    final account = result.info;
    if (account != null) return account;
    throw const DartCosmosSdkPluginException("Account not found.");
  }

  Future<SimulateResponse> simulateTx(
    List<int> txBytes, {
    List<ICosmosProtoServiceMessage> txMessages = const [],
    Duration? timeout,
  }) async {
    final request = SimulateRequest(txBytes: txBytes);
    return await query(request, timeout: timeout);
  }

  Future<GetTxResponse> getTransaction(String hash, {Duration? timeout}) async {
    final request = GetTxRequest(hash: StringUtils.normalizeHex(hash));
    return await query(request, timeout: timeout);
  }

  Future<String> broadcastTransaction(
    List<int> txRaw, {
    Duration? timeout,
  }) async {
    final result = await foldApi(
      onTendermint: (provider) async {
        final result = await provider.request(
          TendermintRequestBroadcastTxSync(
            BytesUtils.toHexString(txRaw, prefix: "0x"),
          ),
          timeout: timeout,
        );
        return (
          code: result.code,
          data: result.data,
          log: result.log,
          hash: result.hash,
        );
      },
      onRest: (provider) async {
        final result = await query(
          BroadcastTxRequest(
            txBytes: txRaw,
            mode: BroadcastMode.broadcastModeAsync,
          ),
          timeout: timeout,
        );
        return (
          code: result.txResponse?.code,
          data: result.txResponse?.data,
          log: result.txResponse?.rawLog,
          hash: result.txResponse?.txhash,
        );
      },
      onGrpc: (provider) async {
        final result = await query(
          BroadcastTxRequest(
            txBytes: txRaw,
            mode: BroadcastMode.broadcastModeAsync,
          ),
          timeout: timeout,
        );

        return (
          code: result.txResponse?.code,
          data: result.txResponse?.data,
          log: result.txResponse?.rawLog,
          hash: result.txResponse?.txhash,
        );
      },
    );
    final hash = result.hash;
    if (hash == null) {
      throw RPCError(
        message: "Unexpected service response. missing tx hash.",
        jsonRpcErrpr: {
          "code": result.code,
          "data": result.data,
          "log": result.log,
        },
      );
    }
    final code = result.code ?? 0;
    if (code != 0) {
      throw RPCError(
        message: result.data ?? "Broadcast transaction failed.",
        errorCode: code,
      );
    }
    return hash;
  }

  Future<BigRational?> getEthereumBaseFee({Duration? timeout}) async {
    BigRational parseFee(String? baseFee) {
      if (baseFee == null) {
        throw RPCError(
          message: "Unexpected service response. missing base fee.",
        );
      }
      final fee = BigInt.tryParse(baseFee);
      if (fee != null) return BigRational(fee);
      return BigRational(AmountConverter.eth.toUnit(baseFee));
    }

    try {
      final result = await query(
        const etheremint.QueryBaseFeeRequest(),
        timeout: timeout,
      );
      return parseFee(result.baseFee);
    } on RPCError catch (e) {
      if (CosmosProviderUtils.notImplemented(e.errorCode)) {
        try {
          final result = await query(const cosmos_evm.QueryBaseFeeRequest());

          return parseFee(result.baseFee);
        } on RPCError catch (e) {
          if (CosmosProviderUtils.notImplemented(e.errorCode)) return null;
          rethrow;
        }
      }
      rethrow;
    }
  }
}
