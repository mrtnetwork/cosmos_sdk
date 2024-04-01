import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

/// PageRequest is to be embedded in gRPC request messages for efficient pagination. Ex:
/// message SomeRequest { Foo some_parameter = 1; PageRequest pagination = 2; }
class PageRequest extends CosmosMessage {
  /// key is a value returned in PageResponse.next_key to begin
  /// querying the next page most efficiently. Only one of offset or key
  /// should be set.
  final List<int>? key;

  /// offset is a numeric offset that can be used when key is unavailable.
  /// It is less efficient than using key. Only one of offset or key should
  /// be set.z
  final BigInt? offset;

  /// limit is the total number of results to be returned in the result page.
  /// If left empty it will default to a value to be set by each app.
  final BigInt? limit;

  /// count_total is set to true  to indicate that the result set should include
  /// a count of the total number of items available for pagination in UIs.
  /// count_total is only respected when offset is used. It is ignored when key
  /// is set.
  final bool? countTotal;

  /// reverse is set to true if results are to be returned in the descending order.
  ///
  /// Since: cosmos-sdk 0.43
  final bool? reverse;
  const PageRequest(
      {this.countTotal, this.key, this.limit, this.offset, this.reverse});
  factory PageRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PageRequest(
        key: decode.getResult(1)?.to<List<int>, List<int>>((e) => e),
        offset: decode.getResult(2)?.cast<BigInt>(),
        limit: decode.getResult(3)?.cast<BigInt>(),
        countTotal: decode.getResult(4)?.cast<bool>(),
        reverse: decode.getResult(5)?.cast<bool>());
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "key": BytesUtils.tryToHexString(key),
      "offset": offset?.toString(),
      "limit": limit?.toString(),
      "count_total": countTotal,
      "reverse": reverse
    };
  }

  @override
  String get typeUrl => BaseQueryV1beta1Types.pageRequest.typeUrl;

  @override
  List get values => [key, offset, limit, countTotal, reverse];
}
