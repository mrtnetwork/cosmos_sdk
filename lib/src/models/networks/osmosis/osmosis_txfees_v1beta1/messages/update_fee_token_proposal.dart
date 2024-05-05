import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'fee_token.dart';

/// UpdateFeeTokenProposal is a gov Content type for adding a new whitelisted fee token.
/// It must specify a denom along with gamm pool ID to use as a spot price calculator.
/// It can be used to add a new denom to the whitelist It can also be used to update the Pool
/// to associate with the denom. If Pool ID is set to 0, it will remove the denom from the whitelisted set.
class OsmosisTxfeesUpdateFeeTokenProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final OsmosisTxfeesFeeToken feetoken;
  const OsmosisTxfeesUpdateFeeTokenProposal(
      {this.title, this.description, required this.feetoken});
  factory OsmosisTxfeesUpdateFeeTokenProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesUpdateFeeTokenProposal(
        title: decode.getField(1),
        description: decode.getField(2),
        feetoken: OsmosisTxfeesFeeToken.deserialize(decode.getField(3)));
  }
  factory OsmosisTxfeesUpdateFeeTokenProposal.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTxfeesUpdateFeeTokenProposal(
        title: json["title"],
        description: json["description"],
        feetoken: OsmosisTxfeesFeeToken.fromRpc(json["feetoken"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "feetoken": feetoken.toJson()
    };
  }

  @override
  String get typeUrl =>
      OsmosisTxfeesV1beta1Types.updateFeeTokenProposal.typeUrl;

  @override
  List get values => [title, description, feetoken];
}
