import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// Params defines the set of mint parameters.
class Params extends CosmosProtoMessage {
  final String? rewardDenom;

  final google_protobuf_duration.Duration? dilutionPeriod;

  final String? releaseRate;

  /// The dilution rate of release rate.
  /// if `(block.timestamp - last_dilute_timestamp) < dilution_period`:
  /// `release_rate -= (release_rate * dilution_rate)`
  /// `last_dilution_timestamp = block.timestamp`
  final String? dilutionRate;

  final bool? releaseEnabled;

  const Params({
    this.rewardDenom,
    this.dilutionPeriod,
    this.releaseRate,
    this.dilutionRate,
    this.releaseEnabled,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "reward/Params")],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bool(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    rewardDenom,
    dilutionPeriod,
    releaseRate,
    dilutionRate,
    releaseEnabled,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'reward_denom': rewardDenom,
      'dilution_period': dilutionPeriod?.encodeString(asNanos: true),
      'release_rate': releaseRate,
      'dilution_rate': dilutionRate,
      'release_enabled': releaseEnabled,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      rewardDenom: json.valueAsString<String?>(
        'reward_denom',
        acceptCamelCase: true,
      ),
      dilutionPeriod: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'dilution_period',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      releaseRate: json.valueAsString<String?>(
        'release_rate',
        acceptCamelCase: true,
      ),
      dilutionRate: json.valueAsString<String?>(
        'dilution_rate',
        acceptCamelCase: true,
      ),
      releaseEnabled: json.valueAsBool<bool?>(
        'release_enabled',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      rewardDenom: decode.getString<String?>(1),
      dilutionPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      releaseRate: decode.getString<String?>(3),
      dilutionRate: decode.getString<String?>(4),
      releaseEnabled: decode.getBool<bool?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaRewardV1Params;
}
