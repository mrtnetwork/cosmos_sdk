import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class GovMsgSubmitProposalResponse extends CosmosMessage {
  final BigInt proposalId;
  const GovMsgSubmitProposalResponse(this.proposalId);
  factory GovMsgSubmitProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovMsgSubmitProposalResponse(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"proposal_id": proposalId.toString()};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govMsgSubmitProposalResponse;

  @override
  List get values => [proposalId];
}
