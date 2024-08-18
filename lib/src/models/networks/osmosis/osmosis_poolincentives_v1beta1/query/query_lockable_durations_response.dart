import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisPoolincentivesQueryLockableDurationsResponse
    extends CosmosMessage {
  final List<ProtobufDuration> lockableDurations;

  OsmosisPoolincentivesQueryLockableDurationsResponse(
      List<ProtobufDuration> lockableDurations)
      : lockableDurations = lockableDurations.immutable;
  factory OsmosisPoolincentivesQueryLockableDurationsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesQueryLockableDurationsResponse(decode
        .getFields(1)
        .map((e) => ProtobufDuration.deserialize(e))
        .toList());
  }
  factory OsmosisPoolincentivesQueryLockableDurationsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryLockableDurationsResponse(
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
      OsmosisPoolincentivesV1beta1Types.queryLockableDurationsResponse.typeUrl;
  @override
  List get values => [lockableDurations];
}
