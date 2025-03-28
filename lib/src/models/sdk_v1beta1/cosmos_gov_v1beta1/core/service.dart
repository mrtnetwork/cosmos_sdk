import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/service/msg_deposit.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/service/msg_submit_proposal.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/service/msg_vote.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/service/msg_vote_weighted.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class GovV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const GovV1Beta1Service();

  static T? fromJson<T extends GovV1Beta1Service>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = GovV1beta1types.findService(typeUrl);
    final GovV1Beta1Service? service = switch (type) {
      GovV1beta1types.govMsgDeposit => GovMsgDeposit.fromJson(json),
      GovV1beta1types.govMsgSubmitProposal =>
        GovMsgSubmitProposal.fromJson(json),
      GovV1beta1types.govMsgVoteWeighted => GovMsgVoteWeighted.fromJson(json),
      GovV1beta1types.govMsgVote => GovMsgVote.fromJson(json),
      _ => null
    } as GovV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid GovV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends GovV1Beta1Service>(
      {required String typeUrl, required List<int> bytes}) {
    final type = GovV1beta1types.findService(typeUrl);
    final GovV1Beta1Service? service = switch (type) {
      GovV1beta1types.govMsgDeposit => GovMsgDeposit.deserialize(bytes),
      GovV1beta1types.govMsgSubmitProposal =>
        GovMsgSubmitProposal.deserialize(bytes),
      GovV1beta1types.govMsgVoteWeighted =>
        GovMsgVoteWeighted.deserialize(bytes),
      GovV1beta1types.govMsgVote => GovMsgVote.deserialize(bytes),
      _ => null
    } as GovV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid GovV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
