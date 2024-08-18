import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisIncentiveQueryLockableDurationsResponse extends CosmosMessage {
  /// Time durations that users can lock coins for in order to recieve rewards
  final List<ProtobufDuration> lockableDurations;
  OsmosisIncentiveQueryLockableDurationsResponse(
      List<ProtobufDuration> lockableDurations)
      : lockableDurations = lockableDurations.immutable;
  factory OsmosisIncentiveQueryLockableDurationsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveQueryLockableDurationsResponse(decode
        .getFields(1)
        .map((e) => ProtobufDuration.deserialize(e))
        .toList());
  }
  factory OsmosisIncentiveQueryLockableDurationsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisIncentiveQueryLockableDurationsResponse(
        (json["lockable_durations"] as List?)
                ?.map((e) => ProtobufDuration.fromString(e))
                .toList() ??
            <ProtobufDuration>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "lockable_durations": lockableDurations.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisIncentivesTypes.queryLockableDurationsResponse.typeUrl;

  @override
  List get values => [lockableDurations];
}
