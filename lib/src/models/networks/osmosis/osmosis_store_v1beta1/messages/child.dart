import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_store_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStoreChild extends CosmosMessage {
  final List<int>? index;
  final String accumulation;
  OsmosisStoreChild({required this.accumulation, List<int>? index})
      : index = BytesUtils.tryToBytes(index);
  factory OsmosisStoreChild.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStoreChild(
        accumulation: decode.getField(2), index: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "index": BytesUtils.tryToHexString(index),
      "accumulation": accumulation
    };
  }

  @override
  String get typeUrl => OsmosisStoreV1beta1Types.child.typeUrl;

  @override
  List get values => [index, accumulation];
}
