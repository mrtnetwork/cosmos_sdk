import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// BridgeValidator represents a validator's ETH address and its power
class BridgeValidator extends CosmosProtoMessage {
  final BigInt? power;

  final String? ethereumAddress;

  const BridgeValidator({this.power, this.ethereumAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [power, ethereumAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'power': power?.toString(), 'ethereum_address': ethereumAddress};
  }

  factory BridgeValidator.fromJson(Map<String, dynamic> json) {
    return BridgeValidator(
      power: json.valueAsBigInt<BigInt?>('power', acceptCamelCase: true),
      ethereumAddress: json.valueAsString<String?>(
        'ethereum_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory BridgeValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BridgeValidator(
      power: decode.getBigInt<BigInt?>(1),
      ethereumAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1BridgeValidator;
}

/// Valset is the Ethereum Bridge Multsig Set, each peggy validator also
/// maintains an ETH key to sign messages, these are used to check signatures on
/// ETH because of the significant gas savings
class Valset extends CosmosProtoMessage {
  final BigInt? nonce;

  final List<BridgeValidator> members;

  final BigInt? height;

  final String? rewardAmount;

  /// the reward token in it's Ethereum hex address representation
  final String? rewardToken;

  const Valset({
    this.nonce,
    this.members = const [],
    this.height,
    this.rewardAmount,
    this.rewardToken,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    nonce,
    members,
    height,
    rewardAmount,
    rewardToken,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'nonce': nonce?.toString(),
      'members': members.map((e) => e.toJson()).toList(),
      'height': height?.toString(),
      'reward_amount': rewardAmount,
      'reward_token': rewardToken,
    };
  }

  factory Valset.fromJson(Map<String, dynamic> json) {
    return Valset(
      nonce: json.valueAsBigInt<BigInt?>('nonce', acceptCamelCase: true),
      members:
          (json.valueEnsureAsList<dynamic>('members', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<BridgeValidator, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => BridgeValidator.fromJson(v),
                    ),
              )
              .toList(),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      rewardAmount: json.valueAsString<String?>(
        'reward_amount',
        acceptCamelCase: true,
      ),
      rewardToken: json.valueAsString<String?>(
        'reward_token',
        acceptCamelCase: true,
      ),
    );
  }

  factory Valset.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Valset(
      nonce: decode.getBigInt<BigInt?>(1),
      members:
          decode
              .getListOfBytes(2)
              .map((b) => BridgeValidator.deserialize(b))
              .toList(),
      height: decode.getBigInt<BigInt?>(3),
      rewardAmount: decode.getString<String?>(4),
      rewardToken: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1Valset;
}

/// LastClaimEvent stores last claim event details of validator.
class LastClaimEvent extends CosmosProtoMessage {
  final BigInt? ethereumEventNonce;

  final BigInt? ethereumEventHeight;

  const LastClaimEvent({this.ethereumEventNonce, this.ethereumEventHeight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [ethereumEventNonce, ethereumEventHeight];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ethereum_event_nonce': ethereumEventNonce?.toString(),
      'ethereum_event_height': ethereumEventHeight?.toString(),
    };
  }

  factory LastClaimEvent.fromJson(Map<String, dynamic> json) {
    return LastClaimEvent(
      ethereumEventNonce: json.valueAsBigInt<BigInt?>(
        'ethereum_event_nonce',
        acceptCamelCase: true,
      ),
      ethereumEventHeight: json.valueAsBigInt<BigInt?>(
        'ethereum_event_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory LastClaimEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LastClaimEvent(
      ethereumEventNonce: decode.getBigInt<BigInt?>(1),
      ethereumEventHeight: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1LastClaimEvent;
}

/// This records the relationship between an ERC20 token and the denom
/// of the corresponding Cosmos originated asset
class ERC20ToDenom extends CosmosProtoMessage {
  final String? erc20;

  final String? denom;

  const ERC20ToDenom({this.erc20, this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [erc20, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'erc20': erc20, 'denom': denom};
  }

  factory ERC20ToDenom.fromJson(Map<String, dynamic> json) {
    return ERC20ToDenom(
      erc20: json.valueAsString<String?>('erc20', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory ERC20ToDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ERC20ToDenom(
      erc20: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1ERC20ToDenom;
}
