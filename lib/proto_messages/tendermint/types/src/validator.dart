import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/tendermint/crypto/src/keys.dart"
    as tendermint_crypto_keys;

/// BlockIdFlag indicates which BlockID the signature is for
enum BlockIDFlag implements ProtoEnumVariant {
  blockIdFlagUnknown(0, 'BLOCK_ID_FLAG_UNKNOWN'),

  /// indicates an error condition
  blockIdFlagAbsent(1, 'BLOCK_ID_FLAG_ABSENT'),

  /// the vote was not received
  blockIdFlagCommit(2, 'BLOCK_ID_FLAG_COMMIT'),

  /// voted for the block that received the majority
  blockIdFlagNil(3, 'BLOCK_ID_FLAG_NIL');

  const BlockIDFlag(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static BlockIDFlag fromValue(int? value) {
    value ??= 0;
    return BlockIDFlag.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching BlockIDFlag found for the given value. $value",
                details: {"name": "BlockIDFlag", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static BlockIDFlag from(Object? value) {
    value ??= 0;
    return BlockIDFlag.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching BlockIDFlag found for the given value. $value",
                details: {"name": "BlockIDFlag", "value": value?.toString()},
              ),
    );
  }
}

/// voted for nil
class ValidatorSet extends CosmosProtoMessage {
  final List<Validator> validators;

  final Validator? proposer;

  final BigInt? totalVotingPower;

  const ValidatorSet({
    this.validators = const [],
    this.proposer,
    this.totalVotingPower,
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
        ),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [validators, proposer, totalVotingPower];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'validators': validators.map((e) => config.encodeMessage(e)).toList(),
      'proposer': config.encodeMessage(proposer),
      'total_voting_power': config.encodeBigint(totalVotingPower),
    };
  }

  factory ValidatorSet.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ValidatorSet(
      validators:
          (json.valueEnsureAsList<dynamic>(
                'validators',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Validator, Object>(
                  value: e,
                  parse:
                      (v) => Validator.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      proposer: json.valueTo<Validator?, Object>(
        key: 'proposer',
        parse: (v) => Validator.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      totalVotingPower: json.valueAsBigInt<BigInt?>(
        'total_voting_power',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ValidatorSet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorSet(
      validators:
          decode
              .getListOfBytes(1)
              .map((b) => Validator.deserialize(b))
              .toList(),
      proposer: decode.messageTo<Validator?>(
        2,
        (b) => Validator.deserialize(b),
      ),
      totalVotingPower: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesValidatorSet;
}

class Validator extends CosmosProtoMessage {
  final BuBytes? address;

  final tendermint_crypto_keys.PublicKey? pubKey;

  final BigInt? votingPower;

  final BigInt? proposerPriority;

  Validator({
    List<int>? address,
    this.pubKey,
    this.votingPower,
    this.proposerPriority,
  }) : address = address?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.int64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    pubKey,
    votingPower,
    proposerPriority,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': config.encodeBinary(address),
      'pub_key': config.encodeMessage(pubKey),
      'voting_power': config.encodeBigint(votingPower),
      'proposer_priority': config.encodeBigint(proposerPriority),
    };
  }

  factory Validator.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Validator(
      address: config.decodeBinary<List<int>?>(
        json.valueAs('address', normalizeKeyLookup: config.normalizeKeys),
      ),
      pubKey: json.valueTo<tendermint_crypto_keys.PublicKey?, Object>(
        key: 'pub_key',
        parse:
            (v) => tendermint_crypto_keys.PublicKey.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      votingPower: json.valueAsBigInt<BigInt?>(
        'voting_power',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proposerPriority: json.valueAsBigInt<BigInt?>(
        'proposer_priority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Validator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Validator(
      address: decode.getBytes<List<int>?>(1),
      pubKey: decode.messageTo<tendermint_crypto_keys.PublicKey?>(
        2,
        (b) => tendermint_crypto_keys.PublicKey.deserialize(b),
      ),
      votingPower: decode.getBigInt<BigInt?>(3),
      proposerPriority: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesValidator;
}
