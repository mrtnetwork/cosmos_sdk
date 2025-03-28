import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
class BankMsgUpdateParams
    extends BankV1Beta1Service<EmptyServiceRequestResponse> {
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
  factory BankMsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return BankMsgUpdateParams(
      authority: CosmosBaseAddress(json.as("authority")),
      params: BankParams.fromJson(json.asMap("params")),
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
  List<String?> get signers => [authority.address];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        BankV1beta1Types.bankMsgUpdateParamsResponse);
  }
}
