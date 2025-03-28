import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_denom_response.dart';

/// QueryDenomRequest is the request type for the Query/Denom RPC
/// method
class IbcTransferV2QueryDenomRequest extends CosmosMessage
    with QueryMessage<IbcTransferV2QueryDenomResponse> {
  /// hash (in hex format) or denom (full denom with ibc prefix) of the on chain denomination.
  final String hash;

  const IbcTransferV2QueryDenomRequest({required this.hash});

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"hash": hash};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryDenomRequest;

  @override
  List get values => [hash];

  @override
  IbcTransferV2QueryDenomResponse onJsonResponse(Map<String, dynamic> json) {
    return IbcTransferV2QueryDenomResponse.fromJson(json);
  }

  @override
  IbcTransferV2QueryDenomResponse onResponse(List<int> bytes) {
    return IbcTransferV2QueryDenomResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [hash];
}
