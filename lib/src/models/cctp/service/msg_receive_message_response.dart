import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgReceiveMessageResponse extends CosmosMessage {
  final bool? success;

  const CCTPV1MsgReceiveMessageResponse(this.success);

  factory CCTPV1MsgReceiveMessageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgReceiveMessageResponse(decode.getField(1));
  }
  factory CCTPV1MsgReceiveMessageResponse.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgReceiveMessageResponse(json.as("success"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"success": success};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgReceiveMessageResponse;

  @override
  List get values => [success];
}
