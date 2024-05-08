import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_admin_account_response.dart';

/// QueryGetProtoRevAdminAccountResponse is response type for the Query/GetProtoRevAdminAccount RPC method.
class OsmosisProtorevQueryGetProtoRevAdminAccountRequest extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryGetProtoRevAdminAccountResponse>,
        RPCMessage<OsmosisProtorevQueryGetProtoRevAdminAccountResponse> {
  const OsmosisProtorevQueryGetProtoRevAdminAccountRequest();
  factory OsmosisProtorevQueryGetProtoRevAdminAccountRequest.deserialize(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevAdminAccountRequest();
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
  OsmosisProtorevQueryGetProtoRevAdminAccountResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevAdminAccountResponse.deserialize(
        bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevAdminAccountResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevAdminAccountResponse.fromRpc(json);
  }

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevAdminAccountRequest.typeUrl;

  @override
  String get queryPath =>
      OsmosisProtorevV1beta1Types.getProtoRevAdminAccount.typeUrl;

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath =>
      OsmosisProtorevV1beta1Types.getProtoRevAdminAccount.rpcUrl();
}
