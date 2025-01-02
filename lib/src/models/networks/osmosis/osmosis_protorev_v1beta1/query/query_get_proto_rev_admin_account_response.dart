import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGetProtoRevAdminAccountResponse is response type for the Query/GetProtoRevAdminAccount RPC method.
class OsmosisProtorevQueryGetProtoRevAdminAccountResponse
    extends CosmosMessage {
  /// [adminAccount] is the admin account of the module
  final String? adminAccount;
  const OsmosisProtorevQueryGetProtoRevAdminAccountResponse(
      {this.adminAccount});
  factory OsmosisProtorevQueryGetProtoRevAdminAccountResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevAdminAccountResponse(
        adminAccount: decode.getField(1));
  }
  factory OsmosisProtorevQueryGetProtoRevAdminAccountResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevAdminAccountResponse(
        adminAccount: json["admin_account"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"admin_account": adminAccount};
  }

  @override
  List get values => [adminAccount];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevAdminAccountResponse;
}
