import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainObservedTx extends CosmosMessage {
  final ThorchainTx tx;
  final ThorchainStatus? status;
  final List<String>? outHashes;
  final BigInt? blockHeight;
  final List<String>? signers;
  final String? observedPubKey;
  final BigInt? keysignMs;
  final BigInt? finaliseHeight;
  final String? aggregator;
  final String? aggregatorTarget;
  final String aggregatorTargetLimit;
  ThorchainObservedTx(
      {required this.tx,
      this.status,
      List<String>? outHashes,
      this.blockHeight,
      List<String>? signers,
      this.observedPubKey,
      this.keysignMs,
      this.finaliseHeight,
      this.aggregator,
      this.aggregatorTarget,
      required this.aggregatorTargetLimit})
      : outHashes = outHashes?.nullOnEmpy,
        signers = outHashes?.nullOnEmpy;
  factory ThorchainObservedTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainObservedTx(
      tx: ThorchainTx.deserialize(decode.getField(1)),
      status: decode
          .getResult(2)
          ?.to<ThorchainStatus, int>((e) => ThorchainStatus.fromValue(e)),
      outHashes: decode.getFields<String>(3),
      blockHeight: decode.getField(4),
      signers: decode.getFields<String>(5),
      observedPubKey: decode.getField(6),
      keysignMs: decode.getField(7),
      finaliseHeight: decode.getField(8),
      aggregator: decode.getField(9),
      aggregatorTarget: decode.getField(10),
      aggregatorTargetLimit: decode.getField(11),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "status": status?.value,
      "out_hashes": outHashes,
      "block_height": blockHeight?.toString(),
      "signers": signers,
      "observed_pub_key": observedPubKey,
      "keysign_ms": keysignMs?.toString(),
      "finalise_height": finaliseHeight?.toString(),
      "aggregator": aggregator,
      "aggregator_target": aggregatorTarget,
      "aggregator_target_limit": aggregatorTargetLimit
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.observedTx.typeUrl;

  @override
  List get values => [
        tx,
        status?.value,
        outHashes,
        blockHeight,
        signers,
        observedPubKey,
        keysignMs,
        finaliseHeight,
        aggregator,
        aggregatorTarget,
        aggregatorTargetLimit
      ];
}
