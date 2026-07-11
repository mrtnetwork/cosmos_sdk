import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

class MsgSetAirdropAllocations extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetAirdropAllocationsResponse>,
        ICosmosProtoAminoMessage {
  final String? allocator;

  final String? airdropIdentifier;

  final List<String> users;

  final List<String> weights;

  const MsgSetAirdropAllocations({
    this.allocator,
    this.airdropIdentifier,
    this.users = const [],
    this.weights = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "allocator"),
        ProtoOptionString(
          name: "amino.name",
          value: "claim/MsgSetAirdropAllocations",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    allocator,
    airdropIdentifier,
    users,
    weights,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'allocator': allocator,
      'airdrop_identifier': airdropIdentifier,
      'users': users.map((e) => e).toList(),
      'weights': weights.map((e) => e).toList(),
    };
  }

  factory MsgSetAirdropAllocations.fromJson(Map<String, dynamic> json) {
    return MsgSetAirdropAllocations(
      allocator: json.valueAsString<String?>(
        'allocator',
        acceptCamelCase: true,
      ),
      airdropIdentifier: json.valueAsString<String?>(
        'airdrop_identifier',
        acceptCamelCase: true,
      ),
      users:
          (json.valueEnsureAsList<dynamic>(
            'users',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      weights:
          (json.valueEnsureAsList<dynamic>(
            'weights',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgSetAirdropAllocations.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetAirdropAllocations(
      allocator: decode.getString<String?>(1),
      airdropIdentifier: decode.getString<String?>(2),
      users: decode.getListOrEmpty<String>(3),
      weights: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimMsgSetAirdropAllocations;
  @override
  MsgSetAirdropAllocationsResponse onServiceResponse(List<int> bytes) {
    return MsgSetAirdropAllocationsResponse.deserialize(bytes);
  }

  @override
  MsgSetAirdropAllocationsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetAirdropAllocationsResponse.fromJson(json);
  }
}

class MsgSetAirdropAllocationsResponse extends CosmosProtoMessage {
  const MsgSetAirdropAllocationsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgSetAirdropAllocationsResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetAirdropAllocationsResponse();
  }

  factory MsgSetAirdropAllocationsResponse.deserialize(List<int> bytes) {
    return MsgSetAirdropAllocationsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimMsgSetAirdropAllocationsResponse;
}

class MsgClaimFreeAmount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClaimFreeAmountResponse>,
        ICosmosProtoAminoMessage {
  final String? user;

  const MsgClaimFreeAmount({this.user});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "user"),
        ProtoOptionString(
          name: "amino.name",
          value: "claim/MsgClaimFreeAmount",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [user];

  @override
  Map<String, dynamic> toJson() {
    return {'user': user};
  }

  factory MsgClaimFreeAmount.fromJson(Map<String, dynamic> json) {
    return MsgClaimFreeAmount(
      user: json.valueAsString<String?>('user', acceptCamelCase: true),
    );
  }

  factory MsgClaimFreeAmount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimFreeAmount(user: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimMsgClaimFreeAmount;
  @override
  MsgClaimFreeAmountResponse onServiceResponse(List<int> bytes) {
    return MsgClaimFreeAmountResponse.deserialize(bytes);
  }

  @override
  MsgClaimFreeAmountResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClaimFreeAmountResponse.fromJson(json);
  }
}

class MsgClaimFreeAmountResponse extends CosmosProtoMessage {
  final List<cosmos_base_v1beta1_coin.Coin> claimedAmount;

  const MsgClaimFreeAmountResponse({this.claimedAmount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [claimedAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'claimed_amount': claimedAmount.map((e) => e.toJson()).toList()};
  }

  factory MsgClaimFreeAmountResponse.fromJson(Map<String, dynamic> json) {
    return MsgClaimFreeAmountResponse(
      claimedAmount:
          (json.valueEnsureAsList<dynamic>(
                'claimed_amount',
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
    );
  }

  factory MsgClaimFreeAmountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimFreeAmountResponse(
      claimedAmount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimMsgClaimFreeAmountResponse;
}

class MsgCreateAirdrop extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateAirdropResponse>,
        ICosmosProtoAminoMessage {
  final String? distributor;

  final String? identifier;

  final String? chainId;

  final String? denom;

  final BigInt? startTime;

  final BigInt? duration;

  final bool? autopilotEnabled;

  const MsgCreateAirdrop({
    this.distributor,
    this.identifier,
    this.chainId,
    this.denom,
    this.startTime,
    this.duration,
    this.autopilotEnabled,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "distributor"),
        ProtoOptionString(name: "amino.name", value: "claim/MsgCreateAirdrop"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.bool(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    distributor,
    identifier,
    chainId,
    denom,
    startTime,
    duration,
    autopilotEnabled,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'distributor': distributor,
      'identifier': identifier,
      'chain_id': chainId,
      'denom': denom,
      'start_time': startTime?.toString(),
      'duration': duration?.toString(),
      'autopilot_enabled': autopilotEnabled,
    };
  }

  factory MsgCreateAirdrop.fromJson(Map<String, dynamic> json) {
    return MsgCreateAirdrop(
      distributor: json.valueAsString<String?>(
        'distributor',
        acceptCamelCase: true,
      ),
      identifier: json.valueAsString<String?>(
        'identifier',
        acceptCamelCase: true,
      ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      startTime: json.valueAsBigInt<BigInt?>(
        'start_time',
        acceptCamelCase: true,
      ),
      duration: json.valueAsBigInt<BigInt?>('duration', acceptCamelCase: true),
      autopilotEnabled: json.valueAsBool<bool?>(
        'autopilot_enabled',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateAirdrop.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateAirdrop(
      distributor: decode.getString<String?>(1),
      identifier: decode.getString<String?>(2),
      chainId: decode.getString<String?>(6),
      denom: decode.getString<String?>(5),
      startTime: decode.getBigInt<BigInt?>(3),
      duration: decode.getBigInt<BigInt?>(4),
      autopilotEnabled: decode.getBool<bool?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimMsgCreateAirdrop;
  @override
  MsgCreateAirdropResponse onServiceResponse(List<int> bytes) {
    return MsgCreateAirdropResponse.deserialize(bytes);
  }

  @override
  MsgCreateAirdropResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateAirdropResponse.fromJson(json);
  }
}

class MsgCreateAirdropResponse extends CosmosProtoMessage {
  const MsgCreateAirdropResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgCreateAirdropResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateAirdropResponse();
  }

  factory MsgCreateAirdropResponse.deserialize(List<int> bytes) {
    return MsgCreateAirdropResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimMsgCreateAirdropResponse;
}

class MsgDeleteAirdrop extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDeleteAirdropResponse>,
        ICosmosProtoAminoMessage {
  final String? distributor;

  final String? identifier;

  const MsgDeleteAirdrop({this.distributor, this.identifier});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "distributor"),
        ProtoOptionString(name: "amino.name", value: "claim/MsgDeleteAirdrop"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [distributor, identifier];

  @override
  Map<String, dynamic> toJson() {
    return {'distributor': distributor, 'identifier': identifier};
  }

  factory MsgDeleteAirdrop.fromJson(Map<String, dynamic> json) {
    return MsgDeleteAirdrop(
      distributor: json.valueAsString<String?>(
        'distributor',
        acceptCamelCase: true,
      ),
      identifier: json.valueAsString<String?>(
        'identifier',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgDeleteAirdrop.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeleteAirdrop(
      distributor: decode.getString<String?>(1),
      identifier: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimMsgDeleteAirdrop;
  @override
  MsgDeleteAirdropResponse onServiceResponse(List<int> bytes) {
    return MsgDeleteAirdropResponse.deserialize(bytes);
  }

  @override
  MsgDeleteAirdropResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDeleteAirdropResponse.fromJson(json);
  }
}

class MsgDeleteAirdropResponse extends CosmosProtoMessage {
  const MsgDeleteAirdropResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgDeleteAirdropResponse.fromJson(Map<String, dynamic> json) {
    return MsgDeleteAirdropResponse();
  }

  factory MsgDeleteAirdropResponse.deserialize(List<int> bytes) {
    return MsgDeleteAirdropResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideClaimMsgDeleteAirdropResponse;
}
