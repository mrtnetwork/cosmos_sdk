import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/erc20_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

// MsgUpdateParams is the Msg/UpdateParams request type for Erc20 parameters.
// Since: cosmos-sdk 0.47
class EvmosErc20V1MsgUpdateParams
    extends EvmosService<EmptyServiceRequestResponse>
    with AminoMessage {
  /// authority is the address of the governance account
  final String? authority;

  /// params defines the x/evm parameters to update.
  /// NOTE: All parameters must be supplied.
  final EvmosErc20V1Params? params;

  const EvmosErc20V1MsgUpdateParams({
    required this.authority,
    required this.params,
  });

  factory EvmosErc20V1MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosErc20V1MsgUpdateParams(
      authority: decode.getField(1),
      params: decode
          .getResult(2)
          ?.to<EvmosErc20V1Params, List<int>>(EvmosErc20V1Params.deserialize),
    );
  }
  factory EvmosErc20V1MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return EvmosErc20V1MsgUpdateParams(
      authority: json.as("authority"),
      params: json.maybeAs(key: "params", onValue: EvmosErc20V1Params.fromJson),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "params": params?.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.msgUpdateParams;

  @override
  List get values => [authority, params];
  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      EvmosErc20V1Types.msgUpdateParamsResponse,
    );
  }
}
