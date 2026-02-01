import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/counterparty.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/version.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgConnectionOpenTry defines a msg sent by a Relayer to try to open a connection on Chain B.
class IbcConnectionMsgConnectionOpenTry
    extends IbcService<EmptyServiceRequestResponse> {
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
  }) : counterpartyVersions = counterpartyVersions?.immutable,
       proofInit = BytesUtils.tryToBytes(proofInit, unmodifiable: true),
       proofClient = BytesUtils.tryToBytes(proofClient, unmodifiable: true),
       proofConsensus = BytesUtils.tryToBytes(
         proofConsensus,
         unmodifiable: true,
       ),
       hostConsensusStateProof = BytesUtils.tryToBytes(
         hostConsensusStateProof,
         unmodifiable: true,
       );
  factory IbcConnectionMsgConnectionOpenTry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionMsgConnectionOpenTry(
      clientId: decode.getField(1),
      previousConnectionId: decode.getField(2),
      clientState: decode
          .getResult(3)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
      counterparty: IbcConnectionCounterparty.deserialize(decode.getField(4)),
      delayPeriod: decode.getField(5),
      counterpartyVersions:
          decode
              .getFields<List<int>>(6)
              .map((e) => IbcConnectionVersion.deserialize(e))
              .toList(),
      proofHeight: IbcClientHeight.deserialize(decode.getField(7)),
      proofInit: decode.getField(8),
      proofClient: decode.getField(9),
      proofConsensus: decode.getField(10),
      consensusHeight: IbcClientHeight.deserialize(decode.getField(11)),
      signer: decode.getField(12),
      hostConsensusStateProof: decode.getField(13),
    );
  }
  factory IbcConnectionMsgConnectionOpenTry.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcConnectionMsgConnectionOpenTry(
      clientId: json.as("client_id"),
      previousConnectionId: json.as("previous_connection_id"),
      clientState: json.maybeAs<Any, Map<String, dynamic>>(
        key: "client_state",
        onValue: Any.fromJson,
      ),
      counterparty: IbcConnectionCounterparty.fromJson(
        json.asMap("counterparty"),
      ),
      delayPeriod: json.asBigInt("delay_period"),
      counterpartyVersions:
          json
              .asListOfMap("counterparty_versions")
              ?.map((e) => IbcConnectionVersion.fromJson(e))
              .toList(),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
      proofInit: json.asBytes("proof_init"),
      proofClient: json.asBytes("proof_client"),
      proofConsensus: json.as("proof_consensus"),
      consensusHeight: IbcClientHeight.fromJson(json.asMap("consensus_height")),
      signer: json.as("signer"),
      hostConsensusStateProof: json.asBytes("host_consensus_state_proof"),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

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
      "host_consensus_state_proof": BytesUtils.tryToHexString(
        hostConsensusStateProof,
      ),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgConnectionOpenTry;

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
    hostConsensusStateProof,
  ];

  @override
  List<String?> get signers => [signer];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgConnectionOpenTryResponse);
  }
}
