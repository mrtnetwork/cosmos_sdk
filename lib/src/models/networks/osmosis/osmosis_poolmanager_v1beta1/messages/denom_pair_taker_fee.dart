import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class OsmosisPoolManagerDenomPairTakerFee extends CosmosMessage {
  /// denom0 and denom1 get automatically lexigographically sorted
  /// when being stored, so the order of input here does not matter.
  final String? denom0;
  final String? denom1;
  final String takerFee;

  OsmosisPoolManagerDenomPairTakerFee(
      {this.denom0, this.denom1, required this.takerFee});
  factory OsmosisPoolManagerDenomPairTakerFee.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerDenomPairTakerFee(
        denom0: decode.getField(1),
        denom1: decode.getField(2),
        takerFee: decode.getField(3));
  }
  factory OsmosisPoolManagerDenomPairTakerFee.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerDenomPairTakerFee(
        denom0: json.as("denom0"),
        denom1: json.as("denom1"),
        takerFee: json.as("taker_fee"));
  }
  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"denom0": denom0, "denom1": denom1, "taker_fee": takerFee};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.denomPairTakerFee;

  @override
  List get values => [denom0, denom1, takerFee];
}
