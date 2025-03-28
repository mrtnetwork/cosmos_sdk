import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/params.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams is the MsgUpdateParams request type.
class IbcChannelMsgUpdateParams
    extends IbcService<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the channel parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final IbcChannelParams params;
  const IbcChannelMsgUpdateParams({this.authority, required this.params});
  factory IbcChannelMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelMsgUpdateParams(
      authority: decode.getField(1),
      params: IbcChannelParams.deserialize(decode.getField(2)),
    );
  }
  factory IbcChannelMsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return IbcChannelMsgUpdateParams(
        authority: json.as("authority"),
        params: IbcChannelParams.fromJson(json.asMap("params")));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcChannelmsgUpdateParams;

  @override
  List get values => [authority, params];

  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.ibcChannelmsgUpdateParamsResponse);
  }
}
