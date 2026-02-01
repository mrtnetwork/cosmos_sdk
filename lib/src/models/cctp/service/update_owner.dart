import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgUpdateOwner extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage {
  final String from;
  final String newOwner;
  const CCTPV1MsgUpdateOwner({required this.from, required this.newOwner});

  factory CCTPV1MsgUpdateOwner.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgUpdateOwner(
      from: decode.getField(1),
      newOwner: decode.getField(2),
    );
  }
  factory CCTPV1MsgUpdateOwner.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgUpdateOwner(
      from: json.as("from"),
      newOwner: json.as("new_owner"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "new_owner": newOwner};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgUpdateOwner;

  @override
  List get values => [from, newOwner];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CCTPV1Types.msgUpdateOwnerResponse);
  }
}
