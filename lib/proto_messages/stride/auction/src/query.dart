import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stride/auction/src/auction.dart"
    as stride_auction_auction;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryAuctionRequest is the request type for the Query/Auction RPC
/// method
class QueryAuctionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAuctionResponse> {
  final String? name;

  const QueryAuctionRequest({this.name});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/auction/auction/{name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [name];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  factory QueryAuctionRequest.fromJson(Map<String, dynamic> json) {
    return QueryAuctionRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
    );
  }

  factory QueryAuctionRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionRequest(name: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionQueryAuctionRequest;
  @override
  QueryAuctionResponse onQueryResponse(List<int> bytes) {
    return QueryAuctionResponse.deserialize(bytes);
  }

  @override
  QueryAuctionResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAuctionResponse.fromJson(json);
  }
}

/// QueryAuctionResponse is the response type for the Query/Auction RPC
/// method
class QueryAuctionResponse extends CosmosProtoMessage {
  final stride_auction_auction.Auction? auction;

  const QueryAuctionResponse({this.auction});

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
  List<Object?> get protoValues => [auction];

  @override
  Map<String, dynamic> toJson() {
    return {'auction': auction?.toJson()};
  }

  factory QueryAuctionResponse.fromJson(Map<String, dynamic> json) {
    return QueryAuctionResponse(
      auction: json
          .valueTo<stride_auction_auction.Auction?, Map<String, dynamic>>(
            key: 'auction',
            parse: (v) => stride_auction_auction.Auction.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryAuctionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionResponse(
      auction: decode.messageTo<stride_auction_auction.Auction?>(
        1,
        (b) => stride_auction_auction.Auction.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionQueryAuctionResponse;
}

/// QueryAuctionsRequest is the request type for the
/// Query/Auctions RPC method
class QueryAuctionsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAuctionsResponse> {
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAuctionsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stride/auction/auctions",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryAuctionsRequest.fromJson(Map<String, dynamic> json) {
    return QueryAuctionsRequest(
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAuctionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionQueryAuctionsRequest;
  @override
  QueryAuctionsResponse onQueryResponse(List<int> bytes) {
    return QueryAuctionsResponse.deserialize(bytes);
  }

  @override
  QueryAuctionsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAuctionsResponse.fromJson(json);
  }
}

/// QueryAuctionsResponse is the response type for the
/// Query/Auctions RPC method
class QueryAuctionsResponse extends CosmosProtoMessage {
  final List<stride_auction_auction.Auction> auctions;

  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAuctionsResponse({this.auctions = const [], this.pagination});

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [auctions, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'auctions': auctions.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAuctionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAuctionsResponse(
      auctions:
          (json.valueEnsureAsList<dynamic>('auctions', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stride_auction_auction.Auction,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stride_auction_auction.Auction.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAuctionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAuctionsResponse(
      auctions:
          decode
              .getListOfBytes(1)
              .map((b) => stride_auction_auction.Auction.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideAuctionQueryAuctionsResponse;
}
