import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// MerklePath is the path used to verify commitment proofs, which can be an arbitrary structured object
/// (defined by a commitment type). MerklePath is represented from root-to-leaf
class IbcCommitmentMerklePath extends CosmosMessage {
  final List<String>? keyPath;
  IbcCommitmentMerklePath({List<String>? keyPath})
      : keyPath = keyPath?.emptyAsNull?.immutable;
  factory IbcCommitmentMerklePath.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcCommitmentMerklePath(keyPath: decode.getFields(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"key_path": keyPath};
  }

  @override
  String get typeUrl => IbcTypes.merklePath.typeUrl;

  @override
  List get values => [keyPath];
}
