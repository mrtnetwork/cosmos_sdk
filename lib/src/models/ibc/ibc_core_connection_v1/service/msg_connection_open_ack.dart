import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/version.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgConnectionOpenAck defines a msg sent by a Relayer to Chain A to acknowledge the change of connection state to TRYOPEN on Chain B.
class IbcConnectionMsgConnectionOpenAck extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// Deprecated: this field is unused. Crossing hellos are no longer supported in core IBC
  final String? connectionId;
  final String? counterpartyConnectionId;
  final IbcConnectionVersion? version;
  final Any? clientState;
  final IbcClientHeight proofHeight;

  /// proof of the initialization the connection on Chain B: `UNINITIALIZED ->
  /// TRYOPEN`
  final List<int>? proofTry;

  /// proof of client state included in message
  final List<int>? proofClient;

  /// proof of client consensus state
  final List<int>? proofConsensus;
  final IbcClientHeight consensusHeight;
  final String? signer;

  /// optional proof data for host state machines that are unable to introspect their own consensus state
  final List<int>? hostConsensusStateProof;
  IbcConnectionMsgConnectionOpenAck({
    this.connectionId,
    this.counterpartyConnectionId,
    this.clientState,
    this.version,
    required this.proofHeight,
    List<int>? proofTry,
    List<int>? proofClient,
    List<int>? proofConsensus,
    required this.consensusHeight,
    this.signer,
    List<int>? hostConsensusStateProof,
  })  : proofTry = BytesUtils.tryToBytes(proofTry, unmodifiable: true),
        proofClient = BytesUtils.tryToBytes(proofClient, unmodifiable: true),
        proofConsensus =
            BytesUtils.tryToBytes(proofConsensus, unmodifiable: true),
        hostConsensusStateProof =
            BytesUtils.tryToBytes(hostConsensusStateProof, unmodifiable: true);
  factory IbcConnectionMsgConnectionOpenAck.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionMsgConnectionOpenAck(
        connectionId: decode.getField(1),
        counterpartyConnectionId: decode.getField(2),
        version: decode.getResult(3)?.to<IbcConnectionVersion, List<int>>(
            (e) => IbcConnectionVersion.deserialize(e)),
        clientState:
            decode.getResult(4)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        proofHeight: IbcClientHeight.deserialize(decode.getField(5)),
        proofTry: decode.getField(6),
        proofClient: decode.getField(7),
        proofConsensus: decode.getField(8),
        consensusHeight: IbcClientHeight.deserialize(decode.getField(9)),
        signer: decode.getField(10),
        hostConsensusStateProof: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  String get service => IbcTypes.ibcConnectionConnectionOpenAck.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "connection_id": connectionId,
      "counterparty_connection_id": counterpartyConnectionId,
      "version": version?.toJson(),
      "client_state": clientState?.toJson(),
      "proof_height": proofHeight.toJson(),
      "proof_try": BytesUtils.tryToHexString(proofTry),
      "proof_client": BytesUtils.tryToHexString(proofClient),
      "proof_consensus": BytesUtils.tryToHexString(proofConsensus),
      "consensus_height": consensusHeight.toJson(),
      "signer": signer,
      "host_consensus_state_proof":
          BytesUtils.tryToHexString(hostConsensusStateProof)
    };
  }

  @override
  String get typeUrl => IbcTypes.msgConnectionOpenAck.typeUrl;

  @override
  List get values => [
        connectionId,
        counterpartyConnectionId,
        version,
        clientState,
        proofHeight,
        proofTry,
        proofClient,
        proofConsensus,
        consensusHeight,
        signer,
        hostConsensusStateProof
      ];
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.msgConnectionOpenAckResponse.typeUrl);
  }
}
