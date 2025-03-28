import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Params defines the set of Connection parameters.
class IbcConnectionParams extends CosmosMessage {
  /// maximum expected time per block (in nanoseconds), used to enforce block delay. This parameter should reflect the
  /// largest amount of time that the chain might reasonably take to produce the next block under normal operating
  /// conditions. A safe choice is 3-5x the expected time per block.
  final BigInt? maxExpectedTimePerBlock;
  factory IbcConnectionParams.fromJson(Map<String, dynamic> json) {
    return IbcConnectionParams(
        maxExpectedTimePerBlock:
            BigintUtils.tryParse(json["max_expected_time_per_block"]));
  }
  const IbcConnectionParams({this.maxExpectedTimePerBlock});
  factory IbcConnectionParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionParams(maxExpectedTimePerBlock: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "max_expected_time_per_block": maxExpectedTimePerBlock?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionParams;

  @override
  List get values => [maxExpectedTimePerBlock];
}
