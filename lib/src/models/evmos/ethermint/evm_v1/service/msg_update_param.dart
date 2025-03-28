import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams defines a Msg for updating the x/evm module parameters.
class EvmosEthermintEVMV1MsgUpdateParams
    extends EvmosService<EmptyServiceRequestResponse> with AminoMessage {
  /// authority is the address of the governance account.
  final String authority;
  // params defines the x/evm parameters to update.
  // NOTE: All parameters must be supplied.
  final EvmosEthermintEVMV1Params params;
  const EvmosEthermintEVMV1MsgUpdateParams(
      {required this.authority, required this.params});
  factory EvmosEthermintEVMV1MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1MsgUpdateParams(
        authority: decode.getField(1),
        params: EvmosEthermintEVMV1Params.deserialize(decode.getField(2)));
  }
  factory EvmosEthermintEVMV1MsgUpdateParams.fromJson(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1MsgUpdateParams(
        authority: json.as("authority"),
        params: EvmosEthermintEVMV1Params.fromJson(json.asMap("params")));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.evmV1MsgUpdateParams;

  @override
  List get values => [authority, params];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        EvmosErc20V1Types.evmV1MsgUpdateParamsResponse);
  }

  @override
  List<String?> get signers => [authority];
}
