import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUnjail defines the Msg/Unjail request type
class SlashingMsgUnjail extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress validatorAddr;
  const SlashingMsgUnjail(this.validatorAddr);
  factory SlashingMsgUnjail.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingMsgUnjail(CosmosBaseAddress(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get service => SlashingV1beta1Types.slashingUnjail;

  @override
  Map<String, dynamic> toJson() {
    return {"validator_addr": validatorAddr.address};
  }

  @override
  TypeUrl get typeUrl => SlashingV1beta1Types.slashingMsgUnjail;

  @override
  List get values => [validatorAddr.address];
  @override
  List<String?> get signers => [validatorAddr.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        SlashingV1beta1Types.slashingMsgUnjailResponse);
  }
}
