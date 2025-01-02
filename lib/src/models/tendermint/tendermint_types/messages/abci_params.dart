import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

//// ABCIParams configure functionality specific to the Application Blockchain Interface.
class ABCIParams extends CosmosMessage {
  /// vote_extensions_enable_height configures the first height during which
  /// vote extensions will be enabled. During this specified height, and for all
  /// subsequent heights, precommit messages that do not contain valid extension data
  /// will be considered invalid. Prior to this height, vote extensions will not
  /// be used or accepted by validators on the network.
  ///
  /// Once enabled, vote extensions will be created by the application in ExtendVote,
  /// passed to the application for validation in VerifyVoteExtension and given
  /// to the application to use when proposing a block during PrepareProposal.
  final BigInt? voteExtensionsEnableHeight;
  const ABCIParams({this.voteExtensionsEnableHeight});
  factory ABCIParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ABCIParams(voteExtensionsEnableHeight: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "vote_extensions_enable_height": voteExtensionsEnableHeight?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.abciParams;

  @override
  List get values => [voteExtensionsEnableHeight];
}
