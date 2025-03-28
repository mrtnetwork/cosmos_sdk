import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_submit_proposal_response.dart';

/// MsgSubmitProposal defines an sdk.Msg type that supports submitting arbitrary proposal Content.
class GovMsgSubmitProposal
    extends GovV1Beta1Service<GovMsgSubmitProposalResponse>
    with AminoMessage<GovMsgSubmitProposalResponse> {
  /// content is the proposal's content.
  final Any? content;

  /// initial_deposit is the deposit value that must be paid at proposal submission.
  final List<Coin> initialDeposit;

  /// proposer is the account address of the proposer.
  final CosmosBaseAddress? proposer;
  GovMsgSubmitProposal(
      {this.content, required List<Coin> initialDeposit, this.proposer})
      : initialDeposit = initialDeposit.immutable;
  factory GovMsgSubmitProposal.fromJson(Map<String, dynamic> json) {
    return GovMsgSubmitProposal(
      proposer: json.asAddress("proposer"),
      content: json.maybeAs<Any, Map<String, dynamic>>(
          key: "content", onValue: (e) => Any.fromJson(e)),
      initialDeposit: json
              .asListOfMap("initial_deposit")
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          [],
    );
  }
  factory GovMsgSubmitProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovMsgSubmitProposal(
        content:
            decode.getResult(1)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        initialDeposit: decode
            .getFields<List<int>>(2)
            .map((e) => Coin.deserialize(e))
            .toList(),
        proposer: decode
            .getResult(3)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson({bool amino = false}) {
    return {
      "content": amino ? content?.toAminoJson() : content?.toJson(),
      "initial_deposit": initialDeposit.map((e) => e.toJson()).toList(),
      "proposer": proposer?.address
    };
  }

  @override
  Map<String, dynamic> toAminoJson() {
    return {
      "type": typeUrl.aminoType!,
      "value": toJson(amino: true)..removeWhere((k, v) => v == null)
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govMsgSubmitProposal;

  @override
  List get values => [content, initialDeposit, proposer];
  @override
  List<String?> get signers => [proposer?.address];

  @override
  GovMsgSubmitProposalResponse onResponse(List<int> bytes) {
    return GovMsgSubmitProposalResponse.deserialize(bytes);
  }
}
