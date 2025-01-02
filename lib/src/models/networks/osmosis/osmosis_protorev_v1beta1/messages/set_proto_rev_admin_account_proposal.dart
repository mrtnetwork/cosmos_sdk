import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SetProtoRevAdminAccountProposal is a gov Content type to set the admin account that will
/// receive permissions to alter hot routes and set the developer address that will be receiving
/// a share of profits from the module
class OsmosisProtorevSetProtoRevAdminAccountProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final String? account;
  OsmosisProtorevSetProtoRevAdminAccountProposal(
      {this.title, this.description, this.account});

  factory OsmosisProtorevSetProtoRevAdminAccountProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevSetProtoRevAdminAccountProposal(
        title: decode.getField(1),
        description: decode.getField(2),
        account: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"title": title, "description": description, "account": account};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.setProtoRevAdminAccountProposal;

  @override
  List get values => [title, description, account];
}
