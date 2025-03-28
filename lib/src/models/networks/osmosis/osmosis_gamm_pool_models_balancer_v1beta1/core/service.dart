import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_pool_models_balancer_v1beta1/service/msg_create_balancer_pool.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_pool_models_balancer_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisGammPoolmodelsBalancerV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisGammPoolmodelsBalancerV1Beta1();

  static T? fromJson<T extends OsmosisGammPoolmodelsBalancerV1Beta1>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = OsmosisGammPoolmodelsBalancerV1beta1Types.findService(typeUrl);
    final OsmosisGammPoolmodelsBalancerV1Beta1? service = switch (type) {
      OsmosisGammPoolmodelsBalancerV1beta1Types.msgCreateBalancerPool =>
        OsmosisGammPoolmodelsBalancerMsgCreateBalancerPool.fromJson(json),
      _ => null
    } as OsmosisGammPoolmodelsBalancerV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
          "Invalid GammPoolmodelsBalancerV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends OsmosisGammPoolmodelsBalancerV1Beta1>(
      {required String typeUrl, required List<int> bytes}) {
    final type = OsmosisGammPoolmodelsBalancerV1beta1Types.findService(typeUrl);
    final OsmosisGammPoolmodelsBalancerV1Beta1? service = switch (type) {
      OsmosisGammPoolmodelsBalancerV1beta1Types.msgCreateBalancerPool =>
        OsmosisGammPoolmodelsBalancerMsgCreateBalancerPool.deserialize(bytes),
      _ => null
    } as OsmosisGammPoolmodelsBalancerV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
          "Invalid GammPoolmodelsBalancerV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
