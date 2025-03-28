import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_admin_account_response.dart';

/// QueryGetProtoRevAdminAccountResponse is response type for the Query/GetProtoRevAdminAccount RPC method.
class OsmosisProtorevQueryGetProtoRevAdminAccountRequest extends CosmosMessage
    with QueryMessage<OsmosisProtorevQueryGetProtoRevAdminAccountResponse> {
  const OsmosisProtorevQueryGetProtoRevAdminAccountRequest();
  factory OsmosisProtorevQueryGetProtoRevAdminAccountRequest.deserialize(
      List<int> bytes) {
    return const OsmosisProtorevQueryGetProtoRevAdminAccountRequest();
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
    return OsmosisProtorevQueryGetProtoRevAdminAccountResponse.fromJson(json);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevAdminAccountRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
