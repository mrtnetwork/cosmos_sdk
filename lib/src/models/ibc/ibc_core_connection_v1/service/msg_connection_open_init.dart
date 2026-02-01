import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/counterparty.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/version.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgConnectionOpenInit defines the msg sent by an account on Chain A to initialize a connection with Chain B.
class IbcConnectionMsgConnectionOpenInit
    extends IbcService<EmptyServiceRequestResponse> {
  final String? clientId;
  final IbcConnectionCounterparty counterparty;
  final IbcConnectionVersion? version;
  final BigInt? delayPeriod;
  final String? signer;
  const IbcConnectionMsgConnectionOpenInit({
    this.clientId,
    required this.counterparty,
    this.version,
    this.delayPeriod,
    this.signer,
  });
  factory IbcConnectionMsgConnectionOpenInit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionMsgConnectionOpenInit(
      clientId: decode.getField(1),
      counterparty: IbcConnectionCounterparty.deserialize(decode.getField(2)),
      version: decode
          .getResult(3)
          ?.to<IbcConnectionVersion, List<int>>(
            (e) => IbcConnectionVersion.deserialize(e),
          ),
      signer: decode.getField(5),
      delayPeriod: decode.getField(4),
    );
  }
  factory IbcConnectionMsgConnectionOpenInit.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcConnectionMsgConnectionOpenInit(
      clientId: json.as("client_id"),
      counterparty: IbcConnectionCounterparty.fromJson(
        json.asMap("counterparty"),
      ),
      version: json.maybeAs<IbcConnectionVersion, Map<String, dynamic>>(
        key: "version",
        onValue: IbcConnectionVersion.fromJson,
      ),
      delayPeriod: json.asBigInt("delay_period"),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "counterparty": counterparty.toJson(),
      "version": version?.toJson(),
      "delay_period": delayPeriod?.toString(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgConnectionOpenInit;

  @override
  List get values => [clientId, counterparty, version, delayPeriod, signer];
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgConnectionOpenInitResponse);
  }
}
