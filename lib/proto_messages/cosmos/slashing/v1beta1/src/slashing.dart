import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// ValidatorSigningInfo defines a validator's signing info for monitoring their
/// liveness activity.
class ValidatorSigningInfo extends CosmosProtoMessage {
  final String? address;

  /// Height at which validator was first a candidate OR was un-jailed
  final BigInt? startHeight;

  /// Index which is incremented every time a validator is bonded in a block and
  /// _may_ have signed a pre-commit or not. This in conjunction with the
  /// signed_blocks_window param determines the index in the missed block bitmap.
  final BigInt? indexOffset;

  /// Timestamp until which the validator is jailed due to liveness downtime.
  final google_protobuf_timestamp.Timestamp? jailedUntil;

  /// Whether or not a validator has been tombstoned (killed out of validator
  /// set). It is set once the validator commits an equivocation or for any other
  /// configured misbehavior.
  final bool? tombstoned;

  /// A counter of missed (unsigned) blocks. It is used to avoid unnecessary
  /// reads in the missed block bitmap.
  final BigInt? missedBlocksCounter;

  const ValidatorSigningInfo({
    this.address,
    this.startHeight,
    this.indexOffset,
    this.jailedUntil,
    this.tombstoned,
    this.missedBlocksCounter,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bool(5),
        ProtoFieldConfig.int64(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    startHeight,
    indexOffset,
    jailedUntil,
    tombstoned,
    missedBlocksCounter,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'start_height': config.encodeBigint(startHeight),
      'index_offset': config.encodeBigint(indexOffset),
      'jailed_until': jailedUntil?.toRfc3339(),
      'tombstoned': tombstoned,
      'missed_blocks_counter': config.encodeBigint(missedBlocksCounter),
    };
  }

  factory ValidatorSigningInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ValidatorSigningInfo(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      startHeight: json.valueAsBigInt<BigInt?>(
        'start_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      indexOffset: json.valueAsBigInt<BigInt?>(
        'index_offset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      jailedUntil: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'jailed_until',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      tombstoned: json.valueAsBool<bool?>(
        'tombstoned',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      missedBlocksCounter: json.valueAsBigInt<BigInt?>(
        'missed_blocks_counter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ValidatorSigningInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorSigningInfo(
      address: decode.getString<String?>(1),
      startHeight: decode.getBigInt<BigInt?>(2),
      indexOffset: decode.getBigInt<BigInt?>(3),
      jailedUntil: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      tombstoned: decode.getBool<bool?>(5),
      missedBlocksCounter: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1ValidatorSigningInfo;
}

/// Params represents the parameters used for by the slashing module.
class Params extends CosmosProtoMessage {
  final BigInt? signedBlocksWindow;

  final BuBytes? minSignedPerWindow;

  final google_protobuf_duration.Duration? downtimeJailDuration;

  final BuBytes? slashFractionDoubleSign;

  final BuBytes? slashFractionDowntime;

  Params({
    this.signedBlocksWindow,
    List<int>? minSignedPerWindow,
    this.downtimeJailDuration,
    List<int>? slashFractionDoubleSign,
    List<int>? slashFractionDowntime,
  }) : minSignedPerWindow = minSignedPerWindow?.asImmutableBytes,
       slashFractionDoubleSign = slashFractionDoubleSign?.asImmutableBytes,
       slashFractionDowntime = slashFractionDowntime?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/x/slashing/Params",
        ),
      ],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bytes(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bytes(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    signedBlocksWindow,
    minSignedPerWindow,
    downtimeJailDuration,
    slashFractionDoubleSign,
    slashFractionDowntime,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'signed_blocks_window': config.encodeBigint(signedBlocksWindow),
      'min_signed_per_window': config.encodeBinary(minSignedPerWindow),
      'downtime_jail_duration': downtimeJailDuration?.encodeString(
        asNanos: true,
      ),
      'slash_fraction_double_sign': config.encodeBinary(
        slashFractionDoubleSign,
      ),
      'slash_fraction_downtime': config.encodeBinary(slashFractionDowntime),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      signedBlocksWindow: json.valueAsBigInt<BigInt?>(
        'signed_blocks_window',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      minSignedPerWindow: config.decodeBinary<List<int>?>(
        json.valueAs(
          'min_signed_per_window',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      downtimeJailDuration: json
          .valueTo<google_protobuf_duration.Duration?, Object>(
            key: 'downtime_jail_duration',
            parse:
                (v) => google_protobuf_duration.Duration.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      slashFractionDoubleSign: config.decodeBinary<List<int>?>(
        json.valueAs(
          'slash_fraction_double_sign',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      slashFractionDowntime: config.decodeBinary<List<int>?>(
        json.valueAs(
          'slash_fraction_downtime',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      signedBlocksWindow: decode.getBigInt<BigInt?>(1),
      minSignedPerWindow: decode.getBytes<List<int>?>(2),
      downtimeJailDuration: decode
          .messageTo<google_protobuf_duration.Duration?>(
            3,
            (b) => google_protobuf_duration.Duration.deserialize(b),
          ),
      slashFractionDoubleSign: decode.getBytes<List<int>?>(4),
      slashFractionDowntime: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1Params;
}
