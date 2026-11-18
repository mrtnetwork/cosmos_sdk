import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/applications/interchain_accounts/host/v1/src/host.dart"
    as ibc_applications_interchain_accounts_host_v1_host;

/// MsgUpdateParams defines the payload for Msg/UpdateParams
class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// signer address
  final String? signer;

  /// params defines the 27-interchain-accounts/host parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final ibc_applications_interchain_accounts_host_v1_host.Params? params;

  const MsgUpdateParams({this.signer, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, params];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'signer': signer, 'params': config.encodeMessage(params)};
  }

  factory MsgUpdateParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParams(
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      params: json.valueTo<
        ibc_applications_interchain_accounts_host_v1_host.Params?,
        Object
      >(
        key: 'params',
        parse:
            (v) => ibc_applications_interchain_accounts_host_v1_host
                .Params.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      signer: decode.getString<String?>(1),
      params: decode
          .messageTo<ibc_applications_interchain_accounts_host_v1_host.Params?>(
            2,
            (b) => ibc_applications_interchain_accounts_host_v1_host
                .Params.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsHostV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response for Msg/UpdateParams
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsHostV1MsgUpdateParamsResponse;
}

/// MsgModuleQuerySafe defines the payload for Msg/ModuleQuerySafe
class MsgModuleQuerySafe extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgModuleQuerySafeResponse> {
  /// signer address
  final String? signer;

  /// requests defines the module safe queries to execute.
  final List<ibc_applications_interchain_accounts_host_v1_host.QueryRequest>
  requests;

  const MsgModuleQuerySafe({this.signer, this.requests = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, requests];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'signer': signer,
      'requests': requests.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgModuleQuerySafe.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgModuleQuerySafe(
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      requests:
          (json.valueEnsureAsList<dynamic>(
                'requests',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ibc_applications_interchain_accounts_host_v1_host.QueryRequest,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => ibc_applications_interchain_accounts_host_v1_host
                          .QueryRequest.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory MsgModuleQuerySafe.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgModuleQuerySafe(
      signer: decode.getString<String?>(1),
      requests:
          decode
              .getListOfBytes(2)
              .map(
                (b) => ibc_applications_interchain_accounts_host_v1_host
                    .QueryRequest.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsHostV1MsgModuleQuerySafe;
  @override
  MsgModuleQuerySafeResponse onServiceResponse(List<int> bytes) {
    return MsgModuleQuerySafeResponse.deserialize(bytes);
  }

  @override
  MsgModuleQuerySafeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgModuleQuerySafeResponse.fromJson(json);
  }
}

/// MsgModuleQuerySafeResponse defines the response for Msg/ModuleQuerySafe
class MsgModuleQuerySafeResponse extends CosmosProtoMessage {
  /// height at which the responses were queried
  final BigInt? height;

  /// protobuf encoded responses for each query
  final List<BuBytes> responses;

  MsgModuleQuerySafeResponse({
    this.height,
    List<List<int>> responses = const [],
  }) : responses = responses.map((e) => e.asImmutableBytes).toImutableList;

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
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, responses];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': config.encodeBigint(height),
      'responses': responses.map((e) => config.encodeBinary(e)).toList(),
    };
  }

  factory MsgModuleQuerySafeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgModuleQuerySafeResponse(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      responses:
          (json.valueEnsureAsList<dynamic>(
            'responses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => config.decodeBinary<List<int>>(e)).toList(),
    );
  }

  factory MsgModuleQuerySafeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgModuleQuerySafeResponse(
      height: decode.getBigInt<BigInt?>(1),
      responses: decode.getListOfBytes(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsHostV1MsgModuleQuerySafeResponse;
}
