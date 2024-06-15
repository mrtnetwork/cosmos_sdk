import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

/// PageResponse is to be embedded in gRPC response messages where the corresponding
/// request message has used PageRequest.
/// message SomeResponse { repeated Bar results = 1; PageResponse page = 2; }
class PageResponse extends CosmosMessage {
  /// next_key is the key to be passed to PageRequest.key to
  /// query the next page most efficiently. It will be empty if
  /// there are no more results.
  final List<int>? nextKey;

  /// total is total number of results available if PageRequest.count_total
  /// was set, its value is undefined otherwise
  final BigInt? total;
  const PageResponse({this.nextKey, this.total});

  factory PageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PageResponse(
        nextKey: decode.getField(1),
        total: decode.getResult(2)?.cast<BigInt>());
  }
  factory PageResponse.fromRpc(Map<String, dynamic> json) {
    return PageResponse(
        nextKey: StringUtils.tryEncode(json["next_key"],
            type: StringEncoding.base64),
        total: BigInt.tryParse(json["total"] ?? "0"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "next_key": BytesUtils.tryToHexString(nextKey),
      "total": total?.toString()
    };
  }

  @override
  String get typeUrl => BaseQueryV1beta1Types.pageResponse.typeUrl;

  @override
  List get values => [nextKey, total];
}
