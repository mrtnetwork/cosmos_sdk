import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity_poolmodel_concentrated_1beta1/osmosis_concentratedliquidity_poolmodel_concentrated_1beta1.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity_poolmodel_concentrated_1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1<
  T extends CosmosMessage
>
    extends OsmosisService<T> {
  const OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1();

  static T? fromJson<
    T extends OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1
  >({required String typeUrl, required Map<String, dynamic> json}) {
    final type =
        OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types.findService(
          typeUrl,
        );
    final OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1? service =
        switch (type) {
              OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
                  .msgCreateConcentratedPool =>
                OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool.fromJson(
                  json,
                ),
              _ => null,
            }
            as OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid ConcentratedliquidityPoolmodelConcentratedV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<
    T extends OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1
  >({required String typeUrl, required List<int> bytes}) {
    final type =
        OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types.findService(
          typeUrl,
        );
    final OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1? service =
        switch (type) {
              OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
                  .msgCreateConcentratedPool =>
                OsmosisConcentratedliquidityPoolmodelConcentratedMsgCreateConcentratedPool.deserialize(
                  bytes,
                ),
              _ => null,
            }
            as OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid ConcentratedliquidityPoolmodelConcentratedV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
