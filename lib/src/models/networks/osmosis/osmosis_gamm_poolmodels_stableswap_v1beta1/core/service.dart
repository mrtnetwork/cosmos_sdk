import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/services/msg_create_stable_swap_pool.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/services/msg_stable_swap_adjust_scaling_factors.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisGammPoolmodelsStableSwapV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisGammPoolmodelsStableSwapV1Beta1();

  static T? fromJson<T extends OsmosisGammPoolmodelsStableSwapV1Beta1>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisGammPoolmodelsStableSwapV1beta1Types.findService(
      typeUrl,
    );
    final OsmosisGammPoolmodelsStableSwapV1Beta1? service =
        switch (type) {
              OsmosisGammPoolmodelsStableSwapV1beta1Types
                  .msgCreateStableswapPool =>
                OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool.fromJson(
                  json,
                ),
              OsmosisGammPoolmodelsStableSwapV1beta1Types
                  .msgStableSwapAdjustScalingFactors =>
                OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors.fromJson(
                  json,
                ),
              _ => null,
            }
            as OsmosisGammPoolmodelsStableSwapV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid GammPoolmodelsStableSwapV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisGammPoolmodelsStableSwapV1Beta1>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisGammPoolmodelsStableSwapV1beta1Types.findService(
      typeUrl,
    );
    final OsmosisGammPoolmodelsStableSwapV1Beta1? service =
        switch (type) {
              OsmosisGammPoolmodelsStableSwapV1beta1Types
                  .msgCreateStableswapPool =>
                OsmosisGammPoolmodelsStableSwapMsgCreateStableswapPool.deserialize(
                  bytes,
                ),
              OsmosisGammPoolmodelsStableSwapV1beta1Types
                  .msgStableSwapAdjustScalingFactors =>
                OsmosisGammPoolmodelsStableSwapMsgStableSwapAdjustScalingFactors.deserialize(
                  bytes,
                ),
              _ => null,
            }
            as OsmosisGammPoolmodelsStableSwapV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid GammPoolmodelsStableSwapV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
