import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Params holds parameters for the incentives module
class OsmosisGammParams extends CosmosMessage {
  final List<Coin> poolCreationFee;

  OsmosisGammParams(List<Coin> poolCreationFee)
      : poolCreationFee = poolCreationFee.mutable;
  factory OsmosisGammParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammParams(
      decode.getFields(1).map((e) => Coin.deserialize(e)).toList(),
    );
  }
  factory OsmosisGammParams.fromRpc(Map<String, dynamic> json) {
    return OsmosisGammParams((json["pool_creation_fee"] as List?)
            ?.map((e) => Coin.fromRpc(e))
            .toList() ??
        <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_creation_fee": poolCreationFee.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.params.typeUrl;

  @override
  List get values => [poolCreationFee];
}
