import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/deposit_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/tally_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/voting_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class GovQueryParamsResponse extends CosmosMessage {
  /// voting_params defines the parameters related to voting.
  final GovVotingParams votingParams;

  /// deposit_params defines the parameters related to deposit.
  final GovDepositParams depositParams;

  /// tally_params defines the parameters related to tally.
  final GovTallyParams tallyParams;
  const GovQueryParamsResponse(
      {required this.votingParams,
      required this.depositParams,
      required this.tallyParams});
  factory GovQueryParamsResponse.fromRpc(Map<String, dynamic> json) {
    return GovQueryParamsResponse(
      votingParams: GovVotingParams.fromRpc(json["voting_params"]),
      depositParams: GovDepositParams.fromRpc(json["deposit_params"]),
      tallyParams: GovTallyParams.fromRpc(json["tally_params"]),
    );
  }
  factory GovQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryParamsResponse(
        votingParams: GovVotingParams.deserialize(decode.getField(1)),
        depositParams: GovDepositParams.deserialize(decode.getField(2)),
        tallyParams: GovTallyParams.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "voting_params": votingParams.toJson(),
      "deposit_params": depositParams.toJson(),
      "tally_params": tallyParams.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryParamsResponse;

  @override
  List get values => [votingParams, depositParams, tallyParams];
}
