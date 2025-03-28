import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_store_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'child.dart';

class OsmosisStoreNode extends CosmosMessage {
  final List<OsmosisStoreChild>? children;
  OsmosisStoreNode({List<OsmosisStoreChild>? children})
      : children = children?.emptyAsNull?.immutable;
  factory OsmosisStoreNode.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStoreNode(
        children: decode
            .getFields<List<int>>(1)
            .map((e) => OsmosisStoreChild.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"children": children?.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisStoreV1beta1Types.node;

  @override
  List get values => [children];
}
