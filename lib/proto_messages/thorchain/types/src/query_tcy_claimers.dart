import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryTCYClaimerRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTCYClaimerResponse> {
  final String? address;

  final String? height;

  const QueryTCYClaimerRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tcy_claimer/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, height];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'height': height};
  }

  factory QueryTCYClaimerRequest.fromJson(Map<String, dynamic> json) {
    return QueryTCYClaimerRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTCYClaimerRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYClaimerRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYClaimerRequest;
  @override
  QueryTCYClaimerResponse onQueryResponse(List<int> bytes) {
    return QueryTCYClaimerResponse.deserialize(bytes);
  }

  @override
  QueryTCYClaimerResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTCYClaimerResponse.fromJson(json);
  }
}

/// Can we replace this with TCYClaimer proto? Check json fields...
class QueryTCYClaimerResponse extends CosmosProtoMessage {
  final List<QueryTCYClaimer> tcyClaimer;

  const QueryTCYClaimerResponse({this.tcyClaimer = const []});

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
  List<Object?> get protoValues => [tcyClaimer];

  @override
  Map<String, dynamic> toJson() {
    return {'tcy_claimer': tcyClaimer.map((e) => e.toJson()).toList()};
  }

  factory QueryTCYClaimerResponse.fromJson(Map<String, dynamic> json) {
    return QueryTCYClaimerResponse(
      tcyClaimer:
          (json.valueEnsureAsList<dynamic>(
                'tcy_claimer',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<QueryTCYClaimer, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => QueryTCYClaimer.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory QueryTCYClaimerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYClaimerResponse(
      tcyClaimer:
          decode
              .getListOfBytes(1)
              .map((b) => QueryTCYClaimer.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYClaimerResponse;
}

class QueryTCYClaimer extends CosmosProtoMessage {
  final String? asset;

  final String? l1Address;

  final String? amount;

  const QueryTCYClaimer({this.asset, this.l1Address, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [asset, l1Address, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'asset': asset, 'l1_address': l1Address, 'amount': amount};
  }

  factory QueryTCYClaimer.fromJson(Map<String, dynamic> json) {
    return QueryTCYClaimer(
      asset: json.valueAsString<String?>('asset', acceptCamelCase: true),
      l1Address: json.valueAsString<String?>(
        'l1_address',
        acceptCamelCase: true,
      ),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory QueryTCYClaimer.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYClaimer(
      asset: decode.getString<String?>(1),
      l1Address: decode.getString<String?>(2),
      amount: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYClaimer;
}

class QueryTCYClaimersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTCYClaimersResponse> {
  final String? height;

  const QueryTCYClaimersRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tcy_claimers",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryTCYClaimersRequest.fromJson(Map<String, dynamic> json) {
    return QueryTCYClaimersRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTCYClaimersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYClaimersRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYClaimersRequest;
  @override
  QueryTCYClaimersResponse onQueryResponse(List<int> bytes) {
    return QueryTCYClaimersResponse.deserialize(bytes);
  }

  @override
  QueryTCYClaimersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTCYClaimersResponse.fromJson(json);
  }
}

class QueryTCYClaimersResponse extends CosmosProtoMessage {
  final List<QueryTCYClaimer> tcyClaimers;

  const QueryTCYClaimersResponse({this.tcyClaimers = const []});

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
  List<Object?> get protoValues => [tcyClaimers];

  @override
  Map<String, dynamic> toJson() {
    return {'tcy_claimers': tcyClaimers.map((e) => e.toJson()).toList()};
  }

  factory QueryTCYClaimersResponse.fromJson(Map<String, dynamic> json) {
    return QueryTCYClaimersResponse(
      tcyClaimers:
          (json.valueEnsureAsList<dynamic>(
                'tcy_claimers',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<QueryTCYClaimer, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => QueryTCYClaimer.fromJson(v),
                    ),
              )
              .toList(),
    );
  }

  factory QueryTCYClaimersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYClaimersResponse(
      tcyClaimers:
          decode
              .getListOfBytes(1)
              .map((b) => QueryTCYClaimer.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYClaimersResponse;
}
