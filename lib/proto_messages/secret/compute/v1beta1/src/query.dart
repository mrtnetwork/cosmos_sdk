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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory ParamsRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory ParamsResponse.fromJson(Map<String, dynamic> json) {
    return ParamsResponse(
      params: json
          .valueTo<secret_compute_v1beta1_params.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => secret_compute_v1beta1_params.Params.fromJson(v),
            acceptCamelCase: true,
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

  final List<int>? query;

  const QuerySecretContractRequest({this.contractAddress, this.query});

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
  Map<String, dynamic> toJson() {
    return {
      'contract_address': contractAddress,
      'query': switch (query) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QuerySecretContractRequest.fromJson(Map<String, dynamic> json) {
    return QuerySecretContractRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      query: json.valueAsBytes<List<int>?>(
        'query',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'label': label};
  }

  factory QueryByLabelRequest.fromJson(Map<String, dynamic> json) {
    return QueryByLabelRequest(
      label: json.valueAsString<String?>('label', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'contract_address': contractAddress};
  }

  factory QueryByContractAddressRequest.fromJson(Map<String, dynamic> json) {
    return QueryByContractAddressRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'code_id': codeId?.toString()};
  }

  factory QueryByCodeIdRequest.fromJson(Map<String, dynamic> json) {
    return QueryByCodeIdRequest(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
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
  final List<int>? data;

  const QuerySecretContractResponse({this.data});

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
  Map<String, dynamic> toJson() {
    return {
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QuerySecretContractResponse.fromJson(Map<String, dynamic> json) {
    return QuerySecretContractResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {
      'contract_address': contractAddress,
      'contract_info': contractInfo?.toJson(),
    };
  }

  factory QueryContractInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractInfoResponse(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      contractInfo: json.valueTo<
        secret_compute_v1beta1_types.ContractInfo?,
        Map<String, dynamic>
      >(
        key: 'contract_info',
        parse: (v) => secret_compute_v1beta1_types.ContractInfo.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'contract_address': contractAddress,
      'contract_info': contractInfo?.toJson(),
    };
  }

  factory ContractInfoWithAddress.fromJson(Map<String, dynamic> json) {
    return ContractInfoWithAddress(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      contractInfo: json.valueTo<
        secret_compute_v1beta1_types.ContractInfo?,
        Map<String, dynamic>
      >(
        key: 'contract_info',
        parse: (v) => secret_compute_v1beta1_types.ContractInfo.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'contract_infos': contractInfos.map((e) => e.toJson()).toList()};
  }

  factory QueryContractsByCodeIdResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractsByCodeIdResponse(
      contractInfos:
          (json.valueEnsureAsList<dynamic>(
                'contract_infos',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ContractInfoWithAddress,
                  Map<String, dynamic>
                >(value: e, parse: (v) => ContractInfoWithAddress.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {
      'code_id': codeId?.toString(),
      'creator': creator,
      'code_hash': codeHash,
      'source': source,
      'builder': builder,
    };
  }

  factory CodeInfoResponse.fromJson(Map<String, dynamic> json) {
    return CodeInfoResponse(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      codeHash: json.valueAsString<String?>('code_hash', acceptCamelCase: true),
      source: json.valueAsString<String?>('source', acceptCamelCase: true),
      builder: json.valueAsString<String?>('builder', acceptCamelCase: true),
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

  final List<int>? wasm;

  const QueryCodeResponse({this.codeInfo, this.wasm});

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
  Map<String, dynamic> toJson() {
    return {
      'code_info': codeInfo?.toJson(),
      'wasm': switch (wasm) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryCodeResponse.fromJson(Map<String, dynamic> json) {
    return QueryCodeResponse(
      codeInfo: json.valueTo<CodeInfoResponse?, Map<String, dynamic>>(
        key: 'code_info',
        parse: (v) => CodeInfoResponse.fromJson(v),
        acceptCamelCase: true,
      ),
      wasm: json.valueAsBytes<List<int>?>(
        'wasm',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'code_infos': codeInfos.map((e) => e.toJson()).toList()};
  }

  factory QueryCodesResponse.fromJson(Map<String, dynamic> json) {
    return QueryCodesResponse(
      codeInfos:
          (json.valueEnsureAsList<dynamic>('code_infos', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<CodeInfoResponse, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => CodeInfoResponse.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'contract_address': contractAddress};
  }

  factory QueryContractAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractAddressResponse(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'label': label};
  }

  factory QueryContractLabelResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractLabelResponse(
      label: json.valueAsString<String?>('label', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'code_hash': codeHash};
  }

  factory QueryCodeHashResponse.fromJson(Map<String, dynamic> json) {
    return QueryCodeHashResponse(
      codeHash: json.valueAsString<String?>('code_hash', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'contract_address': contractAddress};
  }

  factory QueryContractHistoryRequest.fromJson(Map<String, dynamic> json) {
    return QueryContractHistoryRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'entries': entries.map((e) => e.toJson()).toList()};
  }

  factory QueryContractHistoryResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractHistoryResponse(
      entries:
          (json.valueEnsureAsList<dynamic>('entries', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  secret_compute_v1beta1_types.ContractCodeHistoryEntry,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => secret_compute_v1beta1_types
                          .ContractCodeHistoryEntry.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'contract_address': contractAddress};
  }

  factory QueryAuthorizedMigrationRequest.fromJson(Map<String, dynamic> json) {
    return QueryAuthorizedMigrationRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'new_code_id': newCodeId?.toString()};
  }

  factory QueryAuthorizedMigrationResponse.fromJson(Map<String, dynamic> json) {
    return QueryAuthorizedMigrationResponse(
      newCodeId: json.valueAsBigInt<BigInt?>(
        'new_code_id',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'contract_address': contractAddress};
  }

  factory QueryAuthorizedAdminUpdateRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuthorizedAdminUpdateRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'new_admin': newAdmin};
  }

  factory QueryAuthorizedAdminUpdateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return QueryAuthorizedAdminUpdateResponse(
      newAdmin: json.valueAsString<String?>('new_admin', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'height': height?.toString()};
  }

  factory QueryEcallRecordRequest.fromJson(Map<String, dynamic> json) {
    return QueryEcallRecordRequest(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
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
  final List<int>? randomSeed;

  /// Validator set evidence from SubmitBlockSignatures (32 bytes)
  final List<int>? validatorSetEvidence;

  const QueryEcallRecordResponse({
    this.height,
    this.randomSeed,
    this.validatorSetEvidence,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'height': height?.toString(),
      'random_seed': switch (randomSeed) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'validator_set_evidence': switch (validatorSetEvidence) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryEcallRecordResponse.fromJson(Map<String, dynamic> json) {
    return QueryEcallRecordResponse(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      randomSeed: json.valueAsBytes<List<int>?>(
        'random_seed',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      validatorSetEvidence: json.valueAsBytes<List<int>?>(
        'validator_set_evidence',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'height': height?.toString(), 'i_seed': iSeed};
  }

  factory QueryNetworkPubkeyRequest.fromJson(Map<String, dynamic> json) {
    return QueryNetworkPubkeyRequest(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      iSeed: json.valueAsInt<int?>('i_seed', acceptCamelCase: true),
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
  final List<int>? nodePubkey;

  final List<int>? ioPubkey;

  const QueryNetworkPubkeyResponse({this.nodePubkey, this.ioPubkey});

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
  Map<String, dynamic> toJson() {
    return {
      'node_pubkey': switch (nodePubkey) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'io_pubkey': switch (ioPubkey) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryNetworkPubkeyResponse.fromJson(Map<String, dynamic> json) {
    return QueryNetworkPubkeyResponse(
      nodePubkey: json.valueAsBytes<List<int>?>(
        'node_pubkey',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      ioPubkey: json.valueAsBytes<List<int>?>(
        'io_pubkey',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {
      'start_height': startHeight?.toString(),
      'end_height': endHeight?.toString(),
    };
  }

  factory QueryEcallRecordsRequest.fromJson(Map<String, dynamic> json) {
    return QueryEcallRecordsRequest(
      startHeight: json.valueAsBigInt<BigInt?>(
        'start_height',
        acceptCamelCase: true,
      ),
      endHeight: json.valueAsBigInt<BigInt?>(
        'end_height',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'records': records.map((e) => e.toJson()).toList()};
  }

  factory QueryEcallRecordsResponse.fromJson(Map<String, dynamic> json) {
    return QueryEcallRecordsResponse(
      records:
          (json.valueEnsureAsList<dynamic>('records', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  QueryEcallRecordResponse,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryEcallRecordResponse.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {'cert_hash': certHash, 'height': height?.toString()};
  }

  factory QueryEncryptedSeedRequest.fromJson(Map<String, dynamic> json) {
    return QueryEncryptedSeedRequest(
      certHash: json.valueAsString<String?>('cert_hash', acceptCamelCase: true),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
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
  final List<int>? encryptedSeed;

  /// Machine binding
  final List<int>? machineBinding;

  const QueryEncryptedSeedResponse({this.encryptedSeed, this.machineBinding});

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
  Map<String, dynamic> toJson() {
    return {
      'encrypted_seed': switch (encryptedSeed) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'machine_binding': switch (machineBinding) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryEncryptedSeedResponse.fromJson(Map<String, dynamic> json) {
    return QueryEncryptedSeedResponse(
      encryptedSeed: json.valueAsBytes<List<int>?>(
        'encrypted_seed',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      machineBinding: json.valueAsBytes<List<int>?>(
        'machine_binding',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? key;

  /// Storage value (empty for delete operations)
  final List<int>? value;

  const StorageOp({this.isDelete, this.key, this.value});

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
  Map<String, dynamic> toJson() {
    return {
      'is_delete': isDelete,
      'key': switch (key) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'value': switch (value) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory StorageOp.fromJson(Map<String, dynamic> json) {
    return StorageOp(
      isDelete: json.valueAsBool<bool?>('is_delete', acceptCamelCase: true),
      key: json.valueAsBytes<List<int>?>(
        'key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      value: json.valueAsBytes<List<int>?>(
        'value',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? key;

  /// Storage value (empty for delete operations)
  final List<int>? value;

  /// True if this is a delete operation, false for set
  final bool? isDelete;

  const CrossModuleOp({this.storeKey, this.key, this.value, this.isDelete});

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
  Map<String, dynamic> toJson() {
    return {
      'store_key': storeKey,
      'key': switch (key) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'value': switch (value) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'is_delete': isDelete,
    };
  }

  factory CrossModuleOp.fromJson(Map<String, dynamic> json) {
    return CrossModuleOp(
      storeKey: json.valueAsString<String?>('store_key', acceptCamelCase: true),
      key: json.valueAsBytes<List<int>?>(
        'key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      value: json.valueAsBytes<List<int>?>(
        'value',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      isDelete: json.valueAsBool<bool?>('is_delete', acceptCamelCase: true),
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
  final List<int>? result;

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

  const ExecutionTraceData({
    this.index,
    this.ops = const [],
    this.result,
    this.gasUsed,
    this.callbackGas,
    this.hasError,
    this.errorMsg,
    this.crossOps = const [],
  });

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
  Map<String, dynamic> toJson() {
    return {
      'index': index?.toString(),
      'ops': ops.map((e) => e.toJson()).toList(),
      'result': switch (result) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'gas_used': gasUsed?.toString(),
      'callback_gas': callbackGas?.toString(),
      'has_error': hasError,
      'error_msg': errorMsg,
      'cross_ops': crossOps.map((e) => e.toJson()).toList(),
    };
  }

  factory ExecutionTraceData.fromJson(Map<String, dynamic> json) {
    return ExecutionTraceData(
      index: json.valueAsBigInt<BigInt?>('index', acceptCamelCase: true),
      ops:
          (json.valueEnsureAsList<dynamic>('ops', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<StorageOp, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => StorageOp.fromJson(v),
                ),
              )
              .toList(),
      result: json.valueAsBytes<List<int>?>(
        'result',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      gasUsed: json.valueAsBigInt<BigInt?>('gas_used', acceptCamelCase: true),
      callbackGas: json.valueAsBigInt<BigInt?>(
        'callback_gas',
        acceptCamelCase: true,
      ),
      hasError: json.valueAsBool<bool?>('has_error', acceptCamelCase: true),
      errorMsg: json.valueAsString<String?>('error_msg', acceptCamelCase: true),
      crossOps:
          (json.valueEnsureAsList<dynamic>('cross_ops', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<CrossModuleOp, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => CrossModuleOp.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'height': height?.toString()};
  }

  factory QueryBlockTracesRequest.fromJson(Map<String, dynamic> json) {
    return QueryBlockTracesRequest(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'traces': traces.map((e) => e.toJson()).toList()};
  }

  factory QueryBlockTracesResponse.fromJson(Map<String, dynamic> json) {
    return QueryBlockTracesResponse(
      traces:
          (json.valueEnsureAsList<dynamic>('traces', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  ExecutionTraceData,
                  Map<String, dynamic>
                >(value: e, parse: (v) => ExecutionTraceData.fromJson(v)),
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
  Map<String, dynamic> toJson() {
    return {'height': height?.toString(), 'machine_id': machineId};
  }

  factory QueryMachineIDProofRequest.fromJson(Map<String, dynamic> json) {
    return QueryMachineIDProofRequest(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      machineId: json.valueAsString<String?>(
        'machine_id',
        acceptCamelCase: true,
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
  final List<int>? proof;

  const QueryMachineIDProofResponse({this.proof});

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
  Map<String, dynamic> toJson() {
    return {
      'proof': switch (proof) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryMachineIDProofResponse.fromJson(Map<String, dynamic> json) {
    return QueryMachineIDProofResponse(
      proof: json.valueAsBytes<List<int>?>(
        'proof',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? codeHash;

  const QueryAnalyzeCodeRequest({this.codeHash});

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
  Map<String, dynamic> toJson() {
    return {
      'code_hash': switch (codeHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryAnalyzeCodeRequest.fromJson(Map<String, dynamic> json) {
    return QueryAnalyzeCodeRequest(
      codeHash: json.valueAsBytes<List<int>?>(
        'code_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {
      'has_ibc_entry_points': hasIbcEntryPoints,
      'required_features': requiredFeatures,
    };
  }

  factory QueryAnalyzeCodeResponse.fromJson(Map<String, dynamic> json) {
    return QueryAnalyzeCodeResponse(
      hasIbcEntryPoints: json.valueAsBool<bool?>(
        'has_ibc_entry_points',
        acceptCamelCase: true,
      ),
      requiredFeatures: json.valueAsString<String?>(
        'required_features',
        acceptCamelCase: true,
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
  final List<int>? wasmHash;

  /// Code hash computed by the enclave (empty on error)
  final List<int>? codeHash;

  /// Whether the enclave rejected the code
  final bool? hasError;

  /// Error message (if has_error is true)
  final String? errorMsg;

  const CreateResultData({
    this.wasmHash,
    this.codeHash,
    this.hasError,
    this.errorMsg,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'wasm_hash': switch (wasmHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'code_hash': switch (codeHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'has_error': hasError,
      'error_msg': errorMsg,
    };
  }

  factory CreateResultData.fromJson(Map<String, dynamic> json) {
    return CreateResultData(
      wasmHash: json.valueAsBytes<List<int>?>(
        'wasm_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      codeHash: json.valueAsBytes<List<int>?>(
        'code_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      hasError: json.valueAsBool<bool?>('has_error', acceptCamelCase: true),
      errorMsg: json.valueAsString<String?>('error_msg', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'height': height?.toString()};
  }

  factory QueryBlockCreateResultsRequest.fromJson(Map<String, dynamic> json) {
    return QueryBlockCreateResultsRequest(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'results': results.map((e) => e.toJson()).toList()};
  }

  factory QueryBlockCreateResultsResponse.fromJson(Map<String, dynamic> json) {
    return QueryBlockCreateResultsResponse(
      results:
          (json.valueEnsureAsList<dynamic>('results', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<CreateResultData, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => CreateResultData.fromJson(v),
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
