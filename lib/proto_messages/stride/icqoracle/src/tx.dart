import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/icqoracle/src/icqoracle.dart"
    as stride_icqoracle_icqoracle;

/// MsgRegisterTokenPriceQuery defines the message for adding a new token to
/// track prices
class MsgRegisterTokenPriceQuery extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterTokenPriceQueryResponse>,
        ICosmosProtoAminoMessage {
  final String? admin;

  /// Token denom on Stride
  final String? baseDenom;

  /// Quote denom on Stride
  final String? quoteDenom;

  /// Token denom on Osmosis
  final String? osmosisBaseDenom;

  /// Quote denom on Osmosis
  final String? osmosisQuoteDenom;

  /// Pool ID on Osmosis
  final BigInt? osmosisPoolId;

  const MsgRegisterTokenPriceQuery({
    this.admin,
    this.baseDenom,
    this.quoteDenom,
    this.osmosisBaseDenom,
    this.osmosisQuoteDenom,
    this.osmosisPoolId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "icqoracle/MsgRegisterTokenPriceQuery",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.uint64(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    baseDenom,
    quoteDenom,
    osmosisBaseDenom,
    osmosisQuoteDenom,
    osmosisPoolId,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'osmosis_base_denom': osmosisBaseDenom,
      'osmosis_quote_denom': osmosisQuoteDenom,
      'osmosis_pool_id': osmosisPoolId?.toString(),
    };
  }

  factory MsgRegisterTokenPriceQuery.fromJson(Map<String, dynamic> json) {
    return MsgRegisterTokenPriceQuery(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      osmosisBaseDenom: json.valueAsString<String?>(
        'osmosis_base_denom',
        acceptCamelCase: true,
      ),
      osmosisQuoteDenom: json.valueAsString<String?>(
        'osmosis_quote_denom',
        acceptCamelCase: true,
      ),
      osmosisPoolId: json.valueAsBigInt<BigInt?>(
        'osmosis_pool_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRegisterTokenPriceQuery.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterTokenPriceQuery(
      admin: decode.getString<String?>(1),
      baseDenom: decode.getString<String?>(2),
      quoteDenom: decode.getString<String?>(3),
      osmosisBaseDenom: decode.getString<String?>(4),
      osmosisQuoteDenom: decode.getString<String?>(5),
      osmosisPoolId: decode.getBigInt<BigInt?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleMsgRegisterTokenPriceQuery;
  @override
  MsgRegisterTokenPriceQueryResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterTokenPriceQueryResponse.deserialize(bytes);
  }

  @override
  MsgRegisterTokenPriceQueryResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterTokenPriceQueryResponse.fromJson(json);
  }
}

class MsgRegisterTokenPriceQueryResponse extends CosmosProtoMessage {
  const MsgRegisterTokenPriceQueryResponse();

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

  factory MsgRegisterTokenPriceQueryResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterTokenPriceQueryResponse();
  }

  factory MsgRegisterTokenPriceQueryResponse.deserialize(List<int> bytes) {
    return MsgRegisterTokenPriceQueryResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideIcqoracleMsgRegisterTokenPriceQueryResponse;
}

/// MsgRemoveTokenPriceQuery defines the message for removing a token from price
/// tracking
class MsgRemoveTokenPriceQuery extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveTokenPriceQueryResponse>,
        ICosmosProtoAminoMessage {
  final String? admin;

  /// Token denom on Stride
  final String? baseDenom;

  /// Quote denom on Stride
  final String? quoteDenom;

  /// Pool ID on Osmosis
  final BigInt? osmosisPoolId;

  const MsgRemoveTokenPriceQuery({
    this.admin,
    this.baseDenom,
    this.quoteDenom,
    this.osmosisPoolId,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "admin"),
        ProtoOptionString(
          name: "amino.name",
          value: "icqoracle/MsgRemoveTokenPriceQuery",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    admin,
    baseDenom,
    quoteDenom,
    osmosisPoolId,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'base_denom': baseDenom,
      'quote_denom': quoteDenom,
      'osmosis_pool_id': osmosisPoolId?.toString(),
    };
  }

  factory MsgRemoveTokenPriceQuery.fromJson(Map<String, dynamic> json) {
    return MsgRemoveTokenPriceQuery(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
      baseDenom: json.valueAsString<String?>(
        'base_denom',
        acceptCamelCase: true,
      ),
      quoteDenom: json.valueAsString<String?>(
        'quote_denom',
        acceptCamelCase: true,
      ),
      osmosisPoolId: json.valueAsBigInt<BigInt?>(
        'osmosis_pool_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRemoveTokenPriceQuery.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveTokenPriceQuery(
      admin: decode.getString<String?>(1),
      baseDenom: decode.getString<String?>(2),
      quoteDenom: decode.getString<String?>(3),
      osmosisPoolId: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleMsgRemoveTokenPriceQuery;
  @override
  MsgRemoveTokenPriceQueryResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveTokenPriceQueryResponse.deserialize(bytes);
  }

  @override
  MsgRemoveTokenPriceQueryResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveTokenPriceQueryResponse.fromJson(json);
  }
}

class MsgRemoveTokenPriceQueryResponse extends CosmosProtoMessage {
  const MsgRemoveTokenPriceQueryResponse();

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

  factory MsgRemoveTokenPriceQueryResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveTokenPriceQueryResponse();
  }

  factory MsgRemoveTokenPriceQueryResponse.deserialize(List<int> bytes) {
    return MsgRemoveTokenPriceQueryResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleMsgRemoveTokenPriceQueryResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless
  /// overwritten).
  final String? authority;

  /// params defines the x/icqoracle parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final stride_icqoracle_icqoracle.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "icqoracle/MsgUpdateParams",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
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
          .valueTo<stride_icqoracle_icqoracle.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => stride_icqoracle_icqoracle.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<stride_icqoracle_icqoracle.Params?>(
        2,
        (b) => stride_icqoracle_icqoracle.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideIcqoracleMsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.strideIcqoracleMsgUpdateParamsResponse;
}
