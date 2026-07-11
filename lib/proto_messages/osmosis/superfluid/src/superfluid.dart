import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/osmosis/lockup/src/lock.dart"
    as osmosis_lockup_lock;

/// SuperfluidAssetType indicates whether the superfluid asset is
/// a native token, lp share of a pool, or concentrated share of a pool
enum SuperfluidAssetType implements ProtoEnumVariant {
  superfluidAssetTypeNative(0, 'SuperfluidAssetTypeNative'),
  superfluidAssetTypeLPShare(1, 'SuperfluidAssetTypeLPShare'),
  superfluidAssetTypeConcentratedShare(
    2,
    'SuperfluidAssetTypeConcentratedShare',
  );

  const SuperfluidAssetType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static SuperfluidAssetType fromValue(int? value) {
    return SuperfluidAssetType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "SuperfluidAssetType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static SuperfluidAssetType from(Object? value) {
    return SuperfluidAssetType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "SuperfluidAssetType",
                value: value,
              ),
    );
  }
}

/// SuperfluidAssetTypeLendingShare = 3; // for now not exist
/// SuperfluidAsset stores the pair of superfluid asset type and denom pair
class SuperfluidAsset extends CosmosProtoMessage {
  final String? denom;

  /// AssetType indicates whether the superfluid asset is a native token or an lp
  /// share
  final SuperfluidAssetType? assetType;

  const SuperfluidAsset({this.denom, this.assetType});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.enumType(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, assetType];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'asset_type': assetType?.protoName};
  }

  factory SuperfluidAsset.fromJson(Map<String, dynamic> json) {
    return SuperfluidAsset(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      assetType: json.valueTo<SuperfluidAssetType?, Object?>(
        key: 'asset_type',
        parse: (v) => SuperfluidAssetType.from(v),
      ),
    );
  }

  factory SuperfluidAsset.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidAsset(
      denom: decode.getString<String?>(1),
      assetType: decode.getEnum<SuperfluidAssetType?>(
        2,
        SuperfluidAssetType.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidSuperfluidAsset;
}

/// The Osmo-Equivalent-Multiplier Record for epoch N refers to the osmo worth we
/// treat an LP share as having, for all of epoch N. Eventually this is intended
/// to be set as the Time-weighted-average-osmo-backing for the entire duration
/// of epoch N-1. (Thereby locking what's in use for epoch N as based on the
/// prior epochs rewards) However for now, this is not the TWAP but instead the
/// spot price at the boundary. For different types of assets in the future, it
/// could change.
class OsmoEquivalentMultiplierRecord extends CosmosProtoMessage {
  final BigInt? epochNumber;

  /// superfluid asset denom, can be LP token or native token
  final String? denom;

  final String? multiplier;

  const OsmoEquivalentMultiplierRecord({
    this.epochNumber,
    this.denom,
    this.multiplier,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [epochNumber, denom, multiplier];

  @override
  Map<String, dynamic> toJson() {
    return {
      'epoch_number': epochNumber?.toString(),
      'denom': denom,
      'multiplier': multiplier,
    };
  }

  factory OsmoEquivalentMultiplierRecord.fromJson(Map<String, dynamic> json) {
    return OsmoEquivalentMultiplierRecord(
      epochNumber: json.valueAsBigInt<BigInt?>(
        'epoch_number',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      multiplier: json.valueAsString<String?>(
        'multiplier',
        acceptCamelCase: true,
      ),
    );
  }

  factory OsmoEquivalentMultiplierRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OsmoEquivalentMultiplierRecord(
      epochNumber: decode.getBigInt<BigInt?>(1),
      denom: decode.getString<String?>(2),
      multiplier: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidOsmoEquivalentMultiplierRecord;
}

/// SuperfluidDelegationRecord is a struct used to indicate superfluid
/// delegations of an account in the state machine in a user friendly form.
class SuperfluidDelegationRecord extends CosmosProtoMessage {
  final String? delegatorAddress;

  final String? validatorAddress;

  final cosmos_base_v1beta1_coin.Coin? delegationAmount;

  final cosmos_base_v1beta1_coin.Coin? equivalentStakedAmount;

  const SuperfluidDelegationRecord({
    this.delegatorAddress,
    this.validatorAddress,
    this.delegationAmount,
    this.equivalentStakedAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    delegatorAddress,
    validatorAddress,
    delegationAmount,
    equivalentStakedAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'delegation_amount': delegationAmount?.toJson(),
      'equivalent_staked_amount': equivalentStakedAmount?.toJson(),
    };
  }

  factory SuperfluidDelegationRecord.fromJson(Map<String, dynamic> json) {
    return SuperfluidDelegationRecord(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      delegationAmount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'delegation_amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      equivalentStakedAmount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'equivalent_staked_amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory SuperfluidDelegationRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SuperfluidDelegationRecord(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      delegationAmount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      equivalentStakedAmount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSuperfluidSuperfluidDelegationRecord;
}

class ConcentratedPoolUserPositionRecord extends CosmosProtoMessage {
  final String? validatorAddress;

  final BigInt? positionId;

  final BigInt? lockId;

  final osmosis_lockup_lock.SyntheticLock? syntheticLock;

  final cosmos_base_v1beta1_coin.Coin? delegationAmount;

  final cosmos_base_v1beta1_coin.Coin? equivalentStakedAmount;

  const ConcentratedPoolUserPositionRecord({
    this.validatorAddress,
    this.positionId,
    this.lockId,
    this.syntheticLock,
    this.delegationAmount,
    this.equivalentStakedAmount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    validatorAddress,
    positionId,
    lockId,
    syntheticLock,
    delegationAmount,
    equivalentStakedAmount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_address': validatorAddress,
      'position_id': positionId?.toString(),
      'lock_id': lockId?.toString(),
      'synthetic_lock': syntheticLock?.toJson(),
      'delegation_amount': delegationAmount?.toJson(),
      'equivalent_staked_amount': equivalentStakedAmount?.toJson(),
    };
  }

  factory ConcentratedPoolUserPositionRecord.fromJson(
    Map<String, dynamic> json,
  ) {
    return ConcentratedPoolUserPositionRecord(
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      positionId: json.valueAsBigInt<BigInt?>(
        'position_id',
        acceptCamelCase: true,
      ),
      lockId: json.valueAsBigInt<BigInt?>('lock_id', acceptCamelCase: true),
      syntheticLock: json
          .valueTo<osmosis_lockup_lock.SyntheticLock?, Map<String, dynamic>>(
            key: 'synthetic_lock',
            parse: (v) => osmosis_lockup_lock.SyntheticLock.fromJson(v),
            acceptCamelCase: true,
          ),
      delegationAmount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'delegation_amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      equivalentStakedAmount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'equivalent_staked_amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory ConcentratedPoolUserPositionRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConcentratedPoolUserPositionRecord(
      validatorAddress: decode.getString<String?>(1),
      positionId: decode.getBigInt<BigInt?>(2),
      lockId: decode.getBigInt<BigInt?>(3),
      syntheticLock: decode.messageTo<osmosis_lockup_lock.SyntheticLock?>(
        4,
        (b) => osmosis_lockup_lock.SyntheticLock.deserialize(b),
      ),
      delegationAmount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        5,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      equivalentStakedAmount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        6,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSuperfluidConcentratedPoolUserPositionRecord;
}
