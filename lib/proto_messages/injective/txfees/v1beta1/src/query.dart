import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/txfees/v1beta1/src/txfees.dart"
    as injective_txfees_v1beta1_txfees;

class EipBaseFee extends CosmosProtoMessage {
  /// The current chain gas price
  final String? baseFee;

  const EipBaseFee({this.baseFee});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [baseFee];

  @override
  Map<String, dynamic> toJson() {
    return {'base_fee': baseFee};
  }

  factory EipBaseFee.fromJson(Map<String, dynamic> json) {
    return EipBaseFee(
      baseFee: json.valueAsString<String?>('base_fee', acceptCamelCase: true),
    );
  }

  factory EipBaseFee.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EipBaseFee(baseFee: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTxfeesV1beta1EipBaseFee;
}

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/txfees/v1beta1/params",
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

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTxfeesV1beta1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final injective_txfees_v1beta1_txfees.Params? params;

  const QueryParamsResponse({this.params});

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

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<
        injective_txfees_v1beta1_txfees.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_txfees_v1beta1_txfees.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<injective_txfees_v1beta1_txfees.Params?>(
        1,
        (b) => injective_txfees_v1beta1_txfees.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTxfeesV1beta1QueryParamsResponse;
}

class QueryEipBaseFeeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEipBaseFeeResponse> {
  const QueryEipBaseFeeRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.get,
          path: "/injective/txfees/v1beta1/cur_eip_base_fee",
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

  factory QueryEipBaseFeeRequest.fromJson(Map<String, dynamic> json) {
    return QueryEipBaseFeeRequest();
  }

  factory QueryEipBaseFeeRequest.deserialize(List<int> bytes) {
    return QueryEipBaseFeeRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTxfeesV1beta1QueryEipBaseFeeRequest;
  @override
  QueryEipBaseFeeResponse onQueryResponse(List<int> bytes) {
    return QueryEipBaseFeeResponse.deserialize(bytes);
  }

  @override
  QueryEipBaseFeeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEipBaseFeeResponse.fromJson(json);
  }
}

class QueryEipBaseFeeResponse extends CosmosProtoMessage {
  final EipBaseFee? baseFee;

  const QueryEipBaseFeeResponse({this.baseFee});

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
  List<Object?> get protoValues => [baseFee];

  @override
  Map<String, dynamic> toJson() {
    return {'base_fee': baseFee?.toJson()};
  }

  factory QueryEipBaseFeeResponse.fromJson(Map<String, dynamic> json) {
    return QueryEipBaseFeeResponse(
      baseFee: json.valueTo<EipBaseFee?, Map<String, dynamic>>(
        key: 'base_fee',
        parse: (v) => EipBaseFee.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryEipBaseFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEipBaseFeeResponse(
      baseFee: decode.messageTo<EipBaseFee?>(
        1,
        (b) => EipBaseFee.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveTxfeesV1beta1QueryEipBaseFeeResponse;
}
