import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpgradeClient defines an sdk.Msg to upgrade an IBC client to a new client state
class MsgUpgradeClient extends IbcService<EmptyServiceRequestResponse> {
  /// client unique identifier
  final String? clientId;

  /// upgraded client state
  final Any? clientState;

  /// upgraded consensus state, only contains enough information to serve as a
  /// basis of trust in update logic
  final Any? consensusState;

  /// proof that old chain committed to new client
  final List<int>? proofUpgradeClient;

  /// proof that old chain committed to new consensus state
  final List<int>? proofUpgradeConsensusState;

  /// signer address
  final String? signer;
  MsgUpgradeClient({
    this.clientId,
    this.clientState,
    this.consensusState,
    List<int>? proofUpgradeClient,
    List<int>? proofUpgradeConsensusState,
    this.signer,
  }) : proofUpgradeClient = BytesUtils.tryToBytes(
         proofUpgradeClient,
         unmodifiable: true,
       ),
       proofUpgradeConsensusState = BytesUtils.tryToBytes(
         proofUpgradeConsensusState,
         unmodifiable: true,
       );
  factory MsgUpgradeClient.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgUpgradeClient(
      clientId: decode.getField(1),
      clientState: decode
          .getResult(2)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
      consensusState: decode
          .getResult(3)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
      proofUpgradeClient: decode.getField(4),
      proofUpgradeConsensusState: decode.getField(5),
      signer: decode.getField(6),
    );
  }
  factory MsgUpgradeClient.fromJson(Map<String, dynamic> json) {
    return MsgUpgradeClient(
      clientId: json.as("client_id"),
      clientState: json.maybeAs<Any, Map<String, dynamic>>(
        key: "client_state",
        onValue: Any.fromJson,
      ),
      consensusState: json.maybeAs<Any, Map<String, dynamic>>(
        key: "consensus_state",
        onValue: Any.fromJson,
      ),
      proofUpgradeClient: json.asBytes("proof_upgrade_client"),
      proofUpgradeConsensusState: json.asBytes("proof_upgrade_consensus_state"),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "client_state": clientState?.toJson(),
      "consensus_state": consensusState?.toJson(),
      "proof_upgrade_client": BytesUtils.tryToHexString(proofUpgradeClient),
      "proof_upgrade_consensus_state": BytesUtils.tryToHexString(
        proofUpgradeConsensusState,
      ),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgUpgradeClient;

  @override
  List get values => [
    clientId,
    clientState,
    consensusState,
    proofUpgradeClient,
    proofUpgradeConsensusState,
    signer,
  ];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgUpgradeClientResponse);
  }
}
