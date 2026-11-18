// Shared helpers for the Cosmos SDK examples.
//
// The examples run against a local single-node Cosmos SDK chain (simapp) that
// you start with Docker (see README.md):
//
//   ./start.sh          # builds + starts the chain in a container
//
// The chain exposes CometBFT RPC on http://127.0.0.1:26657 and REST on
// http://127.0.0.1:1317. Accounts are funded in the genesis file, so the
// examples are deterministic and need no faucet.
//
// The examples only use the Tendermint RPC and REST HTTP APIs (no gRPC), so a
// single [CosmosHttpService] is enough.

import 'dart:io';

import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';

/// CometBFT JSON-RPC endpoint of the local chain.
const String cosmosRpcUrl = 'http://127.0.0.1:26657';

/// REST (gRPC-gateway) endpoint of the local chain.
const String cosmosRestUrl = 'http://127.0.0.1:1317';

/// Native denom of the local chain (simapp's staking/gas token).
const String cosmosDenom = 'stake';

/// 1 token = 1e6 base units (`stake` uses 6 decimals).
final BigInt oneUnit = BigInt.from(1000000);

/// The fixed mnemonic every example derives its accounts from.
const String cosmosMnemonic =
    'stay account section seat resist vital jazz mosquito kiwi shoot present '
    'tornado trick stomach satisfy science skin rhythm squeeze athlete universe '
    'staff mom usage';

/// HTTP service for the local Cosmos chain (Tendermint RPC + REST).
class CosmosHttpService with CosmosServiceProvider {
  CosmosHttpService({
    this.rpcUrl = cosmosRpcUrl,
    this.restUrl = cosmosRestUrl,
    this.timeout = const Duration(seconds: 30),
  });

  final String rpcUrl;
  final String restUrl;
  final Duration timeout;

  String _baseUrl(BaseCosmosRequestDetails params) {
    switch (params.api) {
      case CosmosProviderApi.tendermint:
        return rpcUrl;
      case CosmosProviderApi.rest:
        return restUrl;
      default:
        throw StateError('Unsupported api: ${params.api.name}');
    }
  }

  @override
  Future<BaseServiceResponse> doRequest(
    BaseCosmosRequestDetails params, {
    Duration? timeout,
  }) async {
    final client = HttpClient();
    try {
      final uri = params.encodeUrl(_baseUrl(params));
      final request = params.requestMethod.isPost
          ? await client.postUrl(uri)
          : await client.getUrl(uri);
      params.headers.forEach(request.headers.set);
      final body = params.encodeBody();
      if (body != null) request.add(body);
      final response = await request.close().timeout(timeout ?? this.timeout);
      final bytes = await response.fold<List<int>>(
        <int>[],
        (previous, chunk) => previous..addAll(chunk),
      );
      return params.toResponse(bytes, statusCode: response.statusCode);
    } finally {
      client.close();
    }
  }

  @override
  Future<List<int>> doGrpcRequest(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) {
    throw UnsupportedError('gRPC is not used by these examples.');
  }

  @override
  Stream<List<int>> doGrpcRequestStream(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) =>
      const Stream.empty();

  @override
  Future<Stream<List<int>>> doGrpcRequestStreamAsync(
    CosmosGrpcRequestDetails params, {
    Duration? timeout,
  }) async =>
      const Stream.empty();
}

/// A minimal Cosmos client that answers Tendermint/REST queries.
class CosmosClient with CosmosQuickServiceApi {
  CosmosClient(this.provider, {List<CosmosProviderApi>? apis})
      : supportedApis =
            apis ?? [CosmosProviderApi.tendermint, CosmosProviderApi.rest];

  @override
  final CosmosProvider provider;

  @override
  final List<CosmosProviderApi> supportedApis;
}

/// Builds a [CosmosClient] for the local chain.
CosmosClient cosmosClient({List<CosmosProviderApi>? apis}) {
  return CosmosClient(
    CosmosProvider(CosmosHttpService()),
    apis: apis,
  );
}

/// Deterministic account for [index] (BIP44 path m/44'/118'/0'/0/index).
CosmosSecp256K1PrivateKey cosmosAccount(int index) {
  final seed = Bip39SeedGenerator(
    Mnemonic.fromString(cosmosMnemonic),
  ).generate();
  final key = Bip44.fromSeed(seed, Bip44Coins.cosmos)
      .purpose
      .coin
      .account(0)
      .change(Bip44Changes.chainExt)
      .addressIndex(index);
  return CosmosSecp256K1PrivateKey.fromBytes(key.privateKey.toBytes());
}

/// Deterministic address for [index].
CosmosBaseAddress cosmosAddress(int index) =>
    cosmosAccount(index).toPublicKey().toAddress(hrp: CosmosAddrConst.accHRP);

/// Prints a two-column `name : value` line.
String field(String name, String value) {
  return '  ${name.padRight(20)} $value';
}

/// Formats [amount] base units as a decimal token string (6 decimals).
String formatAmount(BigInt amount) {
  final digits = amount.toString().padLeft(7, '0');
  final whole = digits.substring(0, digits.length - 6);
  final fraction =
      digits.substring(digits.length - 6).replaceFirst(RegExp(r'0+$'), '');
  return fraction.isEmpty ? whole : '$whole.$fraction';
}
