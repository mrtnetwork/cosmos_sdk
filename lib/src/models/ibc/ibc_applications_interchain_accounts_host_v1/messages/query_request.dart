import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryRequest defines the parameters for a particular query request by an interchain account.
class InterchainAccountsHostQueryRequest extends CosmosMessage {
  /// path defines the path of the query request as defined by ADR-021.
  /// https://github.com/cosmos/cosmos-sdk/blob/main/docs/architecture/adr-021-protobuf-query-encoding.md#custom-query-registration-and-routing
  final String? path;

  /// data defines the payload of the query request as defined by ADR-021.
  /// https://github.com/cosmos/cosmos-sdk/blob/main/docs/architecture/adr-021-protobuf-query-encoding.md#custom-query-registration-and-routing
  final List<int>? data;
  InterchainAccountsHostQueryRequest({this.path, List<int>? data})
    : data = data?.asImmutableBytes;
  factory InterchainAccountsHostQueryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsHostQueryRequest(
      path: decode.getField(1),
      data: decode.getField(2),
    );
  }
  factory InterchainAccountsHostQueryRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return InterchainAccountsHostQueryRequest(
      path: json.as("path"),
      data: json.asBytes("data"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"path": path, "data": BytesUtils.tryToHexString(data)};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.interchainAccountsQueryRequest;

  @override
  List get values => [path, data];
}
