import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// Params holds parameters for the twap module
class Params extends CosmosProtoMessage {
  final String? pruneEpochIdentifier;

  final google_protobuf_duration.Duration? recordHistoryKeepPeriod;

  const Params({this.pruneEpochIdentifier, this.recordHistoryKeepPeriod});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    pruneEpochIdentifier,
    recordHistoryKeepPeriod,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'prune_epoch_identifier': pruneEpochIdentifier,
      'record_history_keep_period': recordHistoryKeepPeriod?.encodeString(
        asNanos: true,
      ),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      pruneEpochIdentifier: json.valueAsString<String?>(
        'prune_epoch_identifier',
        acceptCamelCase: true,
      ),
      recordHistoryKeepPeriod: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'record_history_keep_period',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      pruneEpochIdentifier: decode.getString<String?>(1),
      recordHistoryKeepPeriod: decode
          .messageTo<google_protobuf_duration.Duration?>(
            2,
            (b) => google_protobuf_duration.Duration.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisTwapV1beta1Params;
}
