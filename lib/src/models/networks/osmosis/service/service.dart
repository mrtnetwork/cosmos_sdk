import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity_poolmodel_concentrated_1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity_poolmodel_concentrated_1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_pool_models_balancer_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_pool_models_balancer_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_poolmodels_stableswap_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_validator_preference_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

abstract class OsmosisService<T extends CosmosMessage>
    extends ServiceMessage<T> {
  const OsmosisService();

  static const String root = "/osmosis";

  static T? fromJson<T extends OsmosisService>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final String root = CosmosUtils.extractServiceRoot(typeUrl);
    final OsmosisService? service = switch (root) {
      OsmosisConcentratedLiquidityV1beta1Types.root =>
        OsmosisConcentratedLiquidityV1Beta1.fromJson(
            typeUrl: typeUrl, json: json),
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types.root =>
        OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1.fromJson(
            typeUrl: typeUrl, json: json),
      OsmosisCosmWasmPoolV1beta1Types.root =>
        OsmosisWasmPoolV1Beta1.fromJson(typeUrl: typeUrl, json: json),
      OsmosisGammPoolmodelsBalancerV1beta1Types.root =>
        OsmosisGammPoolmodelsBalancerV1Beta1.fromJson(
            typeUrl: typeUrl, json: json),
      OsmosisGammPoolmodelsStableSwapV1beta1Types.root =>
        OsmosisGammPoolmodelsStableSwapV1Beta1.fromJson(
            typeUrl: typeUrl, json: json),
      OsmosisGammV1beta1Types.root =>
        OsmosisGammV1Beta1.fromJson(typeUrl: typeUrl, json: json),
      OsmosisIbchooksTypes.root =>
        OsmosisIbchooks.fromJson(typeUrl: typeUrl, json: json),
      OsmosisIncentivesTypes.root =>
        OsmosisIncentives.fromJson(typeUrl: typeUrl, json: json),
      OsmosisLockupTypes.root =>
        OsmosisLockup.fromJson(typeUrl: typeUrl, json: json),
      OsmosisPoolManagerV1beta1Types.root =>
        OsmosisPoolManagerV1Beta1.fromJson(typeUrl: typeUrl, json: json),
      OsmosisProtorevV1beta1Types.root =>
        OsmosisProtorevV1Beta1.fromJson(typeUrl: typeUrl, json: json),
      OsmosisStreamSwapV1Types.root =>
        OsmosisStreamSwapV1.fromJson(typeUrl: typeUrl, json: json),
      OsmosisSuperfluidTypes.root =>
        OsmosisSuperfluid.fromJson(typeUrl: typeUrl, json: json),
      OsmosisTokenFactoryV1beta1Types.root =>
        OsmosisTokenFactoryV1Beta1.fromJson(typeUrl: typeUrl, json: json),
      OsmosisValidatorPreferenceV1beta1Types.root =>
        OsmosisValidatorPreferenceV1Beta1.fromJson(
            typeUrl: typeUrl, json: json),
      OsmosisValSetprefV1beta1Types.root =>
        OsmosisValSetprefV1Beta1.fromJson(typeUrl: typeUrl, json: json),
      _ => null
    };

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid Osmosis Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }

  static T? deserialize<T extends ServiceMessage>(
      {required String typeUrl, required List<int> bytes}) {
    final String root = CosmosUtils.extractServiceRoot(typeUrl);
    final ServiceMessage? service = switch (root) {
      OsmosisConcentratedLiquidityV1beta1Types.root =>
        OsmosisConcentratedLiquidityV1Beta1.deserialize(
            typeUrl: typeUrl, bytes: bytes),
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types.root =>
        OsmosisConcentratedliquidityPoolmodelConcentratedV1Beta1.deserialize(
            typeUrl: typeUrl, bytes: bytes),
      OsmosisCosmWasmPoolV1beta1Types.root =>
        OsmosisWasmPoolV1Beta1.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisGammPoolmodelsBalancerV1beta1Types.root =>
        OsmosisGammPoolmodelsBalancerV1Beta1.deserialize(
            typeUrl: typeUrl, bytes: bytes),
      OsmosisGammPoolmodelsStableSwapV1beta1Types.root =>
        OsmosisGammPoolmodelsStableSwapV1Beta1.deserialize(
            typeUrl: typeUrl, bytes: bytes),
      OsmosisGammV1beta1Types.root =>
        OsmosisGammV1Beta1.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisIbchooksTypes.root =>
        OsmosisIbchooks.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisIncentivesTypes.root =>
        OsmosisIncentives.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisLockupTypes.root =>
        OsmosisLockup.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisPoolManagerV1beta1Types.root =>
        OsmosisPoolManagerV1Beta1.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisProtorevV1beta1Types.root =>
        OsmosisProtorevV1Beta1.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisStreamSwapV1Types.root =>
        OsmosisStreamSwapV1.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisSuperfluidTypes.root =>
        OsmosisSuperfluid.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisTokenFactoryV1beta1Types.root =>
        OsmosisTokenFactoryV1Beta1.deserialize(typeUrl: typeUrl, bytes: bytes),
      OsmosisValidatorPreferenceV1beta1Types.root =>
        OsmosisValidatorPreferenceV1Beta1.deserialize(
            typeUrl: typeUrl, bytes: bytes),
      OsmosisValSetprefV1beta1Types.root =>
        OsmosisValSetprefV1Beta1.deserialize(typeUrl: typeUrl, bytes: bytes),
      _ => null
    };

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid Osmosis Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }
}
