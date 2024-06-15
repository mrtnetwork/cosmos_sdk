import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// Historical contains a set of minimum values needed for evaluating historical validator
/// sets and blocks. It is stored as part of staking module's state, which persists the n
/// most recent HistoricalInfo (n is set by the staking module's historical_entries parameter).
class HistoricalRecord extends CosmosMessage {
  final List<int>? apphash;
  final ProtobufTimestamp? time;
  final List<int>? validatorsHash;

  HistoricalRecord({
    required List<int>? apphash,
    required this.time,
    required List<int>? validatorsHash,
  })  : apphash = BytesUtils.tryToBytes(apphash),
        validatorsHash = BytesUtils.tryToBytes(validatorsHash);
  factory HistoricalRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return HistoricalRecord(
        apphash: decode.getField(1),
        time: decode.getResult(2)?.to<ProtobufTimestamp, List<int>>(
            (e) => ProtobufTimestamp.deserialize(e)),
        validatorsHash: decode.getField(3));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'apphash': BytesUtils.tryToHexString(apphash),
      'time': time?.toJson(),
      'validators_hash': BytesUtils.tryToHexString(validatorsHash),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get typeUrl => StakingV1beta1Types.historicalRecord.typeUrl;

  @override
  List get values => [apphash, time, validatorsHash];
}
