import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_contract_info.dart"
    as types_type_contract_info;

/// query single contract info
class QueryContractInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractInfoResponse> {
  final String? height;

  final String? address;

  const QueryContractInfoRequest({this.height, this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/contract/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, address];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height, 'address': address};
  }

  factory QueryContractInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryContractInfoRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryContractInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractInfoRequest(
      height: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryContractInfoRequest;
  @override
  QueryContractInfoResponse onQueryResponse(List<int> bytes) {
    return QueryContractInfoResponse.deserialize(bytes);
  }

  @override
  QueryContractInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContractInfoResponse.fromJson(json);
  }
}

class QueryContractInfoResponse extends CosmosProtoMessage {
  final types_type_contract_info.ContractInfo? info;

  const QueryContractInfoResponse({this.info});

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
  List<Object?> get protoValues => [info];

  @override
  Map<String, dynamic> toJson() {
    return {'info': info?.toJson()};
  }

  factory QueryContractInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractInfoResponse(
      info: json.valueTo<
        types_type_contract_info.ContractInfo?,
        Map<String, dynamic>
      >(
        key: 'info',
        parse: (v) => types_type_contract_info.ContractInfo.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryContractInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractInfoResponse(
      info: decode.messageTo<types_type_contract_info.ContractInfo?>(
        1,
        (b) => types_type_contract_info.ContractInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryContractInfoResponse;
}

/// query all contract infos
class QueryContractInfosRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractInfosResponse> {
  final String? height;

  final String? contract;

  final String? version;

  const QueryContractInfosRequest({this.height, this.contract, this.version});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/contracts",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, contract, version];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height, 'contract': contract, 'version': version};
  }

  factory QueryContractInfosRequest.fromJson(Map<String, dynamic> json) {
    return QueryContractInfosRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
      contract: json.valueAsString<String?>('contract', acceptCamelCase: true),
      version: json.valueAsString<String?>('version', acceptCamelCase: true),
    );
  }

  factory QueryContractInfosRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractInfosRequest(
      height: decode.getString<String?>(1),
      contract: decode.getString<String?>(2),
      version: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryContractInfosRequest;
  @override
  QueryContractInfosResponse onQueryResponse(List<int> bytes) {
    return QueryContractInfosResponse.deserialize(bytes);
  }

  @override
  QueryContractInfosResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContractInfosResponse.fromJson(json);
  }
}

class QueryContractInfosResponse extends CosmosProtoMessage {
  final List<types_type_contract_info.ContractInfo> infos;

  const QueryContractInfosResponse({this.infos = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [infos];

  @override
  Map<String, dynamic> toJson() {
    return {'infos': infos.map((e) => e.toJson()).toList()};
  }

  factory QueryContractInfosResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractInfosResponse(
      infos:
          (json.valueEnsureAsList<dynamic>('infos', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_type_contract_info.ContractInfo,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => types_type_contract_info.ContractInfo.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryContractInfosResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractInfosResponse(
      infos:
          decode
              .getListOfBytes(1)
              .map((b) => types_type_contract_info.ContractInfo.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryContractInfosResponse;
}
