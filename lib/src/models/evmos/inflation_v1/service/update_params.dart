import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/evmos/inflation_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/models/evmos/core/service.dart';

// MsgUpdateParams defines a Msg for updating the x/inflation module parameters.
class EvmosInflationV1MsgUpdateParams
    extends EvmosService<EmptyServiceRequestResponse>
    with AminoMessage {
  /// authority is the address of the governance account
  final String? authority;

  /// params defines the x/inflation parameters to update.
  /// NOTE: All parameters must be supplied.
  final EvmosInflationV1Params? params;

  const EvmosInflationV1MsgUpdateParams({
    required this.authority,
    required this.params,
  });

  factory EvmosInflationV1MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosInflationV1MsgUpdateParams(
      authority: decode.getField(1),
      params: decode
          .getResult(2)
          ?.to<EvmosInflationV1Params, List<int>>(
            EvmosInflationV1Params.deserialize,
          ),
    );
  }
  factory EvmosInflationV1MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return EvmosInflationV1MsgUpdateParams(
      authority: json.as("authority"),
      params: json.maybeAs(
        key: "params",
        onValue: EvmosInflationV1Params.fromJson,
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "params": params?.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.inflationMsgUpdateParams;

  @override
  List get values => [authority, params];
  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      EvmosErc20V1Types.inflationMsgUpdateParamsResponse,
    );
  }
}
