import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/services/msg_set_denom_pair_taker_fee.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/services/msg_split_route_swap_exact_amount_in.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/services/msg_split_route_swap_exact_amount_out.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/services/msg_swap_exact_amount_in.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/services/msg_swap_exact_amount_out.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisPoolManagerV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisPoolManagerV1Beta1();

  static T? fromJson<T extends OsmosisPoolManagerV1Beta1>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisPoolManagerV1beta1Types.findService(typeUrl);
    final OsmosisPoolManagerV1Beta1? service =
        switch (type) {
              OsmosisPoolManagerV1beta1Types.msgSetDenomPairTakerFee =>
                OsmosisPoolManagerMsgSetDenomPairTakerFee.fromJson(json),
              OsmosisPoolManagerV1beta1Types.msgSplitRouteSwapExactAmountIn =>
                OsmosisPoolManagerMsgSplitRouteSwapExactAmountIn.fromJson(json),
              OsmosisPoolManagerV1beta1Types.msgSplitRouteSwapExactAmountOut =>
                OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut.fromJson(
                  json,
                ),
              OsmosisPoolManagerV1beta1Types.msgSwapExactAmountIn =>
                OsmosisPoolManagerMsgSwapExactAmountIn.fromJson(json),
              OsmosisPoolManagerV1beta1Types.msgSwapExactAmountOut =>
                OsmosisPoolManagerMsgSwapExactAmountOut.fromJson(json),
              _ => null,
            }
            as OsmosisPoolManagerV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid PoolManager Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisPoolManagerV1Beta1>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisPoolManagerV1beta1Types.findService(typeUrl);
    final OsmosisPoolManagerV1Beta1? service =
        switch (type) {
              OsmosisPoolManagerV1beta1Types.msgSetDenomPairTakerFee =>
                OsmosisPoolManagerMsgSetDenomPairTakerFee.deserialize(bytes),
              OsmosisPoolManagerV1beta1Types.msgSplitRouteSwapExactAmountIn =>
                OsmosisPoolManagerMsgSplitRouteSwapExactAmountIn.deserialize(
                  bytes,
                ),
              OsmosisPoolManagerV1beta1Types.msgSplitRouteSwapExactAmountOut =>
                OsmosisPoolManagerMsgSplitRouteSwapExactAmountOut.deserialize(
                  bytes,
                ),
              OsmosisPoolManagerV1beta1Types.msgSwapExactAmountIn =>
                OsmosisPoolManagerMsgSwapExactAmountIn.deserialize(bytes),
              OsmosisPoolManagerV1beta1Types.msgSwapExactAmountOut =>
                OsmosisPoolManagerMsgSwapExactAmountOut.deserialize(bytes),
              _ => null,
            }
            as OsmosisPoolManagerV1Beta1?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid PoolManager Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
