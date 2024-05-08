import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/token_pair_arb_routes.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// SetHotRoutes sets the hot routes that will be explored when
/// creating cyclic arbitrage routes. Can only be called by the admin account.
class OsmosisProtorevMsgSetHotRoutes extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// [admin] is the account that is authorized to set the hot routes.
  final String? admin;

  /// [hotRoutes] is the list of hot routes to set.
  final List<OsmosisProtorevTokenPairArbRoutes> hotRoutes;

  OsmosisProtorevMsgSetHotRoutes(
      {this.admin, required List<OsmosisProtorevTokenPairArbRoutes> hotRoutes})
      : hotRoutes = hotRoutes.mutable;

  factory OsmosisProtorevMsgSetHotRoutes.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevMsgSetHotRoutes(
        admin: decode.getField(1),
        hotRoutes: decode
            .getFields(2)
            .map((e) => OsmosisProtorevTokenPairArbRoutes.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "admin": admin,
      "hot_routes": hotRoutes.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types.msgSetHotRoutes.typeUrl;

  @override
  List get values => [admin, hotRoutes];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisProtorevV1beta1Types.msgSetHotRoutesResponse.typeUrl);
  }

  @override
  String get service => OsmosisProtorevV1beta1Types.setHotRoutes.typeUrl;

  @override
  List<String?> get signers => [admin];
}
