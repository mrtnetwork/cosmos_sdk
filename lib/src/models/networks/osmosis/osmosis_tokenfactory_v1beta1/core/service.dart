import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/services/create_denom.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/services/msg_burn.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/services/msg_change_admin.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/services/msg_mint.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/services/msg_set_denom_metadata.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisTokenFactoryV1Beta1<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisTokenFactoryV1Beta1();

  static T? fromJson<T extends OsmosisTokenFactoryV1Beta1>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = OsmosisTokenFactoryV1beta1Types.findService(typeUrl);
    final OsmosisTokenFactoryV1Beta1? service = switch (type) {
      OsmosisTokenFactoryV1beta1Types.msgCreateDenom =>
        OsmosisTokenFactoryMsgCreateDenom.fromJson(json),
      OsmosisTokenFactoryV1beta1Types.msgBurn =>
        OsmosisTokenFactoryMsgBurn.fromJson(json),
      OsmosisTokenFactoryV1beta1Types.msgChangeAdmin =>
        OsmosisTokenFactoryMsgChangeAdmin.fromJson(json),
      OsmosisTokenFactoryV1beta1Types.msgMint =>
        OsmosisTokenFactoryMsgMint.fromJson(json),
      OsmosisTokenFactoryV1beta1Types.msgSetDenomMetadata =>
        OsmosisTokenFactoryMsgSetDenomMetadata.fromJson(json),
      _ => null
    } as OsmosisTokenFactoryV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid TokenFactory Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends OsmosisTokenFactoryV1Beta1>(
      {required String typeUrl, required List<int> bytes}) {
    final type = OsmosisTokenFactoryV1beta1Types.findService(typeUrl);
    final OsmosisTokenFactoryV1Beta1? service = switch (type) {
      OsmosisTokenFactoryV1beta1Types.msgCreateDenom =>
        OsmosisTokenFactoryMsgCreateDenom.deserialize(bytes),
      OsmosisTokenFactoryV1beta1Types.msgBurn =>
        OsmosisTokenFactoryMsgBurn.deserialize(bytes),
      OsmosisTokenFactoryV1beta1Types.msgChangeAdmin =>
        OsmosisTokenFactoryMsgChangeAdmin.deserialize(bytes),
      OsmosisTokenFactoryV1beta1Types.msgMint =>
        OsmosisTokenFactoryMsgMint.deserialize(bytes),
      OsmosisTokenFactoryV1beta1Types.msgSetDenomMetadata =>
        OsmosisTokenFactoryMsgSetDenomMetadata.deserialize(bytes),
      _ => null
    } as OsmosisTokenFactoryV1Beta1?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid TokenFactory Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
