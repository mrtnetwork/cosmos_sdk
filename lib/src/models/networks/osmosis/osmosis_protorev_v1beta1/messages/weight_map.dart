import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// WeightMap maps a contract address to a weight.
/// The weight of an address corresponds to the amount of ms required to execute a swap on that contract.
class OsmosisProtorevWeightMap extends CosmosMessage {
  /// The weight of a cosmwasm pool (by contract address)
  final BigInt? weight;

  /// The contract address
  final String? contractAddress;
  const OsmosisProtorevWeightMap({this.weight, this.contractAddress});

  factory OsmosisProtorevWeightMap.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevWeightMap(
        weight: decode.getField(1), contractAddress: decode.getField(2));
  }

  factory OsmosisProtorevWeightMap.fromJson(Map<String, dynamic> json) {
    return OsmosisProtorevWeightMap(
        weight: BigintUtils.tryParse(json["weight"]),
        contractAddress: json["contractAddress"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"weight": weight?.toString(), "contract_address": contractAddress};
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.weightMap;

  @override
  List get values => [weight, contractAddress];
}
