import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// ProofOp defines an operation used for calculating Merkle root. The data could be arbitrary format, providing necessary data for example neighbouring node hash.
/// Note: This type is a duplicate of the ProofOp proto type defined in Tendermint.
class CosmosProofOp extends CosmosMessage {
  final String? type;
  final List<int>? key;
  final List<int>? data;
  factory CosmosProofOp.fromJson(Map<String, dynamic> json) {
    return CosmosProofOp(
      type: json["type"],
      key: CosmosUtils.tryToBytes(json["key"]),
      data: CosmosUtils.tryToBytes(json["data"]),
    );
  }
  CosmosProofOp({this.type, List<int>? key, List<int>? data})
    : key = BytesUtils.tryToBytes(key, unmodifiable: true),
      data = BytesUtils.tryToBytes(data, unmodifiable: true);
  factory CosmosProofOp.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosProofOp(
      type: decode.getField(1),
      key: decode.getField(2),
      data: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "key": CosmosUtils.tryToBase64(key),
      "data": CosmosUtils.tryToBase64(data),
    };
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.cosmosProofOp;

  @override
  List get values => [type, key, data];
}
