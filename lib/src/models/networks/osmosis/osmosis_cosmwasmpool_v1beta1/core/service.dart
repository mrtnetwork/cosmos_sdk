import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/service/msg_create_cosmsasm_pool.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisWasmPoolV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisWasmPoolV1Beta1();

  static T? fromJson<T extends OsmosisWasmPoolV1Beta1>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = OsmosisCosmWasmPoolV1beta1Types.findService(typeUrl);
    final OsmosisWasmPoolV1Beta1? service = switch (type) {
      OsmosisCosmWasmPoolV1beta1Types.msgCreateCosmWasmPool =>
        OsmosisCosmWasmPoolMsgCreateCosmWasmPool.fromJson(json),
      _ => null
    } as OsmosisWasmPoolV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid WasmPoolV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends OsmosisWasmPoolV1Beta1>(
      {required String typeUrl, required List<int> bytes}) {
    final type = OsmosisCosmWasmPoolV1beta1Types.findService(typeUrl);
    final OsmosisWasmPoolV1Beta1? service = switch (type) {
      OsmosisCosmWasmPoolV1beta1Types.msgCreateCosmWasmPool =>
        OsmosisCosmWasmPoolMsgCreateCosmWasmPool.deserialize(bytes),
      _ => null
    } as OsmosisWasmPoolV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid WasmPoolV1Beta1 Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
