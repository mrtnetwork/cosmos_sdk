import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// BondStatus is the status of a validator.
enum BondStatus implements ProtoEnumVariant {
  /// UNSPECIFIED defines an invalid validator status.
  bondStatusUnspecified(0, 'BOND_STATUS_UNSPECIFIED'),

  /// UNBONDED defines a validator that is not bonded.
  bondStatusUnbonded(1, 'BOND_STATUS_UNBONDED'),

  /// UNBONDING defines a validator that is unbonding.
  bondStatusUnbonding(2, 'BOND_STATUS_UNBONDING'),

  /// BONDED defines a validator that is bonded.
  bondStatusBonded(3, 'BOND_STATUS_BONDED');

  const BondStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static BondStatus fromValue(int? value) {
    return BondStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "BondStatus", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static BondStatus from(Object? value) {
    return BondStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "BondStatus", value: value),
    );
  }
}

/// CommissionRates defines the initial commission rates to be used for creating
/// a validator.
class CommissionRates extends CosmosProtoMessage {
  /// rate is the commission rate charged to delegators, as a fraction.
  final String? rate;

  /// max_rate defines the maximum commission rate which validator can ever charge, as a fraction.
  final String? maxRate;

  /// max_change_rate defines the maximum daily increase of the validator commission, as a fraction.
  final String? maxChangeRate;

  const CommissionRates({this.rate, this.maxRate, this.maxChangeRate});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [rate, maxRate, maxChangeRate];

  @override
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'max_rate': maxRate,
      'max_change_rate': maxChangeRate,
    };
  }

  factory CommissionRates.fromJson(Map<String, dynamic> json) {
    return CommissionRates(
      rate: json.valueAsString<String?>('rate', acceptCamelCase: true),
      maxRate: json.valueAsString<String?>('max_rate', acceptCamelCase: true),
      maxChangeRate: json.valueAsString<String?>(
        'max_change_rate',
        acceptCamelCase: true,
      ),
    );
  }

  factory CommissionRates.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CommissionRates(
      rate: decode.getString<String?>(1),
      maxRate: decode.getString<String?>(2),
      maxChangeRate: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1CommissionRates;
}

/// Commission defines commission parameters for a given validator.
class Commission extends CosmosProtoMessage {
  /// commission_rates defines the initial commission rates to be used for creating a validator.
  final CommissionRates? commissionRates;

  /// update_time is the last time the commission rate was changed.
  final google_protobuf_timestamp.Timestamp? updateTime;

  const Commission({this.commissionRates, this.updateTime});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [commissionRates, updateTime];

  @override
  Map<String, dynamic> toJson() {
    return {
      'commission_rates': commissionRates?.toJson(),
      'update_time': updateTime?.toRfc3339(),
    };
  }

  factory Commission.fromJson(Map<String, dynamic> json) {
    return Commission(
      commissionRates: json.valueTo<CommissionRates?, Map<String, dynamic>>(
        key: 'commission_rates',
        parse: (v) => CommissionRates.fromJson(v),
        acceptCamelCase: true,
      ),
      updateTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'update_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Commission.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Commission(
      commissionRates: decode.messageTo<CommissionRates?>(
        1,
        (b) => CommissionRates.deserialize(b),
      ),
      updateTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1Commission;
}

/// Description defines a validator description.
class Description extends CosmosProtoMessage {
  /// moniker defines a human-readable name for the validator.
  final String? moniker;

  /// identity defines an optional identity signature (ex. UPort or Keybase).
  final String? identity;

  /// website defines an optional website link.
  final String? website;

  /// security_contact defines an optional email for security contact.
  final String? securityContact;

  /// details define other optional details.
  final String? details;

  const Description({
    this.moniker,
    this.identity,
    this.website,
    this.securityContact,
    this.details,
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
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    moniker,
    identity,
    website,
    securityContact,
    details,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'moniker': moniker,
      'identity': identity,
      'website': website,
      'security_contact': securityContact,
      'details': details,
    };
  }

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      moniker: json.valueAsString<String?>('moniker', acceptCamelCase: true),
      identity: json.valueAsString<String?>('identity', acceptCamelCase: true),
      website: json.valueAsString<String?>('website', acceptCamelCase: true),
      securityContact: json.valueAsString<String?>(
        'security_contact',
        acceptCamelCase: true,
      ),
      details: json.valueAsString<String?>('details', acceptCamelCase: true),
    );
  }

  factory Description.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Description(
      moniker: decode.getString<String?>(1),
      identity: decode.getString<String?>(2),
      website: decode.getString<String?>(3),
      securityContact: decode.getString<String?>(4),
      details: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1Description;
}

/// Validator defines a validator, together with the total amount of the
/// Validator's bond shares and their exchange rate to coins. Slashing results in
/// a decrease in the exchange rate, allowing correct calculation of future
/// undelegations without iterating over delegators. When coins are delegated to
/// this validator, the validator is credited with a delegation whose number of
/// bond shares is based on the amount of coins delegated divided by the current
/// exchange rate. Voting power can be calculated as total bonded shares
/// multiplied by exchange rate.
class Validator extends CosmosProtoMessage {
  /// operator_address defines the address of the validator's operator; bech encoded in JSON.
  final String? operatorAddress;

  /// consensus_pubkey is the consensus public key of the validator, as a Protobuf Any.
  final google_protobuf_any.Any? consensusPubkey;

  /// jailed defined whether the validator has been jailed from bonded status or not.
  final bool? jailed;

  /// status is the validator status (bonded/unbonding/unbonded).
  final BondStatus? status;

  /// tokens define the delegated tokens (incl. self-delegation).
  final List<cosmos_base_v1beta1_coin.Coin> tokens;

  /// delegator_shares defines total shares issued to a validator's delegators.
  final List<cosmos_base_v1beta1_coin.DecCoin> delegatorShares;

  /// description defines the description terms for the validator.
  final Description? description;

  /// unbonding_height defines, if unbonding, the height at which this validator has begun unbonding.
  final BigInt? unbondingHeight;

  /// unbonding_time defines, if unbonding, the min time for the validator to complete unbonding.
  final google_protobuf_timestamp.Timestamp? unbondingTime;

  /// commission defines the commission parameters.
  final Commission? commission;

  /// voting_powers defines the voting powers for each bond denoms
  final List<cosmos_base_v1beta1_coin.Coin> votingPowers;

  /// voting_power defines the sum of voting powers
  final String? votingPower;

  /// strictly positive if this validator's unbonding has been stopped by external modules
  final BigInt? unbondingOnHoldRefCount;

  /// unbonding id, uniquely identifying an unbonding of this validator
  final BigInt? unbondingId;

  const Validator({
    this.operatorAddress,
    this.consensusPubkey,
    this.jailed,
    this.status,
    this.tokens = const [],
    this.delegatorShares = const [],
    this.description,
    this.unbondingHeight,
    this.unbondingTime,
    this.commission,
    this.votingPowers = const [],
    this.votingPower,
    this.unbondingOnHoldRefCount,
    this.unbondingId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.enumType(4),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.int64(8, options: const []),
        ProtoFieldConfig.message(9, options: const []),
        ProtoFieldConfig.message(10, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.int64(13),
        ProtoFieldConfig.uint64(14),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    operatorAddress,
    consensusPubkey,
    jailed,
    status,
    tokens,
    delegatorShares,
    description,
    unbondingHeight,
    unbondingTime,
    commission,
    votingPowers,
    votingPower,
    unbondingOnHoldRefCount,
    unbondingId,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'operator_address': operatorAddress,
      'consensus_pubkey': consensusPubkey?.toJson(),
      'jailed': jailed,
      'status': status?.protoName,
      'tokens': tokens.map((e) => e.toJson()).toList(),
      'delegator_shares': delegatorShares.map((e) => e.toJson()).toList(),
      'description': description?.toJson(),
      'unbonding_height': unbondingHeight?.toString(),
      'unbonding_time': unbondingTime?.toRfc3339(),
      'commission': commission?.toJson(),
      'voting_powers': votingPowers.map((e) => e.toJson()).toList(),
      'voting_power': votingPower,
      'unbonding_on_hold_ref_count': unbondingOnHoldRefCount?.toString(),
      'unbonding_id': unbondingId?.toString(),
    };
  }

  factory Validator.fromJson(Map<String, dynamic> json) {
    return Validator(
      operatorAddress: json.valueAsString<String?>(
        'operator_address',
        acceptCamelCase: true,
      ),
      consensusPubkey: json
          .valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
            key: 'consensus_pubkey',
            parse: (v) => google_protobuf_any.Any.fromJson(v),
            acceptCamelCase: true,
          ),
      jailed: json.valueAsBool<bool?>('jailed', acceptCamelCase: true),
      status: json.valueTo<BondStatus?, Object?>(
        key: 'status',
        parse: (v) => BondStatus.from(v),
      ),
      tokens:
          (json.valueEnsureAsList<dynamic>('tokens', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      delegatorShares:
          (json.valueEnsureAsList<dynamic>(
                'delegator_shares',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
      description: json.valueTo<Description?, Map<String, dynamic>>(
        key: 'description',
        parse: (v) => Description.fromJson(v),
        acceptCamelCase: true,
      ),
      unbondingHeight: json.valueAsBigInt<BigInt?>(
        'unbonding_height',
        acceptCamelCase: true,
      ),
      unbondingTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'unbonding_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      commission: json.valueTo<Commission?, Map<String, dynamic>>(
        key: 'commission',
        parse: (v) => Commission.fromJson(v),
        acceptCamelCase: true,
      ),
      votingPowers:
          (json.valueEnsureAsList<dynamic>(
                'voting_powers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      votingPower: json.valueAsString<String?>(
        'voting_power',
        acceptCamelCase: true,
      ),
      unbondingOnHoldRefCount: json.valueAsBigInt<BigInt?>(
        'unbonding_on_hold_ref_count',
        acceptCamelCase: true,
      ),
      unbondingId: json.valueAsBigInt<BigInt?>(
        'unbonding_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory Validator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Validator(
      operatorAddress: decode.getString<String?>(1),
      consensusPubkey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      jailed: decode.getBool<bool?>(3),
      status: decode.getEnum<BondStatus?>(4, BondStatus.values),
      tokens:
          decode
              .getListOfBytes(5)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      delegatorShares:
          decode
              .getListOfBytes(6)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
      description: decode.messageTo<Description?>(
        7,
        (b) => Description.deserialize(b),
      ),
      unbondingHeight: decode.getBigInt<BigInt?>(8),
      unbondingTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        9,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      commission: decode.messageTo<Commission?>(
        10,
        (b) => Commission.deserialize(b),
      ),
      votingPowers:
          decode
              .getListOfBytes(11)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      votingPower: decode.getString<String?>(12),
      unbondingOnHoldRefCount: decode.getBigInt<BigInt?>(13),
      unbondingId: decode.getBigInt<BigInt?>(14),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1Validator;
}

/// Delegation represents the bond with tokens held by an account. It is
/// owned by one delegator, and is associated with the voting power of one
/// validator.
class Delegation extends CosmosProtoMessage {
  /// delegator_address is the bech32-encoded address of the delegator.
  final String? delegatorAddress;

  /// validator_address is the bech32-encoded address of the validator.
  final String? validatorAddress;

  /// shares define the delegation shares received.
  final List<cosmos_base_v1beta1_coin.DecCoin> shares;

  const Delegation({
    this.delegatorAddress,
    this.validatorAddress,
    this.shares = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegatorAddress, validatorAddress, shares];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'shares': shares.map((e) => e.toJson()).toList(),
    };
  }

  factory Delegation.fromJson(Map<String, dynamic> json) {
    return Delegation(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      shares:
          (json.valueEnsureAsList<dynamic>('shares', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Delegation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Delegation(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      shares:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1Delegation;
}

/// UnbondingDelegation stores all of a single delegator's unbonding bonds
/// for a single validator in an time-ordered list.
class UnbondingDelegation extends CosmosProtoMessage {
  /// delegator_address is the bech32-encoded address of the delegator.
  final String? delegatorAddress;

  /// validator_address is the bech32-encoded address of the validator.
  final String? validatorAddress;

  /// entries are the unbonding delegation entries.
  final List<UnbondingDelegationEntry> entries;

  const UnbondingDelegation({
    this.delegatorAddress,
    this.validatorAddress,
    this.entries = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    delegatorAddress,
    validatorAddress,
    entries,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_address': validatorAddress,
      'entries': entries.map((e) => e.toJson()).toList(),
    };
  }

  factory UnbondingDelegation.fromJson(Map<String, dynamic> json) {
    return UnbondingDelegation(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsString<String?>(
        'validator_address',
        acceptCamelCase: true,
      ),
      entries:
          (json.valueEnsureAsList<dynamic>('entries', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  UnbondingDelegationEntry,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UnbondingDelegationEntry.fromJson(v)),
              )
              .toList(),
    );
  }

  factory UnbondingDelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UnbondingDelegation(
      delegatorAddress: decode.getString<String?>(1),
      validatorAddress: decode.getString<String?>(2),
      entries:
          decode
              .getListOfBytes(3)
              .map((b) => UnbondingDelegationEntry.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1UnbondingDelegation;
}

/// unbonding delegation entries
/// UnbondingDelegationEntry defines an unbonding object with relevant metadata.
class UnbondingDelegationEntry extends CosmosProtoMessage {
  /// creation_height is the height which the unbonding took place.
  final BigInt? creationHeight;

  /// completion_time is the unix time for unbonding completion.
  final google_protobuf_timestamp.Timestamp? completionTime;

  /// initial_balance defines the tokens initially scheduled to receive at completion.
  final List<cosmos_base_v1beta1_coin.Coin> initialBalance;

  /// balance defines the tokens to receive at completion.
  final List<cosmos_base_v1beta1_coin.Coin> balance;

  /// Incrementing id that uniquely identifies this entry
  final BigInt? unbondingId;

  /// Strictly positive if this entry's unbonding has been stopped by external modules
  final BigInt? unbondingOnHoldRefCount;

  const UnbondingDelegationEntry({
    this.creationHeight,
    this.completionTime,
    this.initialBalance = const [],
    this.balance = const [],
    this.unbondingId,
    this.unbondingOnHoldRefCount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.int64(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    creationHeight,
    completionTime,
    initialBalance,
    balance,
    unbondingId,
    unbondingOnHoldRefCount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creation_height': creationHeight?.toString(),
      'completion_time': completionTime?.toRfc3339(),
      'initial_balance': initialBalance.map((e) => e.toJson()).toList(),
      'balance': balance.map((e) => e.toJson()).toList(),
      'unbonding_id': unbondingId?.toString(),
      'unbonding_on_hold_ref_count': unbondingOnHoldRefCount?.toString(),
    };
  }

  factory UnbondingDelegationEntry.fromJson(Map<String, dynamic> json) {
    return UnbondingDelegationEntry(
      creationHeight: json.valueAsBigInt<BigInt?>(
        'creation_height',
        acceptCamelCase: true,
      ),
      completionTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'completion_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      initialBalance:
          (json.valueEnsureAsList<dynamic>(
                'initial_balance',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      balance:
          (json.valueEnsureAsList<dynamic>('balance', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      unbondingId: json.valueAsBigInt<BigInt?>(
        'unbonding_id',
        acceptCamelCase: true,
      ),
      unbondingOnHoldRefCount: json.valueAsBigInt<BigInt?>(
        'unbonding_on_hold_ref_count',
        acceptCamelCase: true,
      ),
    );
  }

  factory UnbondingDelegationEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UnbondingDelegationEntry(
      creationHeight: decode.getBigInt<BigInt?>(1),
      completionTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      initialBalance:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      balance:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      unbondingId: decode.getBigInt<BigInt?>(5),
      unbondingOnHoldRefCount: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1UnbondingDelegationEntry;
}

/// RedelegationEntry defines a redelegation object with relevant metadata.
class RedelegationEntry extends CosmosProtoMessage {
  /// creation_height  defines the height which the redelegation took place.
  final BigInt? creationHeight;

  /// completion_time defines the unix time for redelegation completion.
  final google_protobuf_timestamp.Timestamp? completionTime;

  /// initial_balance defines the initial balance when redelegation started.
  final List<cosmos_base_v1beta1_coin.Coin> initialBalance;

  /// shares_dst is the amount of destination-validator shares created by redelegation.
  final List<cosmos_base_v1beta1_coin.DecCoin> sharesDst;

  /// Incrementing id that uniquely identifies this entry
  final BigInt? unbondingId;

  /// Strictly positive if this entry's unbonding has been stopped by external modules
  final BigInt? unbondingOnHoldRefCount;

  const RedelegationEntry({
    this.creationHeight,
    this.completionTime,
    this.initialBalance = const [],
    this.sharesDst = const [],
    this.unbondingId,
    this.unbondingOnHoldRefCount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.int64(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    creationHeight,
    completionTime,
    initialBalance,
    sharesDst,
    unbondingId,
    unbondingOnHoldRefCount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'creation_height': creationHeight?.toString(),
      'completion_time': completionTime?.toRfc3339(),
      'initial_balance': initialBalance.map((e) => e.toJson()).toList(),
      'shares_dst': sharesDst.map((e) => e.toJson()).toList(),
      'unbonding_id': unbondingId?.toString(),
      'unbonding_on_hold_ref_count': unbondingOnHoldRefCount?.toString(),
    };
  }

  factory RedelegationEntry.fromJson(Map<String, dynamic> json) {
    return RedelegationEntry(
      creationHeight: json.valueAsBigInt<BigInt?>(
        'creation_height',
        acceptCamelCase: true,
      ),
      completionTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'completion_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      initialBalance:
          (json.valueEnsureAsList<dynamic>(
                'initial_balance',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      sharesDst:
          (json.valueEnsureAsList<dynamic>('shares_dst', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
      unbondingId: json.valueAsBigInt<BigInt?>(
        'unbonding_id',
        acceptCamelCase: true,
      ),
      unbondingOnHoldRefCount: json.valueAsBigInt<BigInt?>(
        'unbonding_on_hold_ref_count',
        acceptCamelCase: true,
      ),
    );
  }

  factory RedelegationEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RedelegationEntry(
      creationHeight: decode.getBigInt<BigInt?>(1),
      completionTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      initialBalance:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      sharesDst:
          decode
              .getListOfBytes(4)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
      unbondingId: decode.getBigInt<BigInt?>(5),
      unbondingOnHoldRefCount: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1RedelegationEntry;
}

/// Redelegation contains the list of a particular delegator's redelegating bonds
/// from a particular source validator to a particular destination validator.
class Redelegation extends CosmosProtoMessage {
  /// delegator_address is the bech32-encoded address of the delegator.
  final String? delegatorAddress;

  /// validator_src_address is the validator redelegation source operator address.
  final String? validatorSrcAddress;

  /// validator_dst_address is the validator redelegation destination operator address.
  final String? validatorDstAddress;

  /// entries are the redelegation entries.
  final List<RedelegationEntry> entries;

  const Redelegation({
    this.delegatorAddress,
    this.validatorSrcAddress,
    this.validatorDstAddress,
    this.entries = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    delegatorAddress,
    validatorSrcAddress,
    validatorDstAddress,
    entries,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegator_address': delegatorAddress,
      'validator_src_address': validatorSrcAddress,
      'validator_dst_address': validatorDstAddress,
      'entries': entries.map((e) => e.toJson()).toList(),
    };
  }

  factory Redelegation.fromJson(Map<String, dynamic> json) {
    return Redelegation(
      delegatorAddress: json.valueAsString<String?>(
        'delegator_address',
        acceptCamelCase: true,
      ),
      validatorSrcAddress: json.valueAsString<String?>(
        'validator_src_address',
        acceptCamelCase: true,
      ),
      validatorDstAddress: json.valueAsString<String?>(
        'validator_dst_address',
        acceptCamelCase: true,
      ),
      entries:
          (json.valueEnsureAsList<dynamic>('entries', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<RedelegationEntry, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => RedelegationEntry.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory Redelegation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Redelegation(
      delegatorAddress: decode.getString<String?>(1),
      validatorSrcAddress: decode.getString<String?>(2),
      validatorDstAddress: decode.getString<String?>(3),
      entries:
          decode
              .getListOfBytes(4)
              .map((b) => RedelegationEntry.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1Redelegation;
}

/// redelegation entries
/// Params defines the parameters for the staking module.
class Params extends CosmosProtoMessage {
  /// unbonding_time is the time duration of unbonding.
  final google_protobuf_duration.Duration? unbondingTime;

  /// max_validators is the maximum number of validators.
  final int? maxValidators;

  /// max_entries is the max entries for either unbonding delegation or redelegation (per pair/trio).
  final int? maxEntries;

  /// historical_entries is the number of historical entries to persist.
  final int? historicalEntries;

  /// bond_denoms defines the bondable coin denomination.
  final List<String> bondDenoms;

  /// minimum voting power is the chain-wide minimum voting power to get into power update whitelist
  final BigInt? minVotingPower;

  /// min_commission_rate is the chain-wide minimum commission rate that a validator can charge their delegators
  final String? minCommissionRate;

  const Params({
    this.unbondingTime,
    this.maxValidators,
    this.maxEntries,
    this.historicalEntries,
    this.bondDenoms = const [],
    this.minVotingPower,
    this.minCommissionRate,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.uint32(2, options: const []),
        ProtoFieldConfig.uint32(3, options: const []),
        ProtoFieldConfig.uint32(4, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.uint64(6, options: const []),
        ProtoFieldConfig.string(
          7,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    unbondingTime,
    maxValidators,
    maxEntries,
    historicalEntries,
    bondDenoms,
    minVotingPower,
    minCommissionRate,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'unbonding_time': unbondingTime?.encodeString(asNanos: true),
      'max_validators': maxValidators,
      'max_entries': maxEntries,
      'historical_entries': historicalEntries,
      'bond_denoms': bondDenoms.map((e) => e).toList(),
      'min_voting_power': minVotingPower?.toString(),
      'min_commission_rate': minCommissionRate,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      unbondingTime: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'unbonding_time',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      maxValidators: json.valueAsInt<int?>(
        'max_validators',
        acceptCamelCase: true,
      ),
      maxEntries: json.valueAsInt<int?>('max_entries', acceptCamelCase: true),
      historicalEntries: json.valueAsInt<int?>(
        'historical_entries',
        acceptCamelCase: true,
      ),
      bondDenoms:
          (json.valueEnsureAsList<dynamic>(
            'bond_denoms',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      minVotingPower: json.valueAsBigInt<BigInt?>(
        'min_voting_power',
        acceptCamelCase: true,
      ),
      minCommissionRate: json.valueAsString<String?>(
        'min_commission_rate',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      unbondingTime: decode.messageTo<google_protobuf_duration.Duration?>(
        1,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      maxValidators: decode.getInt<int?>(2),
      maxEntries: decode.getInt<int?>(3),
      historicalEntries: decode.getInt<int?>(4),
      bondDenoms: decode.getListOrEmpty<String>(5),
      minVotingPower: decode.getBigInt<BigInt?>(6),
      minCommissionRate: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1Params;
}

/// DelegationResponse is equivalent to Delegation except that it contains a
/// balance in addition to shares which is more suitable for client responses.
class DelegationResponse extends CosmosProtoMessage {
  final Delegation? delegation;

  final List<cosmos_base_v1beta1_coin.Coin> balance;

  const DelegationResponse({this.delegation, this.balance = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [delegation, balance];

  @override
  Map<String, dynamic> toJson() {
    return {
      'delegation': delegation?.toJson(),
      'balance': balance.map((e) => e.toJson()).toList(),
    };
  }

  factory DelegationResponse.fromJson(Map<String, dynamic> json) {
    return DelegationResponse(
      delegation: json.valueTo<Delegation?, Map<String, dynamic>>(
        key: 'delegation',
        parse: (v) => Delegation.fromJson(v),
        acceptCamelCase: true,
      ),
      balance:
          (json.valueEnsureAsList<dynamic>('balance', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory DelegationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DelegationResponse(
      delegation: decode.messageTo<Delegation?>(
        1,
        (b) => Delegation.deserialize(b),
      ),
      balance:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1DelegationResponse;
}

/// RedelegationEntryResponse is equivalent to a RedelegationEntry except that it
/// contains a balance in addition to shares which is more suitable for client
/// responses.
class RedelegationEntryResponse extends CosmosProtoMessage {
  final RedelegationEntry? redelegationEntry;

  final List<cosmos_base_v1beta1_coin.Coin> balance;

  const RedelegationEntryResponse({
    this.redelegationEntry,
    this.balance = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [redelegationEntry, balance];

  @override
  Map<String, dynamic> toJson() {
    return {
      'redelegation_entry': redelegationEntry?.toJson(),
      'balance': balance.map((e) => e.toJson()).toList(),
    };
  }

  factory RedelegationEntryResponse.fromJson(Map<String, dynamic> json) {
    return RedelegationEntryResponse(
      redelegationEntry: json.valueTo<RedelegationEntry?, Map<String, dynamic>>(
        key: 'redelegation_entry',
        parse: (v) => RedelegationEntry.fromJson(v),
        acceptCamelCase: true,
      ),
      balance:
          (json.valueEnsureAsList<dynamic>('balance', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory RedelegationEntryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RedelegationEntryResponse(
      redelegationEntry: decode.messageTo<RedelegationEntry?>(
        1,
        (b) => RedelegationEntry.deserialize(b),
      ),
      balance:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1RedelegationEntryResponse;
}

/// RedelegationResponse is equivalent to a Redelegation except that its entries
/// contain a balance in addition to shares which is more suitable for client
/// responses.
class RedelegationResponse extends CosmosProtoMessage {
  final Redelegation? redelegation;

  final List<RedelegationEntryResponse> entries;

  const RedelegationResponse({this.redelegation, this.entries = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [redelegation, entries];

  @override
  Map<String, dynamic> toJson() {
    return {
      'redelegation': redelegation?.toJson(),
      'entries': entries.map((e) => e.toJson()).toList(),
    };
  }

  factory RedelegationResponse.fromJson(Map<String, dynamic> json) {
    return RedelegationResponse(
      redelegation: json.valueTo<Redelegation?, Map<String, dynamic>>(
        key: 'redelegation',
        parse: (v) => Redelegation.fromJson(v),
        acceptCamelCase: true,
      ),
      entries:
          (json.valueEnsureAsList<dynamic>('entries', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  RedelegationEntryResponse,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => RedelegationEntryResponse.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory RedelegationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RedelegationResponse(
      redelegation: decode.messageTo<Redelegation?>(
        1,
        (b) => Redelegation.deserialize(b),
      ),
      entries:
          decode
              .getListOfBytes(2)
              .map((b) => RedelegationEntryResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1RedelegationResponse;
}

/// Pool is used for tracking bonded and not-bonded token supply of the bond
/// denomination.
class Pool extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> notBondedTokens;

  final List<cosmos_base_v1beta1_coin.Coin> bondedTokens;

  final List<cosmos_base_v1beta1_coin.DecCoin> votingPowerWeights;

  const Pool({
    this.notBondedTokens = const [],
    this.bondedTokens = const [],
    this.votingPowerWeights = const [],
  });

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
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    notBondedTokens,
    bondedTokens,
    votingPowerWeights,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'not_bonded_tokens': notBondedTokens.map((e) => e.toJson()).toList(),
      'bonded_tokens': bondedTokens.map((e) => e.toJson()).toList(),
      'voting_power_weights':
          votingPowerWeights.map((e) => e.toJson()).toList(),
    };
  }

  factory Pool.fromJson(Map<String, dynamic> json) {
    return Pool(
      notBondedTokens:
          (json.valueEnsureAsList<dynamic>(
                'not_bonded_tokens',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      bondedTokens:
          (json.valueEnsureAsList<dynamic>(
                'bonded_tokens',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      votingPowerWeights:
          (json.valueEnsureAsList<dynamic>(
                'voting_power_weights',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Pool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Pool(
      notBondedTokens:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      bondedTokens:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      votingPowerWeights:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMstakingV1Pool;
}
