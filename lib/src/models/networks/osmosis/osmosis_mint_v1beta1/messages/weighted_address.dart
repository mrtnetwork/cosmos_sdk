import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// WeightedAddress represents an address with a weight assigned to it. The weight is used to
/// determine the proportion of the total minted tokens to be minted to the address.
class OsmosisMintWeightedAddress extends CosmosMessage {
  final String? address;
  final String weight;
  const OsmosisMintWeightedAddress({this.address, required this.weight});
  factory OsmosisMintWeightedAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisMintWeightedAddress(
      address: decode.getField(1),
      weight: decode.getField(2),
    );
  }
  factory OsmosisMintWeightedAddress.fromRpc(Map<String, dynamic> json) {
    return OsmosisMintWeightedAddress(
        weight: json["weight"], address: json["address"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address, "weight": weight};
  }

  @override
  String get typeUrl => OsmosisMintV1beta1Types.weightedAddress.typeUrl;

  @override
  List get values => [address, weight];
}
