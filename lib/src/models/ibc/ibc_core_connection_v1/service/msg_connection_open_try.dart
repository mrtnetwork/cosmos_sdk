import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/counterparty.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/version.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// MsgConnectionOpenTry defines a msg sent by a Relayer to try to open a connection on Chain B.
class IbcConnectionMsgConnectionOpenTry extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// Deprecated: this field is unused. Crossing hellos are no longer supported in core IBC
  final String? clientId;
  final String? previousConnectionId;
  final Any? clientState;
  final IbcConnectionCounterparty counterparty;
  final BigInt? delayPeriod;
  final List<IbcConnectionVersion>? counterpartyVersions;
  final IbcClientHeight proofHeight;

  /// proof of the initialization the connection on Chain A: `UNINITIALIZED ->
  /// INIT`
  final List<int>? proofInit;

  /// proof of client state included in message
  final List<int>? proofClient;

  /// proof of client consensus state
  final List<int>? proofConsensus;
  final IbcClientHeight consensusHeight;
  final String? signer;

  /// optional proof data for host state machines that are unable to introspect their own consensus state
  final List<int>? hostConsensusStateProof;
  IbcConnectionMsgConnectionOpenTry({
    this.clientId,
    this.previousConnectionId,
    this.clientState,
    required this.counterparty,
    this.delayPeriod,
    List<IbcConnectionVersion>? counterpartyVersions,
    required this.proofHeight,
    List<int>? proofInit,
    List<int>? proofClient,
    List<int>? proofConsensus,
    required this.consensusHeight,
    this.signer,
    List<int>? hostConsensusStateProof,
  })  : counterpartyVersions = counterpartyVersions?.mutable,
        proofInit = BytesUtils.tryToBytes(proofInit, unmodifiable: true),
        proofClient = BytesUtils.tryToBytes(proofClient, unmodifiable: true),
        proofConsensus =
            BytesUtils.tryToBytes(proofConsensus, unmodifiable: true),
        hostConsensusStateProof =
            BytesUtils.tryToBytes(hostConsensusStateProof, unmodifiable: true);
  factory IbcConnectionMsgConnectionOpenTry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionMsgConnectionOpenTry(
        clientId: decode.getField(1),
        previousConnectionId: decode.getField(2),
        clientState:
            decode.getResult(3)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        counterparty: IbcConnectionCounterparty.deserialize(decode.getField(4)),
        delayPeriod: decode.getField(5),
        counterpartyVersions: decode
            .getFields<List<int>>(6)
            .map((e) => IbcConnectionVersion.deserialize(e))
            .toList(),
        proofHeight: IbcClientHeight.deserialize(decode.getField(7)),
        proofInit: decode.getField(8),
        proofClient: decode.getField(9),
        proofConsensus: decode.getField(10),
        consensusHeight: IbcClientHeight.deserialize(decode.getField(11)),
        signer: decode.getField(12),
        hostConsensusStateProof: decode.getField(13));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  @override
  String get service => IbcTypes.ibcConnectionConnectionOpenTry.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "previous_connection_id": previousConnectionId,
      "client_state": clientState?.toJson(),
      "counterparty": counterparty.toJson(),
      "delay_period": delayPeriod?.toString(),
      "counterparty_versions":
          counterpartyVersions?.map((e) => e.toJson()).toList(),
      "proof_height": proofHeight.toJson(),
      "proof_init": BytesUtils.tryToHexString(proofInit),
      "proof_client": BytesUtils.tryToHexString(proofClient),
      "proof_consensus": BytesUtils.tryToHexString(proofConsensus),
      "consensus_height": consensusHeight.toJson(),
      "signer": signer,
      "host_consensus_state_proof":
          BytesUtils.tryToHexString(hostConsensusStateProof)
    };
  }

  @override
  String get typeUrl => IbcTypes.msgConnectionOpenTry.typeUrl;

  @override
  List get values => [
        clientId,
        previousConnectionId,
        clientState,
        counterparty,
        delayPeriod,
        counterpartyVersions,
        proofHeight,
        proofInit,
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
        IbcTypes.msgConnectionOpenTryResponse.typeUrl);
  }
}
