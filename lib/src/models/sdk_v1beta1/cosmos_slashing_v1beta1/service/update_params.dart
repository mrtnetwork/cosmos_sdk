import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
/// Since: cosmos-sdk 0.47
class SlashingMsgUpdateParams
    extends SlashingV1Beta1Service<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final CosmosBaseAddress? authority;

  /// params defines the x/slashing parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final SlashingParams params;
  const SlashingMsgUpdateParams({this.authority, required this.params});
  factory SlashingMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingMsgUpdateParams(
      authority: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      params: SlashingParams.deserialize(decode.getField(2)),
    );
  }
  factory SlashingMsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return SlashingMsgUpdateParams(
      authority: json.asAddress("authority"),
      params: SlashingParams.fromJson(json.asMap("params")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority?.address, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => SlashingV1beta1Types.slashingMsgUpdateParams;

  @override
  List get values => [authority?.address, params];
  @override
  List<String?> get signers => [authority?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        SlashingV1beta1Types.slashingMsgUpdateParamsResponse);
  }
}
