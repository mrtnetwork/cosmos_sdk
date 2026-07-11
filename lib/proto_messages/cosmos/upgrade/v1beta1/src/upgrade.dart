import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// Plan specifies information about a planned upgrade and when it should occur.
class Plan extends CosmosProtoMessage {
  /// Sets the name for the upgrade. This name will be used by the upgraded
  /// version of the software to apply any special "on-upgrade" commands during
  /// the first BeginBlock method after the upgrade is applied. It is also used
  /// to detect whether a software version can handle a given upgrade. If no
  /// upgrade handler with this name has been set in the software, it will be
  /// assumed that the software is out-of-date when the upgrade Time or Height is
  /// reached and the software will exit.
  final String? name;

  /// Deprecated: Time based upgrades have been deprecated. Time based upgrade logic
  /// has been removed from the SDK.
  /// If this field is not empty, an error will be thrown.
  final google_protobuf_timestamp.Timestamp? time;

  /// The height at which the upgrade must be performed.
  final BigInt? height;

  /// Any application specific upgrade info to be included on-chain
  /// such as a git commit that validators could automatically upgrade to
  final String? info;

  /// Deprecated: UpgradedClientState field has been deprecated. IBC upgrade logic has been
  /// moved to the IBC module in the sub module 02-client.
  /// If this field is not empty, an error will be thrown.
  final google_protobuf_any.Any? upgradedClientState;

  const Plan({
    this.name,
    this.time,
    this.height,
    this.info,
    this.upgradedClientState,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/Plan"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(
          2,
          options: [
            ProtoOptionBool(name: "deprecated", value: true),
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
          ],
        ),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.message(
          5,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    time,
    height,
    info,
    upgradedClientState,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'time': time?.toRfc3339(),
      'height': height?.toString(),
      'info': info,
      'upgraded_client_state': upgradedClientState?.toJson(),
    };
  }

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      info: json.valueAsString<String?>('info', acceptCamelCase: true),
      upgradedClientState: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'upgraded_client_state',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Plan.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Plan(
      name: decode.getString<String?>(1),
      time: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      height: decode.getBigInt<BigInt?>(3),
      info: decode.getString<String?>(4),
      upgradedClientState: decode.messageTo<google_protobuf_any.Any?>(
        5,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1Plan;
}

/// ModuleVersion specifies a module and its consensus version.
class ModuleVersion extends CosmosProtoMessage {
  /// name of the app module
  final String? name;

  /// consensus version of the app module
  final BigInt? version;

  const ModuleVersion({this.name, this.version});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, version];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'version': version?.toString()};
  }

  factory ModuleVersion.fromJson(Map<String, dynamic> json) {
    return ModuleVersion(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      version: json.valueAsBigInt<BigInt?>('version', acceptCamelCase: true),
    );
  }

  factory ModuleVersion.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ModuleVersion(
      name: decode.getString<String?>(1),
      version: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1ModuleVersion;
}
