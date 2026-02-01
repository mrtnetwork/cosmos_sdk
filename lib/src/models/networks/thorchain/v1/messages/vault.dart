import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainVault extends CosmosMessage {
  final BigInt? blockHeight;
  final String? pubKey;
  final List<ThorchainCoin> coins;
  final ThorchainVaultType? type;
  final ThorchainVaultStatus? status;
  final BigInt? statusSince;
  final List<String>? membership;
  final List<String>? chains;
  final BigInt? inboundTxCount;
  final BigInt? outboundTxCount;
  final List<BigInt>? pendingTxBlockHeights;
  final List<ThorchainChainContract> routers;
  final List<String>? frozen;
  ThorchainVault({
    this.blockHeight,
    this.pubKey,
    required List<ThorchainCoin> coins,
    this.type,
    this.status,
    this.statusSince,
    List<String>? membership,
    List<String>? chains,
    this.inboundTxCount,
    this.outboundTxCount,
    List<BigInt>? pendingTxBlockHeights,
    required List<ThorchainChainContract> routers,
    List<String>? frozen,
  }) : coins = coins.immutable,
       membership = membership?.emptyAsNull?.immutable,
       chains = chains?.emptyAsNull?.immutable,
       pendingTxBlockHeights = pendingTxBlockHeights?.emptyAsNull?.immutable,
       routers = routers.immutable,
       frozen = frozen?.emptyAsNull?.immutable;
  factory ThorchainVault.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainVault(
      blockHeight: decode.getField(1),
      pubKey: decode.getField(2),
      coins:
          decode
              .getFields<List<int>>(3)
              .map((e) => ThorchainCoin.deserialize(e))
              .toList(),
      type: decode
          .getResult(4)
          ?.to<ThorchainVaultType, int>((e) => ThorchainVaultType.fromValue(e)),
      status: decode
          .getResult(5)
          ?.to<ThorchainVaultStatus, int>(
            (e) => ThorchainVaultStatus.fromValue(e),
          ),
      statusSince: decode.getField(6),
      membership: decode.getFields<String>(7),
      chains: decode.getFields<String>(8),
      inboundTxCount: decode.getField(9),
      outboundTxCount: decode.getField(10),
      pendingTxBlockHeights:
          decode
              .getResult<ProtocolBufferDecoderResult?>(11)
              ?.to<List<BigInt>, List<int>>(
                (e) => e.map((e) => BigintUtils.parse(e)).toList(),
              ) ??
          <BigInt>[],
      routers:
          decode
              .getFields<List<int>>(22)
              .map((e) => ThorchainChainContract.deserialize(e))
              .toList(),
      frozen: decode.getFields<String>(23),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 22, 23];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_height": blockHeight?.toString(),
      "pub_key": pubKey,
      "coins": coins.map((e) => e.toJson()).toList(),
      "type": type?.value,
      "status": status?.value,
      "status_since": statusSince?.toString(),
      "membership": membership,
      "chains": chains,
      "inbound_tx_count": inboundTxCount?.toString(),
      "outbound_tx_count": outboundTxCount?.toString(),
      "pending_tx_block_heights":
          pendingTxBlockHeights?.map((e) => e.toString()).toList(),
      "routers": routers.map((e) => e.toJson()).toList(),
      "frozen": frozen,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.vault;

  @override
  List get values => [
    blockHeight,
    pubKey,
    coins,
    type?.value,
    status?.value,
    statusSince,
    membership,
    chains,
    inboundTxCount,
    outboundTxCount,
    pendingTxBlockHeights,
    routers,
    frozen,
  ];
}
