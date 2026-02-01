import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgPauseBurningAndMinting
    extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage {
  final String from;
  const CCTPV1MsgPauseBurningAndMinting(this.from);

  factory CCTPV1MsgPauseBurningAndMinting.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgPauseBurningAndMinting(decode.getField(1));
  }
  factory CCTPV1MsgPauseBurningAndMinting.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgPauseBurningAndMinting(json.as("from"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgPauseBurningAndMinting;

  @override
  List get values => [from];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      CCTPV1Types.msgPauseBurningAndMintingResponse,
    );
  }
}
