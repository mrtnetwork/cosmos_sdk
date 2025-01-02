import 'package:cosmos_sdk/src/models/ethermint/evm_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams defines a Msg for updating the x/evm module parameters.
class EVMV1MsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// authority is the address of the governance account.
  final String authority;
  // params defines the x/evm parameters to update.
  // NOTE: All parameters must be supplied.
  final EVMV1Params params;
  const EVMV1MsgUpdateParams({required this.authority, required this.params});
  factory EVMV1MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1MsgUpdateParams(
        authority: decode.getField(1),
        params: EVMV1Params.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.msgUpdateParams;

  @override
  List get values => [authority, params];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(EvmV1Types.msgUpdateParamsResponse);
  }

  @override
  TypeUrl get service => EvmV1Types.updateParams;

  @override
  List<String?> get signers => [authority];
}
