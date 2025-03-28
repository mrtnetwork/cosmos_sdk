import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/services/exit_pool.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/services/exit_swap_extern_amount_out.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/services/exit_swap_share_amount_in.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/services/join_pool.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/services/join_swap_extern_amount_in.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/services/join_swap_share_amount_out.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/services/swap_exact_amount_in.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/services/swap_exact_amount_out.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisGammV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisGammV1Beta1();

  static T? fromJson<T extends OsmosisGammV1Beta1>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = OsmosisGammV1beta1Types.findService(typeUrl);
    final OsmosisGammV1Beta1? service = switch (type) {
      OsmosisGammV1beta1Types.msgExitPool =>
        OsmosisGammMsgExitPool.fromJson(json),
      OsmosisGammV1beta1Types.msgExitSwapExternAmountOut =>
        OsmosisGammMsgExitSwapExternAmountOut.fromJson(json),
      OsmosisGammV1beta1Types.msgExitSwapShareAmountIn =>
        OsmosisGammMsgExitSwapShareAmountIn.fromJson(json),
      OsmosisGammV1beta1Types.msgJoinPool =>
        OsmosisGammMsgJoinPool.fromJson(json),
      OsmosisGammV1beta1Types.msgJoinSwapExternAmountIn =>
        OsmosisGammMsgJoinSwapExternAmountIn.fromJson(json),
      OsmosisGammV1beta1Types.msgJoinSwapShareAmountOut =>
        OsmosisGammMsgJoinSwapShareAmountOut.fromJson(json),
      OsmosisGammV1beta1Types.msgSwapExactAmountIn =>
        OsmosisGammMsgSwapExactAmountIn.fromJson(json),
      OsmosisGammV1beta1Types.msgSwapExactAmountOut =>
        OsmosisGammMsgSwapExactAmountOut.fromJson(json),
      _ => null
    } as OsmosisGammV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid GammV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends OsmosisGammV1Beta1>(
      {required String typeUrl, required List<int> bytes}) {
    final type = OsmosisGammV1beta1Types.findService(typeUrl);
    final OsmosisGammV1Beta1? service = switch (type) {
      OsmosisGammV1beta1Types.msgExitPool =>
        OsmosisGammMsgExitPool.deserialize(bytes),
      OsmosisGammV1beta1Types.msgExitSwapExternAmountOut =>
        OsmosisGammMsgExitSwapExternAmountOut.deserialize(bytes),
      OsmosisGammV1beta1Types.msgExitSwapShareAmountIn =>
        OsmosisGammMsgExitSwapShareAmountIn.deserialize(bytes),
      OsmosisGammV1beta1Types.msgJoinPool =>
        OsmosisGammMsgJoinPool.deserialize(bytes),
      OsmosisGammV1beta1Types.msgJoinSwapExternAmountIn =>
        OsmosisGammMsgJoinSwapExternAmountIn.deserialize(bytes),
      OsmosisGammV1beta1Types.msgJoinSwapShareAmountOut =>
        OsmosisGammMsgJoinSwapShareAmountOut.deserialize(bytes),
      OsmosisGammV1beta1Types.msgSwapExactAmountIn =>
        OsmosisGammMsgSwapExactAmountIn.deserialize(bytes),
      OsmosisGammV1beta1Types.msgSwapExactAmountOut =>
        OsmosisGammMsgSwapExactAmountOut.deserialize(bytes),
      _ => null
    } as OsmosisGammV1Beta1?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid GammV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
