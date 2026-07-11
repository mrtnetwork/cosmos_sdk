import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryTCYStakerRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTCYStakerResponse> {
  final String? address;

  final String? height;

  const QueryTCYStakerRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tcy_staker/{address}",
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

  factory QueryTCYStakerRequest.fromJson(Map<String, dynamic> json) {
    return QueryTCYStakerRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTCYStakerRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYStakerRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYStakerRequest;
  @override
  QueryTCYStakerResponse onQueryResponse(List<int> bytes) {
    return QueryTCYStakerResponse.deserialize(bytes);
  }

  @override
  QueryTCYStakerResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTCYStakerResponse.fromJson(json);
  }
}

/// Can we replace this with TCYStaker proto? Check json fields...
class QueryTCYStakerResponse extends CosmosProtoMessage {
  final String? address;

  final String? amount;

  const QueryTCYStakerResponse({this.address, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'amount': amount};
  }

  factory QueryTCYStakerResponse.fromJson(Map<String, dynamic> json) {
    return QueryTCYStakerResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory QueryTCYStakerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYStakerResponse(
      address: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYStakerResponse;
}

class QueryTCYStakersRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTCYStakersResponse> {
  final String? height;

  const QueryTCYStakersRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/tcy_stakers",
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

  factory QueryTCYStakersRequest.fromJson(Map<String, dynamic> json) {
    return QueryTCYStakersRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryTCYStakersRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYStakersRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYStakersRequest;
  @override
  QueryTCYStakersResponse onQueryResponse(List<int> bytes) {
    return QueryTCYStakersResponse.deserialize(bytes);
  }

  @override
  QueryTCYStakersResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTCYStakersResponse.fromJson(json);
  }
}

class QueryTCYStakersResponse extends CosmosProtoMessage {
  final List<QueryTCYStakerResponse> tcyStakers;

  const QueryTCYStakersResponse({this.tcyStakers = const []});

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
  List<Object?> get protoValues => [tcyStakers];

  @override
  Map<String, dynamic> toJson() {
    return {'tcy_stakers': tcyStakers.map((e) => e.toJson()).toList()};
  }

  factory QueryTCYStakersResponse.fromJson(Map<String, dynamic> json) {
    return QueryTCYStakersResponse(
      tcyStakers:
          (json.valueEnsureAsList<dynamic>(
                'tcy_stakers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  QueryTCYStakerResponse,
                  Map<String, dynamic>
                >(value: e, parse: (v) => QueryTCYStakerResponse.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryTCYStakersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTCYStakersResponse(
      tcyStakers:
          decode
              .getListOfBytes(1)
              .map((b) => QueryTCYStakerResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryTCYStakersResponse;
}
