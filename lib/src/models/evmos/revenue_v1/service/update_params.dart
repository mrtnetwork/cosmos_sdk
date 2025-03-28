import 'package:cosmos_sdk/src/models/evmos/revenue_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';

/// MsgUpdateParams defines a Msg for updating the x/revenue module parameters.
class EvmosRevenueV1MsgUpdateParams
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/revenue parameters to update.
  /// NOTE: All parameters must be supplied.
  final EvmosRevenueV1Params? params;

  const EvmosRevenueV1MsgUpdateParams({this.authority, this.params});

  factory EvmosRevenueV1MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosRevenueV1MsgUpdateParams(
        authority: decode.getField(1),
        params: decode.getResult(2)?.to<EvmosRevenueV1Params, List<int>>(
            EvmosRevenueV1Params.deserialize));
  }
  factory EvmosRevenueV1MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return EvmosRevenueV1MsgUpdateParams(
        authority: json.as("authority"),
        params: json.maybeAs(
            key: "params", onValue: EvmosRevenueV1Params.fromJson));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority,
      "params": params?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.revenueMsgUpdateParams;

  @override
  List get values => [authority, params];
  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.revenueMsgUpdateParamsResponse);
  }
}
