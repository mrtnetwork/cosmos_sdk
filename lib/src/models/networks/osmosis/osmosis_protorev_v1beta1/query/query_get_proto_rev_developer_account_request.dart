import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_developer_account_response.dart';

/// QueryGetProtoRevDeveloperAccountRequest is request type for the Query/GetProtoRevDeveloperAccount RPC method.
class OsmosisProtorevQueryGetProtoRevDeveloperAccountRequest
    extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse>,
        RPCMessage<OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse> {
  const OsmosisProtorevQueryGetProtoRevDeveloperAccountRequest();
  factory OsmosisProtorevQueryGetProtoRevDeveloperAccountRequest.deserialize(
      List<int> bytes) {
    return const OsmosisProtorevQueryGetProtoRevDeveloperAccountRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse.deserialize(
        bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse.fromRpc(
        json);
  }

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types
      .queryGetProtoRevDeveloperAccountRequest.typeUrl;

  @override
  String get queryPath =>
      OsmosisProtorevV1beta1Types.getProtoRevDeveloperAccount.typeUrl;

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath =>
      OsmosisProtorevV1beta1Types.getProtoRevDeveloperAccount.rpcUrl();
}
