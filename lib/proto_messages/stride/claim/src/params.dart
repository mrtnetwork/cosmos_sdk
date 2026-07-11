import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// Params defines the claim module's parameters.
class Params extends CosmosProtoMessage {
  final List<Airdrop> airdrops;

  const Params({this.airdrops = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [airdrops];

  @override
  Map<String, dynamic> toJson() {
    return {'airdrops': airdrops.map((e) => e.toJson()).toList()};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      airdrops:
          (json.valueEnsureAsList<dynamic>('airdrops', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Airdrop, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Airdrop.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      airdrops:
          decode.getListOfBytes(1).map((b) => Airdrop.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimParams;
}

class Airdrop extends CosmosProtoMessage {
  final String? airdropIdentifier;

  final String? chainId;

  /// seconds
  final google_protobuf_timestamp.Timestamp? airdropStartTime;

  /// seconds
  final google_protobuf_duration.Duration? airdropDuration;

  /// denom of claimable asset
  final String? claimDenom;

  /// airdrop distribution account
  final String? distributorAddress;

  /// ustrd tokens claimed so far in the current period
  final String? claimedSoFar;

  /// indicates the airdrop should be claimed via autopilot
  final bool? autopilotEnabled;

  const Airdrop({
    this.airdropIdentifier,
    this.chainId,
    this.airdropStartTime,
    this.airdropDuration,
    this.claimDenom,
    this.distributorAddress,
    this.claimedSoFar,
    this.autopilotEnabled,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.bool(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    airdropIdentifier,
    chainId,
    airdropStartTime,
    airdropDuration,
    claimDenom,
    distributorAddress,
    claimedSoFar,
    autopilotEnabled,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'airdrop_identifier': airdropIdentifier,
      'chain_id': chainId,
      'airdrop_start_time': airdropStartTime?.toRfc3339(),
      'airdrop_duration': airdropDuration?.encodeString(asNanos: true),
      'claim_denom': claimDenom,
      'distributor_address': distributorAddress,
      'claimed_so_far': claimedSoFar,
      'autopilot_enabled': autopilotEnabled,
    };
  }

  factory Airdrop.fromJson(Map<String, dynamic> json) {
    return Airdrop(
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      airdropStartTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'airdrop_start_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      airdropDuration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'airdrop_duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      claimDenom: json.valueAsString<String?>(
        'claim_denom',
        acceptCamelCase: true,
      ),
      distributorAddress: json.valueAsString<String?>(
        'distributor_address',
        acceptCamelCase: true,
      ),
      claimedSoFar: json.valueAsString<String?>(
        'claimed_so_far',
        acceptCamelCase: true,
      ),
      autopilotEnabled: json.valueAsBool<bool?>(
        'autopilot_enabled',
        acceptCamelCase: true,
      ),
    );
  }

  factory Airdrop.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Airdrop(
      airdropIdentifier: decode.getString<String?>(1),
      chainId: decode.getString<String?>(7),
      airdropStartTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      airdropDuration: decode.messageTo<google_protobuf_duration.Duration?>(
        3,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      claimDenom: decode.getString<String?>(4),
      distributorAddress: decode.getString<String?>(5),
      claimedSoFar: decode.getString<String?>(6),
      autopilotEnabled: decode.getBool<bool?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimAirdrop;
}
