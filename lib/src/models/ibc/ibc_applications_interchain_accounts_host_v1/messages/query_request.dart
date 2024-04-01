import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryRequest defines the parameters for a particular query request by an interchain account.
class InterchainAccountsHostQueryRequest extends CosmosMessage {
  /// path defines the path of the query request as defined by ADR-021.
  /// https://github.com/cosmos/cosmos-sdk/blob/main/docs/architecture/adr-021-protobuf-query-encoding.md#custom-query-registration-and-routing
  final String? path;

  /// data defines the payload of the query request as defined by ADR-021.
  /// https://github.com/cosmos/cosmos-sdk/blob/main/docs/architecture/adr-021-protobuf-query-encoding.md#custom-query-registration-and-routing
  final List<int>? data;
  InterchainAccountsHostQueryRequest({this.path, List<int>? data})
      : data = BytesUtils.tryToBytes(data, unmodifiable: true);
  factory InterchainAccountsHostQueryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsHostQueryRequest(
        path: decode.getField(1), data: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"path": path, "data": BytesUtils.tryToHexString(data)};
  }

  @override
  String get typeUrl => IbcTypes.interchainAccountsQueryRequest.typeUrl;

  @override
  List get values => [path, data];
}
