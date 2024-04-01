import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/counterparty.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/version.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgConnectionOpenInit defines the msg sent by an account on Chain A to initialize a connection with Chain B.
class IbcConnectionMsgConnectionOpenInit extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final String? clientId;
  final IbcConnectionCounterparty counterparty;
  final IbcConnectionVersion? version;
  final BigInt? delayPeriod;
  final String? signer;
  const IbcConnectionMsgConnectionOpenInit(
      {this.clientId,
      required this.counterparty,
      this.version,
      this.delayPeriod,
      this.signer});
  factory IbcConnectionMsgConnectionOpenInit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionMsgConnectionOpenInit(
      clientId: decode.getField(1),
      counterparty: IbcConnectionCounterparty.deserialize(decode.getField(2)),
      version: decode.getResult(3)?.to<IbcConnectionVersion, List<int>>(
          (e) => IbcConnectionVersion.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  String get service => IbcTypes.ibcConnectionConnectionOpenInit.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "counterparty": counterparty.toJson(),
      "version": version?.toJson(),
      "delay_period": delayPeriod?.toString(),
      "signer": signer
    };
  }

  @override
  String get typeUrl => IbcTypes.msgConnectionOpenInit.typeUrl;

  @override
  List get values => [clientId, counterparty, version, delayPeriod, signer];
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.msgConnectionOpenInitResponse.typeUrl);
  }
}
