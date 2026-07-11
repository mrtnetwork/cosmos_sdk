import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/wasmx/v1/src/wasmx.dart"
    as injective_wasmx_v1_wasmx;
import "package:cosmos_sdk/proto_messages/injective/wasmx/v1/src/genesis.dart"
    as injective_wasmx_v1_genesis;

/// QueryWasmxParamsRequest is the request type for the Query/WasmxParams RPC
/// method.
class QueryWasmxParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryWasmxParamsResponse> {
  const QueryWasmxParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/wasmx/v1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryWasmxParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryWasmxParamsRequest();
  }

  factory QueryWasmxParamsRequest.deserialize(List<int> bytes) {
    return QueryWasmxParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1QueryWasmxParamsRequest;
  @override
  QueryWasmxParamsResponse onQueryResponse(List<int> bytes) {
    return QueryWasmxParamsResponse.deserialize(bytes);
  }

  @override
  QueryWasmxParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryWasmxParamsResponse.fromJson(json);
  }
}

/// QueryWasmxParamsRequest is the response type for the Query/WasmxParams RPC
/// method.
class QueryWasmxParamsResponse extends CosmosProtoMessage {
  final injective_wasmx_v1_wasmx.Params? params;

  const QueryWasmxParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryWasmxParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryWasmxParamsResponse(
      params: json
          .valueTo<injective_wasmx_v1_wasmx.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => injective_wasmx_v1_wasmx.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryWasmxParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryWasmxParamsResponse(
      params: decode.messageTo<injective_wasmx_v1_wasmx.Params?>(
        1,
        (b) => injective_wasmx_v1_wasmx.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1QueryWasmxParamsResponse;
}

/// QueryModuleStateRequest is the request type for the Query/WasmxModuleState
/// RPC method.
class QueryModuleStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleStateResponse> {
  const QueryModuleStateRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/wasmx/v1/module_state",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryModuleStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateRequest();
  }

  factory QueryModuleStateRequest.deserialize(List<int> bytes) {
    return QueryModuleStateRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1QueryModuleStateRequest;
  @override
  QueryModuleStateResponse onQueryResponse(List<int> bytes) {
    return QueryModuleStateResponse.deserialize(bytes);
  }

  @override
  QueryModuleStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse.fromJson(json);
  }
}

/// QueryModuleStateResponse is the response type for the Query/WasmxModuleState
/// RPC method.
class QueryModuleStateResponse extends CosmosProtoMessage {
  final injective_wasmx_v1_genesis.GenesisState? state;

  const QueryModuleStateResponse({this.state});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [state];

  @override
  Map<String, dynamic> toJson() {
    return {'state': state?.toJson()};
  }

  factory QueryModuleStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleStateResponse(
      state: json.valueTo<
        injective_wasmx_v1_genesis.GenesisState?,
        Map<String, dynamic>
      >(
        key: 'state',
        parse: (v) => injective_wasmx_v1_genesis.GenesisState.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryModuleStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleStateResponse(
      state: decode.messageTo<injective_wasmx_v1_genesis.GenesisState?>(
        1,
        (b) => injective_wasmx_v1_genesis.GenesisState.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1QueryModuleStateResponse;
}

/// Contract registration info
class QueryContractRegistrationInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractRegistrationInfoResponse> {
  final String? contractAddress;

  const QueryContractRegistrationInfoRequest({this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/wasmx/v1/registration_info/{contract_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'contract_address': contractAddress};
  }

  factory QueryContractRegistrationInfoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryContractRegistrationInfoRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryContractRegistrationInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractRegistrationInfoRequest(
      contractAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveWasmxV1QueryContractRegistrationInfoRequest;
  @override
  QueryContractRegistrationInfoResponse onQueryResponse(List<int> bytes) {
    return QueryContractRegistrationInfoResponse.deserialize(bytes);
  }

  @override
  QueryContractRegistrationInfoResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryContractRegistrationInfoResponse.fromJson(json);
  }
}

class QueryContractRegistrationInfoResponse extends CosmosProtoMessage {
  final injective_wasmx_v1_wasmx.RegisteredContract? contract;

  const QueryContractRegistrationInfoResponse({this.contract});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [contract];

  @override
  Map<String, dynamic> toJson() {
    return {'contract': contract?.toJson()};
  }

  factory QueryContractRegistrationInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryContractRegistrationInfoResponse(
      contract: json.valueTo<
        injective_wasmx_v1_wasmx.RegisteredContract?,
        Map<String, dynamic>
      >(
        key: 'contract',
        parse: (v) => injective_wasmx_v1_wasmx.RegisteredContract.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryContractRegistrationInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractRegistrationInfoResponse(
      contract: decode.messageTo<injective_wasmx_v1_wasmx.RegisteredContract?>(
        1,
        (b) => injective_wasmx_v1_wasmx.RegisteredContract.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveWasmxV1QueryContractRegistrationInfoResponse;
}
