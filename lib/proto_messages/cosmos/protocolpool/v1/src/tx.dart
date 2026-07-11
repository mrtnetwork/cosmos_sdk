import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/cosmos/protocolpool/v1/src/types.dart"
    as cosmos_protocolpool_v1_types;

/// MsgFundCommunityPool allows an account to directly
/// fund the community pool.
class MsgFundCommunityPool extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgFundCommunityPoolResponse> {
  final String? depositor;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgFundCommunityPool({this.depositor, this.amount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "depositor"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [depositor, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'depositor': depositor,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgFundCommunityPool.fromJson(Map<String, dynamic> json) {
    return MsgFundCommunityPool(
      depositor: json.valueAsString<String?>(
        'depositor',
        acceptCamelCase: true,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
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

  factory MsgFundCommunityPool.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgFundCommunityPool(
      depositor: decode.getString<String?>(1),
      amount:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1MsgFundCommunityPool;
  @override
  MsgFundCommunityPoolResponse onServiceResponse(List<int> bytes) {
    return MsgFundCommunityPoolResponse.deserialize(bytes);
  }

  @override
  MsgFundCommunityPoolResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgFundCommunityPoolResponse.fromJson(json);
  }
}

/// MsgFundCommunityPoolResponse defines the Msg/FundCommunityPool response type.
class MsgFundCommunityPoolResponse extends CosmosProtoMessage {
  const MsgFundCommunityPoolResponse();

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

  factory MsgFundCommunityPoolResponse.fromJson(Map<String, dynamic> json) {
    return MsgFundCommunityPoolResponse();
  }

  factory MsgFundCommunityPoolResponse.deserialize(List<int> bytes) {
    return MsgFundCommunityPoolResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosProtocolpoolV1MsgFundCommunityPoolResponse;
}

/// MsgCommunityPoolSpend defines a message for sending tokens from the community
/// pool to another account. This message is typically executed via a governance
/// proposal with the governance module being the executing authority.
class MsgCommunityPoolSpend extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCommunityPoolSpendResponse> {
  /// Authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  final String? recipient;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const MsgCommunityPoolSpend({
    this.authority,
    this.recipient,
    this.amount = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, recipient, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'recipient': recipient,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgCommunityPoolSpend.fromJson(Map<String, dynamic> json) {
    return MsgCommunityPoolSpend(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      recipient: json.valueAsString<String?>(
        'recipient',
        acceptCamelCase: true,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
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

  factory MsgCommunityPoolSpend.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCommunityPoolSpend(
      authority: decode.getString<String?>(1),
      recipient: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1MsgCommunityPoolSpend;
  @override
  MsgCommunityPoolSpendResponse onServiceResponse(List<int> bytes) {
    return MsgCommunityPoolSpendResponse.deserialize(bytes);
  }

  @override
  MsgCommunityPoolSpendResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCommunityPoolSpendResponse.fromJson(json);
  }
}

/// MsgCommunityPoolSpendResponse defines the response to executing a
/// MsgCommunityPoolSpend message.
class MsgCommunityPoolSpendResponse extends CosmosProtoMessage {
  const MsgCommunityPoolSpendResponse();

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

  factory MsgCommunityPoolSpendResponse.fromJson(Map<String, dynamic> json) {
    return MsgCommunityPoolSpendResponse();
  }

  factory MsgCommunityPoolSpendResponse.deserialize(List<int> bytes) {
    return MsgCommunityPoolSpendResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosProtocolpoolV1MsgCommunityPoolSpendResponse;
}

/// MsgCreateContinuousFund defines a message for adding continuous funds.
class MsgCreateContinuousFund extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCreateContinuousFundResponse> {
  /// Authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// Recipient address of the account receiving funds.
  final String? recipient;

  /// Percentage is the percentage of funds to be allocated from Community pool.
  final String? percentage;

  /// Optional, if expiry is set, removes the state object when expired.
  final google_protobuf_timestamp.Timestamp? expiry;

  const MsgCreateContinuousFund({
    this.authority,
    this.recipient,
    this.percentage,
    this.expiry,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, recipient, percentage, expiry];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'recipient': recipient,
      'percentage': percentage,
      'expiry': expiry?.toRfc3339(),
    };
  }

  factory MsgCreateContinuousFund.fromJson(Map<String, dynamic> json) {
    return MsgCreateContinuousFund(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      recipient: json.valueAsString<String?>(
        'recipient',
        acceptCamelCase: true,
      ),
      percentage: json.valueAsString<String?>(
        'percentage',
        acceptCamelCase: true,
      ),
      expiry: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'expiry',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateContinuousFund.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateContinuousFund(
      authority: decode.getString<String?>(1),
      recipient: decode.getString<String?>(2),
      percentage: decode.getString<String?>(3),
      expiry: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1MsgCreateContinuousFund;
  @override
  MsgCreateContinuousFundResponse onServiceResponse(List<int> bytes) {
    return MsgCreateContinuousFundResponse.deserialize(bytes);
  }

  @override
  MsgCreateContinuousFundResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCreateContinuousFundResponse.fromJson(json);
  }
}

/// MsgCreateContinuousFundResponse defines the response to executing a
/// MsgCreateContinuousFund message.
class MsgCreateContinuousFundResponse extends CosmosProtoMessage {
  const MsgCreateContinuousFundResponse();

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

  factory MsgCreateContinuousFundResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateContinuousFundResponse();
  }

  factory MsgCreateContinuousFundResponse.deserialize(List<int> bytes) {
    return MsgCreateContinuousFundResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosProtocolpoolV1MsgCreateContinuousFundResponse;
}

/// MsgCancelContinuousFund defines a message to cancel continuous funds for a specific recipient.
class MsgCancelContinuousFund extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCancelContinuousFundResponse> {
  /// Authority is the account address of authority.
  final String? authority;

  /// Recipient is the account address string of the recipient whose funds are to be cancelled.
  final String? recipient;

  const MsgCancelContinuousFund({this.authority, this.recipient});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, recipient];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'recipient': recipient};
  }

  factory MsgCancelContinuousFund.fromJson(Map<String, dynamic> json) {
    return MsgCancelContinuousFund(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      recipient: json.valueAsString<String?>(
        'recipient',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCancelContinuousFund.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelContinuousFund(
      authority: decode.getString<String?>(1),
      recipient: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1MsgCancelContinuousFund;
  @override
  MsgCancelContinuousFundResponse onServiceResponse(List<int> bytes) {
    return MsgCancelContinuousFundResponse.deserialize(bytes);
  }

  @override
  MsgCancelContinuousFundResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgCancelContinuousFundResponse.fromJson(json);
  }
}

/// MsgCancelContinuousFundResponse defines the response to executing a
/// MsgCancelContinuousFund message.
class MsgCancelContinuousFundResponse extends CosmosProtoMessage {
  /// CanceledTime is the canceled time.
  final google_protobuf_timestamp.Timestamp? canceledTime;

  /// CanceledHeight defines the canceled block height.
  final BigInt? canceledHeight;

  /// Recipient is the account address string of the recipient whose funds are cancelled.
  final String? recipient;

  const MsgCancelContinuousFundResponse({
    this.canceledTime,
    this.canceledHeight,
    this.recipient,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [canceledTime, canceledHeight, recipient];

  @override
  Map<String, dynamic> toJson() {
    return {
      'canceled_time': canceledTime?.toRfc3339(),
      'canceled_height': canceledHeight?.toString(),
      'recipient': recipient,
    };
  }

  factory MsgCancelContinuousFundResponse.fromJson(Map<String, dynamic> json) {
    return MsgCancelContinuousFundResponse(
      canceledTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'canceled_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      canceledHeight: json.valueAsBigInt<BigInt?>(
        'canceled_height',
        acceptCamelCase: true,
      ),
      recipient: json.valueAsString<String?>(
        'recipient',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCancelContinuousFundResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelContinuousFundResponse(
      canceledTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        1,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      canceledHeight: decode.getBigInt<BigInt?>(2),
      recipient: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosProtocolpoolV1MsgCancelContinuousFundResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/protocolpool parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final cosmos_protocolpool_v1_types.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json
          .valueTo<cosmos_protocolpool_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => cosmos_protocolpool_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<cosmos_protocolpool_v1_types.Params?>(
        2,
        (b) => cosmos_protocolpool_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

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

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosProtocolpoolV1MsgUpdateParamsResponse;
}
