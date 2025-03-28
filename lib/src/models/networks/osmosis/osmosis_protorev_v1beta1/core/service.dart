import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/services/msg_set_base_denoms.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/services/msg_set_developer_account.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/services/msg_set_hot_routes.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/services/msg_set_info_by_pool_type.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/services/msg_set_max_pool_points_per_block.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/services/msg_set_max_pool_points_per_tx.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisProtorevV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisProtorevV1Beta1();

  static T? fromJson<T extends OsmosisProtorevV1Beta1>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = OsmosisProtorevV1beta1Types.findService(typeUrl);
    final OsmosisProtorevV1Beta1? service = switch (type) {
      OsmosisProtorevV1beta1Types.msgSetBaseDenoms =>
        OsmosisProtorevMsgSetBaseDenoms.fromJson(json),
      OsmosisProtorevV1beta1Types.msgSetDeveloperAccount =>
        OsmosisProtorevMsgSetDeveloperAccount.fromJson(json),
      OsmosisProtorevV1beta1Types.msgSetHotRoutes =>
        OsmosisProtorevMsgSetHotRoutes.fromJson(json),
      OsmosisProtorevV1beta1Types.msgSetInfoByPoolType =>
        OsmosisProtorevMsgSetInfoByPoolType.fromJson(json),
      OsmosisProtorevV1beta1Types.msgSetMaxPoolPointsPerBlock =>
        OsmosisProtorevMsgSetMsgSetMaxPoolPointsPerBlock.fromJson(json),
      OsmosisProtorevV1beta1Types.msgSetMaxPoolPointsPerTx =>
        OsmosisProtorevMsgSetMaxPoolPointsPerTx.fromJson(json),
      _ => null
    } as OsmosisProtorevV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid Protorev Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }

  static T? deserialize<T extends OsmosisProtorevV1Beta1>(
      {required String typeUrl, required List<int> bytes}) {
    final type = OsmosisProtorevV1beta1Types.findService(typeUrl);
    final OsmosisProtorevV1Beta1? service = switch (type) {
      OsmosisProtorevV1beta1Types.msgSetBaseDenoms =>
        OsmosisProtorevMsgSetBaseDenoms.deserialize(bytes),
      OsmosisProtorevV1beta1Types.msgSetDeveloperAccount =>
        OsmosisProtorevMsgSetDeveloperAccount.deserialize(bytes),
      OsmosisProtorevV1beta1Types.msgSetHotRoutes =>
        OsmosisProtorevMsgSetHotRoutes.deserialize(bytes),
      OsmosisProtorevV1beta1Types.msgSetInfoByPoolType =>
        OsmosisProtorevMsgSetInfoByPoolType.deserialize(bytes),
      OsmosisProtorevV1beta1Types.msgSetMaxPoolPointsPerBlock =>
        OsmosisProtorevMsgSetMsgSetMaxPoolPointsPerBlock.deserialize(bytes),
      OsmosisProtorevV1beta1Types.msgSetMaxPoolPointsPerTx =>
        OsmosisProtorevMsgSetMaxPoolPointsPerTx.deserialize(bytes),
      _ => null
    } as OsmosisProtorevV1Beta1?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid Protorev Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }
}
