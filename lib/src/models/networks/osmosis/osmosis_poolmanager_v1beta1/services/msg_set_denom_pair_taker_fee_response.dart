import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse extends CosmosMessage {
  final bool? success;

  OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse(this.success);
  factory OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse(
        decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"success": success};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.msgSetDenomPairTakerFeeResponse;

  @override
  List get values => [success];
}
