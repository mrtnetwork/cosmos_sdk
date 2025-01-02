import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
class BankMsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten)
  final CosmosBaseAddress authority;

  /// params defines the x/bank parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final BankParams params;

  const BankMsgUpdateParams({required this.authority, required this.params});
  factory BankMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BankMsgUpdateParams(
      authority: CosmosBaseAddress(decode.getField(1)),
      params: BankParams.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority.address, "params": params.toJson()};
  }

  @override
  List get values => [authority.address, params];

  @override
  @override
  TypeUrl get typeUrl => BankV1beta1Types.msgUpdateParams;
  @override
  TypeUrl get service => BankV1beta1Types.bankUpdateParams;
  @override
  List<String?> get signers => [authority.address];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        BankV1beta1Types.bankMsgUpdateParamsResponse);
  }
}
