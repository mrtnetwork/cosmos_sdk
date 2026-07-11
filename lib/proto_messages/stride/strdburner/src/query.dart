import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// QueryStrdBurnerAddressRequest is the request type for the Query/strdburner
/// RPC method
class QueryStrdBurnerAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStrdBurnerAddressResponse> {
  const QueryStrdBurnerAddressRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/strdburner/address",
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

  factory QueryStrdBurnerAddressRequest.fromJson(Map<String, dynamic> json) {
    return QueryStrdBurnerAddressRequest();
  }

  factory QueryStrdBurnerAddressRequest.deserialize(List<int> bytes) {
    return QueryStrdBurnerAddressRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerQueryStrdBurnerAddressRequest;
  @override
  QueryStrdBurnerAddressResponse onQueryResponse(List<int> bytes) {
    return QueryStrdBurnerAddressResponse.deserialize(bytes);
  }

  @override
  QueryStrdBurnerAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryStrdBurnerAddressResponse.fromJson(json);
  }
}

/// QueryStrdBurnerAddressResponse is the response type for the Query/strdburner
/// RPC method
class QueryStrdBurnerAddressResponse extends CosmosProtoMessage {
  final String? address;

  const QueryStrdBurnerAddressResponse({this.address});

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
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryStrdBurnerAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryStrdBurnerAddressResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryStrdBurnerAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStrdBurnerAddressResponse(
      address: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerQueryStrdBurnerAddressResponse;
}

/// QueryTotalStrdBurnedRequest is the request type for the Query/strdburner
/// RPC method
class QueryTotalStrdBurnedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTotalStrdBurnedResponse> {
  const QueryTotalStrdBurnedRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/strdburner/total_burned",
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

  factory QueryTotalStrdBurnedRequest.fromJson(Map<String, dynamic> json) {
    return QueryTotalStrdBurnedRequest();
  }

  factory QueryTotalStrdBurnedRequest.deserialize(List<int> bytes) {
    return QueryTotalStrdBurnedRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerQueryTotalStrdBurnedRequest;
  @override
  QueryTotalStrdBurnedResponse onQueryResponse(List<int> bytes) {
    return QueryTotalStrdBurnedResponse.deserialize(bytes);
  }

  @override
  QueryTotalStrdBurnedResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTotalStrdBurnedResponse.fromJson(json);
  }
}

/// QueryTotalStrdBurnedResponse is the response type for the Query/strdburner
/// RPC method
class QueryTotalStrdBurnedResponse extends CosmosProtoMessage {
  final String? totalBurned;

  final String? protocolBurned;

  final String? totalUserBurned;

  const QueryTotalStrdBurnedResponse({
    this.totalBurned,
    this.protocolBurned,
    this.totalUserBurned,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    totalBurned,
    protocolBurned,
    totalUserBurned,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'total_burned': totalBurned,
      'protocol_burned': protocolBurned,
      'total_user_burned': totalUserBurned,
    };
  }

  factory QueryTotalStrdBurnedResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalStrdBurnedResponse(
      totalBurned: json.valueAsString<String?>(
        'total_burned',
        acceptCamelCase: true,
      ),
      protocolBurned: json.valueAsString<String?>(
        'protocol_burned',
        acceptCamelCase: true,
      ),
      totalUserBurned: json.valueAsString<String?>(
        'total_user_burned',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTotalStrdBurnedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTotalStrdBurnedResponse(
      totalBurned: decode.getString<String?>(1),
      protocolBurned: decode.getString<String?>(2),
      totalUserBurned: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerQueryTotalStrdBurnedResponse;
}

/// QueryStrdBurnedByAddressRequest is the request type for the Query/strdburner
/// RPC method
class QueryStrdBurnedByAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStrdBurnedByAddressResponse> {
  final String? address;

  const QueryStrdBurnedByAddressRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/strdburner/burned/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryStrdBurnedByAddressRequest.fromJson(Map<String, dynamic> json) {
    return QueryStrdBurnedByAddressRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryStrdBurnedByAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStrdBurnedByAddressRequest(
      address: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerQueryStrdBurnedByAddressRequest;
  @override
  QueryStrdBurnedByAddressResponse onQueryResponse(List<int> bytes) {
    return QueryStrdBurnedByAddressResponse.deserialize(bytes);
  }

  @override
  QueryStrdBurnedByAddressResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryStrdBurnedByAddressResponse.fromJson(json);
  }
}

/// QueryStrdBurnedByAddressResponse is the response type for the
/// Query/strdburner RPC method
class QueryStrdBurnedByAddressResponse extends CosmosProtoMessage {
  final String? burnedAmount;

  const QueryStrdBurnedByAddressResponse({this.burnedAmount});

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
  List<Object?> get protoValues => [burnedAmount];

  @override
  Map<String, dynamic> toJson() {
    return {'burned_amount': burnedAmount};
  }

  factory QueryStrdBurnedByAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryStrdBurnedByAddressResponse(
      burnedAmount: json.valueAsString<String?>(
        'burned_amount',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryStrdBurnedByAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStrdBurnedByAddressResponse(
      burnedAmount: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .strideStrdburnerQueryStrdBurnedByAddressResponse;
}

/// QueryLinkedAddressRequest is the request type for the Query/strdburner
/// RPC method
class QueryLinkedAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLinkedAddressResponse> {
  final String? strideAddress;

  const QueryLinkedAddressRequest({this.strideAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/strdburner/linked/{stride_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [strideAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'stride_address': strideAddress};
  }

  factory QueryLinkedAddressRequest.fromJson(Map<String, dynamic> json) {
    return QueryLinkedAddressRequest(
      strideAddress: json.valueAsString<String?>(
        'stride_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryLinkedAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLinkedAddressRequest(
      strideAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerQueryLinkedAddressRequest;
  @override
  QueryLinkedAddressResponse onQueryResponse(List<int> bytes) {
    return QueryLinkedAddressResponse.deserialize(bytes);
  }

  @override
  QueryLinkedAddressResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLinkedAddressResponse.fromJson(json);
  }
}

/// QueryLinkedAddressResponse is the response type for the
/// Query/strdburner RPC method
class QueryLinkedAddressResponse extends CosmosProtoMessage {
  final String? linkedAddress;

  const QueryLinkedAddressResponse({this.linkedAddress});

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
  List<Object?> get protoValues => [linkedAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'linked_address': linkedAddress};
  }

  factory QueryLinkedAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryLinkedAddressResponse(
      linkedAddress: json.valueAsString<String?>(
        'linked_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryLinkedAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLinkedAddressResponse(
      linkedAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStrdburnerQueryLinkedAddressResponse;
}
