import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_store_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'child.dart';

class OsmosisStoreLeaf extends CosmosMessage {
  final OsmosisStoreChild? leaf;
  OsmosisStoreLeaf({this.leaf});
  factory OsmosisStoreLeaf.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStoreLeaf(
      leaf: decode
          .getResult(1)
          ?.to<OsmosisStoreChild, List<int>>(
            (e) => OsmosisStoreChild.deserialize(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"leaf": leaf?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisStoreV1beta1Types.leaf;

  @override
  List get values => [leaf];
}
