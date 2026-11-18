import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/secret/compute/v1beta1/src/params.dart"
    as secret_compute_v1beta1_params;
import "package:cosmos_sdk/proto_messages/secret/compute/v1beta1/src/types.dart"
    as secret_compute_v1beta1_types;

/// ParamsRequest is the request type for the Query/Params RPC method.
class ParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<ParamsResponse> {
  const ParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/params",
        ),
      ],
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

  factory ParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ParamsRequest();
  }

  factory ParamsRequest.deserialize(List<int> bytes) {
    return ParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1ParamsRequest;
  @override
  ParamsResponse onQueryResponse(List<int> bytes) {
    return ParamsResponse.deserialize(bytes);
  }

  @override
  ParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return ParamsResponse.fromJson(json);
  }
}

/// ParamsResponse is the response type for the Query/Params RPC method.
class ParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final secret_compute_v1beta1_params.Params? params;

  const ParamsResponse({this.params});

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'params': config.encodeMessage(params)};
  }

  factory ParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ParamsResponse(
      params: json.valueTo<secret_compute_v1beta1_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => secret_compute_v1beta1_params.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ParamsResponse(
      params: decode.messageTo<secret_compute_v1beta1_params.Params?>(
        1,
        (b) => secret_compute_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1ParamsResponse;
}

class QuerySecretContractRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySecretContractResponse> {
  /// address is the bech32 human readable address of the contract
  final String? contractAddress;

  final BuBytes? query;

  QuerySecretContractRequest({this.contractAddress, List<int>? query})
    : query = query?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/query/{contract_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress, query];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'contract_address': contractAddress,
      'query': config.encodeBinary(query),
    };
  }

  factory QuerySecretContractRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySecretContractRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      query: config.decodeBinary<List<int>?>(
        json.valueAs('query', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QuerySecretContractRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySecretContractRequest(
      contractAddress: decode.getString<String?>(1),
      query: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QuerySecretContractRequest;
  @override
  QuerySecretContractResponse onQueryResponse(List<int> bytes) {
    return QuerySecretContractResponse.deserialize(bytes);
  }

  @override
  QuerySecretContractResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySecretContractResponse.fromJson(json);
  }
}

class QueryByLabelRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractAddressResponse> {
  final String? label;

  const QueryByLabelRequest({this.label});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/contract_address/{label}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [label];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'label': label};
  }

  factory QueryByLabelRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryByLabelRequest(
      label: json.valueAsString<String?>(
        'label',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryByLabelRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryByLabelRequest(label: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryByLabelRequest;
  @override
  QueryContractAddressResponse onQueryResponse(List<int> bytes) {
    return QueryContractAddressResponse.deserialize(bytes);
  }

  @override
  QueryContractAddressResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContractAddressResponse.fromJson(json);
  }
}

class QueryByContractAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractInfoResponse> {
  /// address is the bech32 human readable address of the contract
  final String? contractAddress;

  const QueryByContractAddressRequest({this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/info/{contract_address}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path:
              "/compute/v1beta1/code_hash/by_contract_address/{contract_address}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/label/{contract_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'contract_address': contractAddress};
  }

  factory QueryByContractAddressRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryByContractAddressRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryByContractAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryByContractAddressRequest(
      contractAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryByContractAddressRequest;
  @override
  QueryContractInfoResponse onQueryResponse(List<int> bytes) {
    return QueryContractInfoResponse.deserialize(bytes);
  }

  @override
  QueryContractInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContractInfoResponse.fromJson(json);
  }
}

class QueryByCodeIdRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractsByCodeIdResponse> {
  final BigInt? codeId;

  const QueryByCodeIdRequest({this.codeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/contracts/{code_id}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/code/{code_id}",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/code_hash/by_code_id/{code_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [codeId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'code_id': config.encodeBigint(codeId)};
  }

  factory QueryByCodeIdRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryByCodeIdRequest(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryByCodeIdRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryByCodeIdRequest(codeId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryByCodeIdRequest;
  @override
  QueryContractsByCodeIdResponse onQueryResponse(List<int> bytes) {
    return QueryContractsByCodeIdResponse.deserialize(bytes);
  }

  @override
  QueryContractsByCodeIdResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryContractsByCodeIdResponse.fromJson(json);
  }
}

class QuerySecretContractResponse extends CosmosProtoMessage {
  final BuBytes? data;

  QuerySecretContractResponse({List<int>? data})
    : data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [data];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'data': config.encodeBinary(data)};
  }

  factory QuerySecretContractResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySecretContractResponse(
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QuerySecretContractResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySecretContractResponse(data: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QuerySecretContractResponse;
}

/// QueryContractInfoResponse is the response type for the Query/ContractInfo RPC
/// method
class QueryContractInfoResponse extends CosmosProtoMessage {
  /// contract_address is the bech32 human readable address of the contract
  final String? contractAddress;

  final secret_compute_v1beta1_types.ContractInfo? contractInfo;

  const QueryContractInfoResponse({this.contractAddress, this.contractInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress, contractInfo];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'contract_address': contractAddress,
      'contract_info': config.encodeMessage(contractInfo),
    };
  }

  factory QueryContractInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractInfoResponse(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      contractInfo: json
          .valueTo<secret_compute_v1beta1_types.ContractInfo?, Object>(
            key: 'contract_info',
            parse:
                (v) => secret_compute_v1beta1_types.ContractInfo.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryContractInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractInfoResponse(
      contractAddress: decode.getString<String?>(1),
      contractInfo: decode
          .messageTo<secret_compute_v1beta1_types.ContractInfo?>(
            2,
            (b) => secret_compute_v1beta1_types.ContractInfo.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryContractInfoResponse;
}

/// ContractInfoWithAddress adds the contract address to the ContractInfo
/// representation
class ContractInfoWithAddress extends CosmosProtoMessage {
  /// contract_address is the bech32 human readable address of the contract
  final String? contractAddress;

  final secret_compute_v1beta1_types.ContractInfo? contractInfo;

  const ContractInfoWithAddress({this.contractAddress, this.contractInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress, contractInfo];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'contract_address': contractAddress,
      'contract_info': config.encodeMessage(contractInfo),
    };
  }

  factory ContractInfoWithAddress.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ContractInfoWithAddress(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      contractInfo: json
          .valueTo<secret_compute_v1beta1_types.ContractInfo?, Object>(
            key: 'contract_info',
            parse:
                (v) => secret_compute_v1beta1_types.ContractInfo.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory ContractInfoWithAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContractInfoWithAddress(
      contractAddress: decode.getString<String?>(1),
      contractInfo: decode
          .messageTo<secret_compute_v1beta1_types.ContractInfo?>(
            2,
            (b) => secret_compute_v1beta1_types.ContractInfo.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1ContractInfoWithAddress;
}

class QueryContractsByCodeIdResponse extends CosmosProtoMessage {
  final List<ContractInfoWithAddress> contractInfos;

  const QueryContractsByCodeIdResponse({this.contractInfos = const []});

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
  List<Object?> get protoValues => [contractInfos];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'contract_infos':
          contractInfos.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryContractsByCodeIdResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractsByCodeIdResponse(
      contractInfos:
          (json.valueEnsureAsList<dynamic>(
                'contract_infos',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<ContractInfoWithAddress, Object>(
                  value: e,
                  parse:
                      (v) => ContractInfoWithAddress.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryContractsByCodeIdResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractsByCodeIdResponse(
      contractInfos:
          decode
              .getListOfBytes(1)
              .map((b) => ContractInfoWithAddress.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryContractsByCodeIdResponse;
}

class CodeInfoResponse extends CosmosProtoMessage {
  final BigInt? codeId;

  /// creator is the bech32 human readable address of the contract
  final String? creator;

  final String? codeHash;

  final String? source;

  final String? builder;

  const CodeInfoResponse({
    this.codeId,
    this.creator,
    this.codeHash,
    this.source,
    this.builder,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeId, creator, codeHash, source, builder];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_id': config.encodeBigint(codeId),
      'creator': creator,
      'code_hash': codeHash,
      'source': source,
      'builder': builder,
    };
  }

  factory CodeInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CodeInfoResponse(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      creator: json.valueAsString<String?>(
        'creator',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      codeHash: json.valueAsString<String?>(
        'code_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      source: json.valueAsString<String?>(
        'source',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      builder: json.valueAsString<String?>(
        'builder',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory CodeInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CodeInfoResponse(
      codeId: decode.getBigInt<BigInt?>(1),
      creator: decode.getString<String?>(2),
      codeHash: decode.getString<String?>(3),
      source: decode.getString<String?>(4),
      builder: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1CodeInfoResponse;
}

class QueryCodeResponse extends CosmosProtoMessage {
  final CodeInfoResponse? codeInfo;

  final BuBytes? wasm;

  QueryCodeResponse({this.codeInfo, List<int>? wasm})
    : wasm = wasm?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.bytes(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeInfo, wasm];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_info': config.encodeMessage(codeInfo),
      'wasm': config.encodeBinary(wasm),
    };
  }

  factory QueryCodeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodeResponse(
      codeInfo: json.valueTo<CodeInfoResponse?, Object>(
        key: 'code_info',
        parse:
            (v) => CodeInfoResponse.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      wasm: config.decodeBinary<List<int>?>(
        json.valueAs('wasm', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodeResponse(
      codeInfo: decode.messageTo<CodeInfoResponse?>(
        1,
        (b) => CodeInfoResponse.deserialize(b),
      ),
      wasm: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryCodeResponse;
}

class QueryCodesResponse extends CosmosProtoMessage {
  final List<CodeInfoResponse> codeInfos;

  const QueryCodesResponse({this.codeInfos = const []});

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
  List<Object?> get protoValues => [codeInfos];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_infos': codeInfos.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryCodesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodesResponse(
      codeInfos:
          (json.valueEnsureAsList<dynamic>(
                'code_infos',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<CodeInfoResponse, Object>(
                  value: e,
                  parse:
                      (v) => CodeInfoResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryCodesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodesResponse(
      codeInfos:
          decode
              .getListOfBytes(1)
              .map((b) => CodeInfoResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryCodesResponse;
}

class QueryContractAddressResponse extends CosmosProtoMessage {
  /// address is the bech32 human readable address of the contract
  final String? contractAddress;

  const QueryContractAddressResponse({this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'contract_address': contractAddress};
  }

  factory QueryContractAddressResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractAddressResponse(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryContractAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractAddressResponse(
      contractAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryContractAddressResponse;
}

class QueryContractLabelResponse extends CosmosProtoMessage {
  final String? label;

  const QueryContractLabelResponse({this.label});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [label];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'label': label};
  }

  factory QueryContractLabelResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractLabelResponse(
      label: json.valueAsString<String?>(
        'label',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryContractLabelResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractLabelResponse(label: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryContractLabelResponse;
}

class QueryCodeHashResponse extends CosmosProtoMessage {
  final String? codeHash;

  const QueryCodeHashResponse({this.codeHash});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [codeHash];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'code_hash': codeHash};
  }

  factory QueryCodeHashResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodeHashResponse(
      codeHash: json.valueAsString<String?>(
        'code_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCodeHashResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodeHashResponse(codeHash: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryCodeHashResponse;
}

/// QueryContractHistoryRequest is the request type for the Query/ContractHistory
/// RPC method
class QueryContractHistoryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractHistoryResponse> {
  /// address is the address of the contract to query
  final String? contractAddress;

  const QueryContractHistoryRequest({this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/contract_history/{contract_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'contract_address': contractAddress};
  }

  factory QueryContractHistoryRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractHistoryRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryContractHistoryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractHistoryRequest(
      contractAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryContractHistoryRequest;
  @override
  QueryContractHistoryResponse onQueryResponse(List<int> bytes) {
    return QueryContractHistoryResponse.deserialize(bytes);
  }

  @override
  QueryContractHistoryResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContractHistoryResponse.fromJson(json);
  }
}

/// QueryContractHistoryResponse is the response type for the
/// Query/ContractHistory RPC method
class QueryContractHistoryResponse extends CosmosProtoMessage {
  final List<secret_compute_v1beta1_types.ContractCodeHistoryEntry> entries;

  const QueryContractHistoryResponse({this.entries = const []});

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
  List<Object?> get protoValues => [entries];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'entries': entries.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryContractHistoryResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractHistoryResponse(
      entries:
          (json.valueEnsureAsList<dynamic>(
                'entries',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  secret_compute_v1beta1_types.ContractCodeHistoryEntry,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => secret_compute_v1beta1_types
                          .ContractCodeHistoryEntry.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryContractHistoryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractHistoryResponse(
      entries:
          decode
              .getListOfBytes(1)
              .map(
                (b) => secret_compute_v1beta1_types
                    .ContractCodeHistoryEntry.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryContractHistoryResponse;
}

class QueryAuthorizedMigrationRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAuthorizedMigrationResponse> {
  /// Contract address to query
  final String? contractAddress;

  const QueryAuthorizedMigrationRequest({this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/authorized_migration/{contract_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'contract_address': contractAddress};
  }

  factory QueryAuthorizedMigrationRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAuthorizedMigrationRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAuthorizedMigrationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuthorizedMigrationRequest(
      contractAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryAuthorizedMigrationRequest;
  @override
  QueryAuthorizedMigrationResponse onQueryResponse(List<int> bytes) {
    return QueryAuthorizedMigrationResponse.deserialize(bytes);
  }

  @override
  QueryAuthorizedMigrationResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuthorizedMigrationResponse.fromJson(json);
  }
}

class QueryAuthorizedMigrationResponse extends CosmosProtoMessage {
  /// Authorized code ID (if any)
  final BigInt? newCodeId;

  const QueryAuthorizedMigrationResponse({this.newCodeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [newCodeId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'new_code_id': config.encodeBigint(newCodeId)};
  }

  factory QueryAuthorizedMigrationResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAuthorizedMigrationResponse(
      newCodeId: json.valueAsBigInt<BigInt?>(
        'new_code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAuthorizedMigrationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuthorizedMigrationResponse(
      newCodeId: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryAuthorizedMigrationResponse;
}

class QueryAuthorizedAdminUpdateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAuthorizedAdminUpdateResponse> {
  /// Contract address to query
  final String? contractAddress;

  const QueryAuthorizedAdminUpdateRequest({this.contractAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/authorized_admin_update/{contract_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'contract_address': contractAddress};
  }

  factory QueryAuthorizedAdminUpdateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAuthorizedAdminUpdateRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAuthorizedAdminUpdateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuthorizedAdminUpdateRequest(
      contractAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryAuthorizedAdminUpdateRequest;
  @override
  QueryAuthorizedAdminUpdateResponse onQueryResponse(List<int> bytes) {
    return QueryAuthorizedAdminUpdateResponse.deserialize(bytes);
  }

  @override
  QueryAuthorizedAdminUpdateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuthorizedAdminUpdateResponse.fromJson(json);
  }
}

class QueryAuthorizedAdminUpdateResponse extends CosmosProtoMessage {
  /// Authorized new admin address (empty string if removing admin, or if no authorization)
  final String? newAdmin;

  const QueryAuthorizedAdminUpdateResponse({this.newAdmin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [newAdmin];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'new_admin': newAdmin};
  }

  factory QueryAuthorizedAdminUpdateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAuthorizedAdminUpdateResponse(
      newAdmin: json.valueAsString<String?>(
        'new_admin',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAuthorizedAdminUpdateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuthorizedAdminUpdateResponse(
      newAdmin: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryAuthorizedAdminUpdateResponse;
}

/// QueryEcallRecordRequest is the request type for the Query/EcallRecord RPC method
class QueryEcallRecordRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEcallRecordResponse> {
  /// Block height to query ecall record for
  final BigInt? height;

  const QueryEcallRecordRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/ecall/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height)};
  }

  factory QueryEcallRecordRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEcallRecordRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryEcallRecordRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEcallRecordRequest(height: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryEcallRecordRequest;
  @override
  QueryEcallRecordResponse onQueryResponse(List<int> bytes) {
    return QueryEcallRecordResponse.deserialize(bytes);
  }

  @override
  QueryEcallRecordResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEcallRecordResponse.fromJson(json);
  }
}

/// QueryEcallRecordResponse is the response type for the Query/EcallRecord RPC method
class QueryEcallRecordResponse extends CosmosProtoMessage {
  /// Block height
  final BigInt? height;

  /// Random seed from SubmitBlockSignatures (32 bytes)
  final BuBytes? randomSeed;

  /// Validator set evidence from SubmitBlockSignatures (32 bytes)
  final BuBytes? validatorSetEvidence;

  QueryEcallRecordResponse({
    this.height,
    List<int>? randomSeed,
    List<int>? validatorSetEvidence,
  }) : randomSeed = randomSeed?.asImmutableBytes,
       validatorSetEvidence = validatorSetEvidence?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, randomSeed, validatorSetEvidence];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': config.encodeBigint(height),
      'random_seed': config.encodeBinary(randomSeed),
      'validator_set_evidence': config.encodeBinary(validatorSetEvidence),
    };
  }

  factory QueryEcallRecordResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEcallRecordResponse(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      randomSeed: config.decodeBinary<List<int>?>(
        json.valueAs('random_seed', normalizeKeyLookup: config.normalizeKeys),
      ),
      validatorSetEvidence: config.decodeBinary<List<int>?>(
        json.valueAs(
          'validator_set_evidence',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory QueryEcallRecordResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEcallRecordResponse(
      height: decode.getBigInt<BigInt?>(1),
      randomSeed: decode.getBytes<List<int>?>(2),
      validatorSetEvidence: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryEcallRecordResponse;
}

/// QueryNetworkPubkeyRequest is the request type for the Query/NetworkPubkey RPC
class QueryNetworkPubkeyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNetworkPubkeyResponse> {
  /// Block height to query network pubkey for
  final BigInt? height;

  /// Seed index
  final int? iSeed;

  const QueryNetworkPubkeyRequest({this.height, this.iSeed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/network_pubkey/{height}/{i_seed}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.uint32(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, iSeed];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height), 'i_seed': iSeed};
  }

  factory QueryNetworkPubkeyRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNetworkPubkeyRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      iSeed: json.valueAsInt<int?>(
        'i_seed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryNetworkPubkeyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNetworkPubkeyRequest(
      height: decode.getBigInt<BigInt?>(1),
      iSeed: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryNetworkPubkeyRequest;
  @override
  QueryNetworkPubkeyResponse onQueryResponse(List<int> bytes) {
    return QueryNetworkPubkeyResponse.deserialize(bytes);
  }

  @override
  QueryNetworkPubkeyResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNetworkPubkeyResponse.fromJson(json);
  }
}

/// QueryNetworkPubkeyResponse is the response type for the Query/NetworkPubkey RPC
class QueryNetworkPubkeyResponse extends CosmosProtoMessage {
  final BuBytes? nodePubkey;

  final BuBytes? ioPubkey;

  QueryNetworkPubkeyResponse({List<int>? nodePubkey, List<int>? ioPubkey})
    : nodePubkey = nodePubkey?.asImmutableBytes,
      ioPubkey = ioPubkey?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [nodePubkey, ioPubkey];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'node_pubkey': config.encodeBinary(nodePubkey),
      'io_pubkey': config.encodeBinary(ioPubkey),
    };
  }

  factory QueryNetworkPubkeyResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryNetworkPubkeyResponse(
      nodePubkey: config.decodeBinary<List<int>?>(
        json.valueAs('node_pubkey', normalizeKeyLookup: config.normalizeKeys),
      ),
      ioPubkey: config.decodeBinary<List<int>?>(
        json.valueAs('io_pubkey', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryNetworkPubkeyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNetworkPubkeyResponse(
      nodePubkey: decode.getBytes<List<int>?>(1),
      ioPubkey: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryNetworkPubkeyResponse;
}

/// QueryEcallRecordsRequest is the request type for the Query/EcallRecords RPC method
class QueryEcallRecordsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEcallRecordsResponse> {
  /// Start block height (inclusive)
  final BigInt? startHeight;

  /// End block height (inclusive)
  final BigInt? endHeight;

  const QueryEcallRecordsRequest({this.startHeight, this.endHeight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/ecalls",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.int64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [startHeight, endHeight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'start_height': config.encodeBigint(startHeight),
      'end_height': config.encodeBigint(endHeight),
    };
  }

  factory QueryEcallRecordsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEcallRecordsRequest(
      startHeight: json.valueAsBigInt<BigInt?>(
        'start_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      endHeight: json.valueAsBigInt<BigInt?>(
        'end_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryEcallRecordsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEcallRecordsRequest(
      startHeight: decode.getBigInt<BigInt?>(1),
      endHeight: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryEcallRecordsRequest;
  @override
  QueryEcallRecordsResponse onQueryResponse(List<int> bytes) {
    return QueryEcallRecordsResponse.deserialize(bytes);
  }

  @override
  QueryEcallRecordsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEcallRecordsResponse.fromJson(json);
  }
}

/// QueryEcallRecordsResponse is the response type for the Query/EcallRecords RPC method
class QueryEcallRecordsResponse extends CosmosProtoMessage {
  /// List of ecall records
  final List<QueryEcallRecordResponse> records;

  const QueryEcallRecordsResponse({this.records = const []});

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
  List<Object?> get protoValues => [records];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'records': records.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryEcallRecordsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEcallRecordsResponse(
      records:
          (json.valueEnsureAsList<dynamic>(
                'records',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryEcallRecordResponse, Object>(
                  value: e,
                  parse:
                      (v) => QueryEcallRecordResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryEcallRecordsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEcallRecordsResponse(
      records:
          decode
              .getListOfBytes(1)
              .map((b) => QueryEcallRecordResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryEcallRecordsResponse;
}

/// QueryEncryptedSeedRequest is the request type for the Query/EncryptedSeed RPC method
class QueryEncryptedSeedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEncryptedSeedResponse> {
  /// Certificate hash (hex encoded sha256 of certificate)
  final String? certHash;

  /// Block height at which the seed was recorded (required for per-height keying)
  final BigInt? height;

  const QueryEncryptedSeedRequest({this.certHash, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/encrypted_seed/{cert_hash}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.int64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [certHash, height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'cert_hash': certHash, 'height': config.encodeBigint(height)};
  }

  factory QueryEncryptedSeedRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEncryptedSeedRequest(
      certHash: json.valueAsString<String?>(
        'cert_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryEncryptedSeedRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEncryptedSeedRequest(
      certHash: decode.getString<String?>(1),
      height: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryEncryptedSeedRequest;
  @override
  QueryEncryptedSeedResponse onQueryResponse(List<int> bytes) {
    return QueryEncryptedSeedResponse.deserialize(bytes);
  }

  @override
  QueryEncryptedSeedResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEncryptedSeedResponse.fromJson(json);
  }
}

/// QueryEncryptedSeedResponse is the response type for the Query/EncryptedSeed RPC method
class QueryEncryptedSeedResponse extends CosmosProtoMessage {
  /// Encrypted seed data
  final BuBytes? encryptedSeed;

  /// Machine binding
  final BuBytes? machineBinding;

  QueryEncryptedSeedResponse({
    List<int>? encryptedSeed,
    List<int>? machineBinding,
  }) : encryptedSeed = encryptedSeed?.asImmutableBytes,
       machineBinding = machineBinding?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [encryptedSeed, machineBinding];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'encrypted_seed': config.encodeBinary(encryptedSeed),
      'machine_binding': config.encodeBinary(machineBinding),
    };
  }

  factory QueryEncryptedSeedResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEncryptedSeedResponse(
      encryptedSeed: config.decodeBinary<List<int>?>(
        json.valueAs(
          'encrypted_seed',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      machineBinding: config.decodeBinary<List<int>?>(
        json.valueAs(
          'machine_binding',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory QueryEncryptedSeedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEncryptedSeedResponse(
      encryptedSeed: decode.getBytes<List<int>?>(1),
      machineBinding: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryEncryptedSeedResponse;
}

/// StorageOp represents a single storage operation (Set or Delete)
class StorageOp extends CosmosProtoMessage {
  /// True if this is a delete operation, false for set
  final bool? isDelete;

  /// Storage key
  final BuBytes? key;

  /// Storage value (empty for delete operations)
  final BuBytes? value;

  StorageOp({this.isDelete, List<int>? key, List<int>? value})
    : key = key?.asImmutableBytes,
      value = value?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [isDelete, key, value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'is_delete': isDelete,
      'key': config.encodeBinary(key),
      'value': config.encodeBinary(value),
    };
  }

  factory StorageOp.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StorageOp(
      isDelete: json.valueAsBool<bool?>(
        'is_delete',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
      value: config.decodeBinary<List<int>?>(
        json.valueAs('value', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory StorageOp.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StorageOp(
      isDelete: decode.getBool<bool?>(1),
      key: decode.getBytes<List<int>?>(2),
      value: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1StorageOp;
}

/// CrossModuleOp represents a storage operation on a different module's store
class CrossModuleOp extends CosmosProtoMessage {
  /// The store key identifying the module (e.g., "bank", "staking")
  final String? storeKey;

  /// Storage key within the module's store
  final BuBytes? key;

  /// Storage value (empty for delete operations)
  final BuBytes? value;

  /// True if this is a delete operation, false for set
  final bool? isDelete;

  CrossModuleOp({
    this.storeKey,
    List<int>? key,
    List<int>? value,
    this.isDelete,
  }) : key = key?.asImmutableBytes,
       value = value?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.bool(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [storeKey, key, value, isDelete];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'store_key': storeKey,
      'key': config.encodeBinary(key),
      'value': config.encodeBinary(value),
      'is_delete': isDelete,
    };
  }

  factory CrossModuleOp.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CrossModuleOp(
      storeKey: json.valueAsString<String?>(
        'store_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
      value: config.decodeBinary<List<int>?>(
        json.valueAs('value', normalizeKeyLookup: config.normalizeKeys),
      ),
      isDelete: json.valueAsBool<bool?>(
        'is_delete',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory CrossModuleOp.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CrossModuleOp(
      storeKey: decode.getString<String?>(1),
      key: decode.getBytes<List<int>?>(2),
      value: decode.getBytes<List<int>?>(3),
      isDelete: decode.getBool<bool?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1CrossModuleOp;
}

/// ExecutionTraceData is a single execution trace with its index
class ExecutionTraceData extends CosmosProtoMessage {
  /// Execution index within the block
  final BigInt? index;

  /// List of storage operations performed during execution
  final List<StorageOp> ops;

  /// Return value from the contract execution
  final BuBytes? result;

  /// Gas used during execution (compute gas from WASM)
  final BigInt? gasUsed;

  /// Gas consumed by callbacks (store operations) during execution
  final BigInt? callbackGas;

  /// Whether the execution resulted in an error
  final bool? hasError;

  /// Error message (if has_error is true)
  final String? errorMsg;

  /// List of cross-module storage operations (e.g., bank balance changes)
  final List<CrossModuleOp> crossOps;

  ExecutionTraceData({
    this.index,
    this.ops = const [],
    List<int>? result,
    this.gasUsed,
    this.callbackGas,
    this.hasError,
    this.errorMsg,
    this.crossOps = const [],
  }) : result = result?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.bool(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    index,
    ops,
    result,
    gasUsed,
    callbackGas,
    hasError,
    errorMsg,
    crossOps,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'index': config.encodeBigint(index),
      'ops': ops.map((e) => config.encodeMessage(e)).toList(),
      'result': config.encodeBinary(result),
      'gas_used': config.encodeBigint(gasUsed),
      'callback_gas': config.encodeBigint(callbackGas),
      'has_error': hasError,
      'error_msg': errorMsg,
      'cross_ops': crossOps.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory ExecutionTraceData.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ExecutionTraceData(
      index: json.valueAsBigInt<BigInt?>(
        'index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ops:
          (json.valueEnsureAsList<dynamic>(
                'ops',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<StorageOp, Object>(
                  value: e,
                  parse:
                      (v) => StorageOp.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      result: config.decodeBinary<List<int>?>(
        json.valueAs('result', normalizeKeyLookup: config.normalizeKeys),
      ),
      gasUsed: json.valueAsBigInt<BigInt?>(
        'gas_used',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      callbackGas: json.valueAsBigInt<BigInt?>(
        'callback_gas',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      hasError: json.valueAsBool<bool?>(
        'has_error',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      errorMsg: json.valueAsString<String?>(
        'error_msg',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      crossOps:
          (json.valueEnsureAsList<dynamic>(
                'cross_ops',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<CrossModuleOp, Object>(
                  value: e,
                  parse:
                      (v) => CrossModuleOp.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory ExecutionTraceData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExecutionTraceData(
      index: decode.getBigInt<BigInt?>(1),
      ops:
          decode
              .getListOfBytes(2)
              .map((b) => StorageOp.deserialize(b))
              .toList(),
      result: decode.getBytes<List<int>?>(3),
      gasUsed: decode.getBigInt<BigInt?>(4),
      callbackGas: decode.getBigInt<BigInt?>(7),
      hasError: decode.getBool<bool?>(5),
      errorMsg: decode.getString<String?>(6),
      crossOps:
          decode
              .getListOfBytes(8)
              .map((b) => CrossModuleOp.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1ExecutionTraceData;
}

/// QueryBlockTracesRequest is the request type for the Query/BlockTraces RPC method
class QueryBlockTracesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBlockTracesResponse> {
  /// Block height to query traces for
  final BigInt? height;

  const QueryBlockTracesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/block_traces/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height)};
  }

  factory QueryBlockTracesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBlockTracesRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBlockTracesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBlockTracesRequest(height: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryBlockTracesRequest;
  @override
  QueryBlockTracesResponse onQueryResponse(List<int> bytes) {
    return QueryBlockTracesResponse.deserialize(bytes);
  }

  @override
  QueryBlockTracesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBlockTracesResponse.fromJson(json);
  }
}

/// QueryBlockTracesResponse is the response type for the Query/BlockTraces RPC method
class QueryBlockTracesResponse extends CosmosProtoMessage {
  /// All execution traces for the block
  final List<ExecutionTraceData> traces;

  const QueryBlockTracesResponse({this.traces = const []});

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
  List<Object?> get protoValues => [traces];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'traces': traces.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryBlockTracesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBlockTracesResponse(
      traces:
          (json.valueEnsureAsList<dynamic>(
                'traces',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<ExecutionTraceData, Object>(
                  value: e,
                  parse:
                      (v) => ExecutionTraceData.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryBlockTracesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBlockTracesResponse(
      traces:
          decode
              .getListOfBytes(1)
              .map((b) => ExecutionTraceData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryBlockTracesResponse;
}

/// QueryMachineIDProofRequest is the request type for the Query/MachineIDProof RPC method
class QueryMachineIDProofRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMachineIDProofResponse> {
  /// Block height where the machine ID was approved
  final BigInt? height;

  /// Machine ID (hex encoded)
  final String? machineId;

  const QueryMachineIDProofRequest({this.height, this.machineId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/machine_id_proof/{height}/{machine_id}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, machineId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height), 'machine_id': machineId};
  }

  factory QueryMachineIDProofRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMachineIDProofRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      machineId: json.valueAsString<String?>(
        'machine_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMachineIDProofRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMachineIDProofRequest(
      height: decode.getBigInt<BigInt?>(1),
      machineId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryMachineIDProofRequest;
  @override
  QueryMachineIDProofResponse onQueryResponse(List<int> bytes) {
    return QueryMachineIDProofResponse.deserialize(bytes);
  }

  @override
  QueryMachineIDProofResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMachineIDProofResponse.fromJson(json);
  }
}

/// QueryMachineIDProofResponse is the response type for the Query/MachineIDProof RPC method
class QueryMachineIDProofResponse extends CosmosProtoMessage {
  /// Proof bytes (32 bytes)
  final BuBytes? proof;

  QueryMachineIDProofResponse({List<int>? proof})
    : proof = proof?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [proof];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'proof': config.encodeBinary(proof)};
  }

  factory QueryMachineIDProofResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMachineIDProofResponse(
      proof: config.decodeBinary<List<int>?>(
        json.valueAs('proof', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryMachineIDProofResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMachineIDProofResponse(proof: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryMachineIDProofResponse;
}

/// QueryAnalyzeCodeRequest is the request type for the Query/AnalyzeCode RPC method
class QueryAnalyzeCodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAnalyzeCodeResponse> {
  /// Code hash (raw bytes, typically 32 bytes SHA256)
  final BuBytes? codeHash;

  QueryAnalyzeCodeRequest({List<int>? codeHash})
    : codeHash = codeHash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/analyze_code",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [codeHash];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'code_hash': config.encodeBinary(codeHash)};
  }

  factory QueryAnalyzeCodeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAnalyzeCodeRequest(
      codeHash: config.decodeBinary<List<int>?>(
        json.valueAs('code_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryAnalyzeCodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAnalyzeCodeRequest(codeHash: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryAnalyzeCodeRequest;
  @override
  QueryAnalyzeCodeResponse onQueryResponse(List<int> bytes) {
    return QueryAnalyzeCodeResponse.deserialize(bytes);
  }

  @override
  QueryAnalyzeCodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAnalyzeCodeResponse.fromJson(json);
  }
}

/// QueryAnalyzeCodeResponse is the response type for the Query/AnalyzeCode RPC method
class QueryAnalyzeCodeResponse extends CosmosProtoMessage {
  /// Whether the code has IBC entry points (ibc_channel_open, ibc_channel_connect, etc.)
  final bool? hasIbcEntryPoints;

  /// Comma-separated list of required features (e.g., "staking", "stargate")
  final String? requiredFeatures;

  const QueryAnalyzeCodeResponse({
    this.hasIbcEntryPoints,
    this.requiredFeatures,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [hasIbcEntryPoints, requiredFeatures];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'has_ibc_entry_points': hasIbcEntryPoints,
      'required_features': requiredFeatures,
    };
  }

  factory QueryAnalyzeCodeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAnalyzeCodeResponse(
      hasIbcEntryPoints: json.valueAsBool<bool?>(
        'has_ibc_entry_points',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      requiredFeatures: json.valueAsString<String?>(
        'required_features',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAnalyzeCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAnalyzeCodeResponse(
      hasIbcEntryPoints: decode.getBool<bool?>(1),
      requiredFeatures: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1QueryAnalyzeCodeResponse;
}

/// CreateResultData stores the outcome of a single MsgStoreCode execution
class CreateResultData extends CosmosProtoMessage {
  /// SHA256 of the original WASM bytecode
  final BuBytes? wasmHash;

  /// Code hash computed by the enclave (empty on error)
  final BuBytes? codeHash;

  /// Whether the enclave rejected the code
  final bool? hasError;

  /// Error message (if has_error is true)
  final String? errorMsg;

  CreateResultData({
    List<int>? wasmHash,
    List<int>? codeHash,
    this.hasError,
    this.errorMsg,
  }) : wasmHash = wasmHash?.asImmutableBytes,
       codeHash = codeHash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [wasmHash, codeHash, hasError, errorMsg];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'wasm_hash': config.encodeBinary(wasmHash),
      'code_hash': config.encodeBinary(codeHash),
      'has_error': hasError,
      'error_msg': errorMsg,
    };
  }

  factory CreateResultData.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CreateResultData(
      wasmHash: config.decodeBinary<List<int>?>(
        json.valueAs('wasm_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      codeHash: config.decodeBinary<List<int>?>(
        json.valueAs('code_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      hasError: json.valueAsBool<bool?>(
        'has_error',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      errorMsg: json.valueAsString<String?>(
        'error_msg',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory CreateResultData.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CreateResultData(
      wasmHash: decode.getBytes<List<int>?>(1),
      codeHash: decode.getBytes<List<int>?>(2),
      hasError: decode.getBool<bool?>(3),
      errorMsg: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretComputeV1beta1CreateResultData;
}

/// QueryBlockCreateResultsRequest is the request type for the Query/BlockCreateResults RPC method
class QueryBlockCreateResultsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBlockCreateResultsResponse> {
  /// Block height to query Create results for
  final BigInt? height;

  const QueryBlockCreateResultsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/compute/v1beta1/block_create_results/{height}",
        ),
      ],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height)};
  }

  factory QueryBlockCreateResultsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBlockCreateResultsRequest(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBlockCreateResultsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBlockCreateResultsRequest(height: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryBlockCreateResultsRequest;
  @override
  QueryBlockCreateResultsResponse onQueryResponse(List<int> bytes) {
    return QueryBlockCreateResultsResponse.deserialize(bytes);
  }

  @override
  QueryBlockCreateResultsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryBlockCreateResultsResponse.fromJson(json);
  }
}

/// QueryBlockCreateResultsResponse is the response type for the Query/BlockCreateResults RPC method
class QueryBlockCreateResultsResponse extends CosmosProtoMessage {
  /// All Create results for the block
  final List<CreateResultData> results;

  const QueryBlockCreateResultsResponse({this.results = const []});

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
  List<Object?> get protoValues => [results];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'results': results.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryBlockCreateResultsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBlockCreateResultsResponse(
      results:
          (json.valueEnsureAsList<dynamic>(
                'results',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<CreateResultData, Object>(
                  value: e,
                  parse:
                      (v) => CreateResultData.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryBlockCreateResultsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBlockCreateResultsResponse(
      results:
          decode
              .getListOfBytes(1)
              .map((b) => CreateResultData.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretComputeV1beta1QueryBlockCreateResultsResponse;
}
