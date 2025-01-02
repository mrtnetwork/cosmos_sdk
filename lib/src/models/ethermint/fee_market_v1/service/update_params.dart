import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ethermint/fee_market_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams defines a Msg for updating the x/feemarket module parameters.
class FeeMarketV1MsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// authority is the address of the governance account.
  final String authority;
  // params defines the x/feemarket parameters to update.
  // NOTE: All parameters must be supplied.
  final FeeMarketV1Params params;
  const FeeMarketV1MsgUpdateParams(
      {required this.authority, required this.params});
  factory FeeMarketV1MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FeeMarketV1MsgUpdateParams(
        authority: decode.getField(1),
        params: FeeMarketV1Params.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => FeeMarketTypes.msgUpdateParamsResponse;

  @override
  List get values => [authority, params];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(EvmV1Types.msgUpdateParamsResponse);
  }

  @override
  TypeUrl get service => FeeMarketTypes.updateParams;

  @override
  List<String?> get signers => [authority];
}
