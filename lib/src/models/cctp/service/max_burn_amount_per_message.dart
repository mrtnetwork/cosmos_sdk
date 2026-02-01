import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgSetMaxBurnAmountPerMessage
    extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage {
  final String from;
  final String localToken;
  final String amount;
  const CCTPV1MsgSetMaxBurnAmountPerMessage({
    required this.from,
    required this.localToken,
    required this.amount,
  });

  factory CCTPV1MsgSetMaxBurnAmountPerMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgSetMaxBurnAmountPerMessage(
      from: decode.getField(1),
      localToken: decode.getField(2),
      amount: decode.getField(3),
    );
  }
  factory CCTPV1MsgSetMaxBurnAmountPerMessage.fromJson(
    Map<String, dynamic> json,
  ) {
    return CCTPV1MsgSetMaxBurnAmountPerMessage(
      from: json.as("from"),
      localToken: json.as("local_token"),
      amount: json.as("amount"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "local_token": localToken, "amount": amount};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgSetMaxBurnAmountPerMessage;

  @override
  List get values => [from, localToken, amount];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      CCTPV1Types.msgSetMaxBurnAmountPerMessageResponse,
    );
  }
}
