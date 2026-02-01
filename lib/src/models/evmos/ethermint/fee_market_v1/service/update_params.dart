import 'package:cosmos_sdk/src/models/evmos/core/service.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/fee_market_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams defines a Msg for updating the x/feemarket module parameters.
class EvmosEthermintFeeMarketV1MsgUpdateParams
    extends EvmosService<EmptyServiceRequestResponse>
    with AminoMessage {
  /// authority is the address of the governance account.
  final String authority;
  // params defines the x/feemarket parameters to update.
  // NOTE: All parameters must be supplied.
  final EvmosEthermintFeeMarketV1Params params;
  const EvmosEthermintFeeMarketV1MsgUpdateParams({
    required this.authority,
    required this.params,
  });
  factory EvmosEthermintFeeMarketV1MsgUpdateParams.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintFeeMarketV1MsgUpdateParams(
      authority: decode.getField(1),
      params: EvmosEthermintFeeMarketV1Params.deserialize(decode.getField(2)),
    );
  }
  factory EvmosEthermintFeeMarketV1MsgUpdateParams.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintFeeMarketV1MsgUpdateParams(
      authority: json.as("authority"),
      params: EvmosEthermintFeeMarketV1Params.fromJson(json.asMap("params")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.feeMarketMsgUpdateParams;

  @override
  List get values => [authority, params];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      EvmosErc20V1Types.feeMarketMsgUpdateParamsResponse,
    );
  }

  @override
  List<String?> get signers => [authority];
}
