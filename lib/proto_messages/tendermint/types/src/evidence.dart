import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/tendermint/types/src/types.dart"
    as tendermint_types_types;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/validator.dart"
    as tendermint_types_validator;

class Evidence extends CosmosProtoMessage {
  final DuplicateVoteEvidence? duplicateVoteEvidence;

  final LightClientAttackEvidence? lightClientAttackEvidence;

  const Evidence({this.duplicateVoteEvidence, this.lightClientAttackEvidence});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [
    duplicateVoteEvidence,
    lightClientAttackEvidence,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'duplicate_vote_evidence': duplicateVoteEvidence?.toJson(),
      'light_client_attack_evidence': lightClientAttackEvidence?.toJson(),
    };
  }

  factory Evidence.fromJson(Map<String, dynamic> json) {
    return Evidence(
      duplicateVoteEvidence: json
          .valueTo<DuplicateVoteEvidence?, Map<String, dynamic>>(
            key: 'duplicate_vote_evidence',
            parse: (v) => DuplicateVoteEvidence.fromJson(v),
            acceptCamelCase: true,
          ),
      lightClientAttackEvidence: json
          .valueTo<LightClientAttackEvidence?, Map<String, dynamic>>(
            key: 'light_client_attack_evidence',
            parse: (v) => LightClientAttackEvidence.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Evidence.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Evidence(
      duplicateVoteEvidence: decode.messageTo<DuplicateVoteEvidence?>(
        1,
        (b) => DuplicateVoteEvidence.deserialize(b),
      ),
      lightClientAttackEvidence: decode.messageTo<LightClientAttackEvidence?>(
        2,
        (b) => LightClientAttackEvidence.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesEvidence;
}

/// DuplicateVoteEvidence contains evidence of a validator signed two conflicting votes.
class DuplicateVoteEvidence extends CosmosProtoMessage {
  final tendermint_types_types.Vote? voteA;

  final tendermint_types_types.Vote? voteB;

  final BigInt? totalVotingPower;

  final BigInt? validatorPower;

  final google_protobuf_timestamp.Timestamp? timestamp;

  const DuplicateVoteEvidence({
    this.voteA,
    this.voteB,
    this.totalVotingPower,
    this.validatorPower,
    this.timestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    voteA,
    voteB,
    totalVotingPower,
    validatorPower,
    timestamp,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'vote_a': voteA?.toJson(),
      'vote_b': voteB?.toJson(),
      'total_voting_power': totalVotingPower?.toString(),
      'validator_power': validatorPower?.toString(),
      'timestamp': timestamp?.toRfc3339(),
    };
  }

  factory DuplicateVoteEvidence.fromJson(Map<String, dynamic> json) {
    return DuplicateVoteEvidence(
      voteA: json.valueTo<tendermint_types_types.Vote?, Map<String, dynamic>>(
        key: 'vote_a',
        parse: (v) => tendermint_types_types.Vote.fromJson(v),
        acceptCamelCase: true,
      ),
      voteB: json.valueTo<tendermint_types_types.Vote?, Map<String, dynamic>>(
        key: 'vote_b',
        parse: (v) => tendermint_types_types.Vote.fromJson(v),
        acceptCamelCase: true,
      ),
      totalVotingPower: json.valueAsBigInt<BigInt?>(
        'total_voting_power',
        acceptCamelCase: true,
      ),
      validatorPower: json.valueAsBigInt<BigInt?>(
        'validator_power',
        acceptCamelCase: true,
      ),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory DuplicateVoteEvidence.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DuplicateVoteEvidence(
      voteA: decode.messageTo<tendermint_types_types.Vote?>(
        1,
        (b) => tendermint_types_types.Vote.deserialize(b),
      ),
      voteB: decode.messageTo<tendermint_types_types.Vote?>(
        2,
        (b) => tendermint_types_types.Vote.deserialize(b),
      ),
      totalVotingPower: decode.getBigInt<BigInt?>(3),
      validatorPower: decode.getBigInt<BigInt?>(4),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesDuplicateVoteEvidence;
}

/// LightClientAttackEvidence contains evidence of a set of validators attempting to mislead a light client.
class LightClientAttackEvidence extends CosmosProtoMessage {
  final tendermint_types_types.LightBlock? conflictingBlock;

  final BigInt? commonHeight;

  final List<tendermint_types_validator.Validator> byzantineValidators;

  final BigInt? totalVotingPower;

  final google_protobuf_timestamp.Timestamp? timestamp;

  const LightClientAttackEvidence({
    this.conflictingBlock,
    this.commonHeight,
    this.byzantineValidators = const [],
    this.totalVotingPower,
    this.timestamp,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.message(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    conflictingBlock,
    commonHeight,
    byzantineValidators,
    totalVotingPower,
    timestamp,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'conflicting_block': conflictingBlock?.toJson(),
      'common_height': commonHeight?.toString(),
      'byzantine_validators':
          byzantineValidators.map((e) => e.toJson()).toList(),
      'total_voting_power': totalVotingPower?.toString(),
      'timestamp': timestamp?.toRfc3339(),
    };
  }

  factory LightClientAttackEvidence.fromJson(Map<String, dynamic> json) {
    return LightClientAttackEvidence(
      conflictingBlock: json
          .valueTo<tendermint_types_types.LightBlock?, Map<String, dynamic>>(
            key: 'conflicting_block',
            parse: (v) => tendermint_types_types.LightBlock.fromJson(v),
            acceptCamelCase: true,
          ),
      commonHeight: json.valueAsBigInt<BigInt?>(
        'common_height',
        acceptCamelCase: true,
      ),
      byzantineValidators:
          (json.valueEnsureAsList<dynamic>(
                'byzantine_validators',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  tendermint_types_validator.Validator,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => tendermint_types_validator.Validator.fromJson(v),
                ),
              )
              .toList(),
      totalVotingPower: json.valueAsBigInt<BigInt?>(
        'total_voting_power',
        acceptCamelCase: true,
      ),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory LightClientAttackEvidence.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LightClientAttackEvidence(
      conflictingBlock: decode.messageTo<tendermint_types_types.LightBlock?>(
        1,
        (b) => tendermint_types_types.LightBlock.deserialize(b),
      ),
      commonHeight: decode.getBigInt<BigInt?>(2),
      byzantineValidators:
          decode
              .getListOfBytes(3)
              .map((b) => tendermint_types_validator.Validator.deserialize(b))
              .toList(),
      totalVotingPower: decode.getBigInt<BigInt?>(4),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesLightClientAttackEvidence;
}

class EvidenceList extends CosmosProtoMessage {
  final List<Evidence> evidence;

  const EvidenceList({this.evidence = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [evidence];

  @override
  Map<String, dynamic> toJson() {
    return {'evidence': evidence.map((e) => e.toJson()).toList()};
  }

  factory EvidenceList.fromJson(Map<String, dynamic> json) {
    return EvidenceList(
      evidence:
          (json.valueEnsureAsList<dynamic>('evidence', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Evidence, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Evidence.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory EvidenceList.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EvidenceList(
      evidence:
          decode.getListOfBytes(1).map((b) => Evidence.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesEvidenceList;
}
