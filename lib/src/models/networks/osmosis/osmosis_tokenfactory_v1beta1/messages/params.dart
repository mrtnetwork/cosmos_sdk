import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// Params defines the parameters for the tokenfactory module.
class OsmosisTokenFactoryParams extends CosmosMessage {
  final List<Coin> denomCreationFee;
  OsmosisTokenFactoryParams(List<Coin> denomCreationFee)
    : denomCreationFee = denomCreationFee.immutable;
  factory OsmosisTokenFactoryParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryParams(
      decode.getFields<List<int>>(1).map((e) => Coin.deserialize(e)).toList(),
    );
  }
  factory OsmosisTokenFactoryParams.fromJson(Map<String, dynamic> json) {
    return OsmosisTokenFactoryParams(
      (json["denom_creation_fee"] as List?)
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "denom_creation_fee": denomCreationFee.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.params;

  @override
  List get values => [denomCreationFee];
}
