import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisCosmWasmPoolInstantiateMsg extends CosmosMessage {
  /// [poolAssetDenoms] is the list of asset denoms that are initialized
  /// at pool creation time.
  final List<String>? poolAssetDenoms;

  OsmosisCosmWasmPoolInstantiateMsg({List<String>? poolAssetDenoms})
      : poolAssetDenoms = poolAssetDenoms?.nullOnEmpy;
  factory OsmosisCosmWasmPoolInstantiateMsg.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolInstantiateMsg(
        poolAssetDenoms: decode.getFields<String>(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"poolAssetDenoms": poolAssetDenoms};
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.instantiateMsg.typeUrl;

  @override
  List get values => [poolAssetDenoms];
}
