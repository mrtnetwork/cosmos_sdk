import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/downtimedetector/v1beta1/src/downtime_duration.dart"
    as osmosis_downtimedetector_v1beta1_downtime_duration;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// Query for has it been at least $RECOVERY_DURATION units of time,
/// since the chain has been down for $DOWNTIME_DURATION.
class RecoveredSinceDowntimeOfLengthRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<RecoveredSinceDowntimeOfLengthResponse> {
  final osmosis_downtimedetector_v1beta1_downtime_duration.Downtime? downtime;

  final google_protobuf_duration.Duration? recovery;

  const RecoveredSinceDowntimeOfLengthRequest({this.downtime, this.recovery});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/osmosis/downtime-detector/v1beta1/RecoveredSinceDowntimeOfLength",
        ),
      ],
      fields: [
        ProtoFieldConfig.enumType(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [downtime, recovery];

  @override
  Map<String, dynamic> toJson() {
    return {
      'downtime': downtime?.protoName,
      'recovery': recovery?.encodeString(asNanos: true),
    };
  }

  factory RecoveredSinceDowntimeOfLengthRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return RecoveredSinceDowntimeOfLengthRequest(
      downtime: json.valueTo<
        osmosis_downtimedetector_v1beta1_downtime_duration.Downtime?,
        Object?
      >(
        key: 'downtime',
        parse:
            (v) => osmosis_downtimedetector_v1beta1_downtime_duration
                .Downtime.from(v),
      ),
      recovery: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'recovery',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory RecoveredSinceDowntimeOfLengthRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RecoveredSinceDowntimeOfLengthRequest(
      downtime: decode.getEnum<
        osmosis_downtimedetector_v1beta1_downtime_duration.Downtime?
      >(1, osmosis_downtimedetector_v1beta1_downtime_duration.Downtime.values),
      recovery: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisDowntimedetectorV1beta1RecoveredSinceDowntimeOfLengthRequest;
  @override
  RecoveredSinceDowntimeOfLengthResponse onQueryResponse(List<int> bytes) {
    return RecoveredSinceDowntimeOfLengthResponse.deserialize(bytes);
  }

  @override
  RecoveredSinceDowntimeOfLengthResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return RecoveredSinceDowntimeOfLengthResponse.fromJson(json);
  }
}

class RecoveredSinceDowntimeOfLengthResponse extends CosmosProtoMessage {
  final bool? succesfullyRecovered;

  const RecoveredSinceDowntimeOfLengthResponse({this.succesfullyRecovered});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [succesfullyRecovered];

  @override
  Map<String, dynamic> toJson() {
    return {'succesfully_recovered': succesfullyRecovered};
  }

  factory RecoveredSinceDowntimeOfLengthResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return RecoveredSinceDowntimeOfLengthResponse(
      succesfullyRecovered: json.valueAsBool<bool?>(
        'succesfully_recovered',
        acceptCamelCase: true,
      ),
    );
  }

  factory RecoveredSinceDowntimeOfLengthResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RecoveredSinceDowntimeOfLengthResponse(
      succesfullyRecovered: decode.getBool<bool?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisDowntimedetectorV1beta1RecoveredSinceDowntimeOfLengthResponse;
}
