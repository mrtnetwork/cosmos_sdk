import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class CanonicalPartSetHeader extends CosmosMessage {
  final int? total;
  final List<int>? hash;
  CanonicalPartSetHeader({this.total, List<int>? hash})
      : hash = BytesUtils.tryToBytes(hash, unmodifiable: true);
  factory CanonicalPartSetHeader.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CanonicalPartSetHeader(
        total: decode.getField(1), hash: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"total": total, "hash": BytesUtils.tryToHexString(hash)};
  }

  @override
  String get typeUrl => TendermintTypes.canonicalPartSetHeader.typeUrl;

  @override
  List get values => [total, hash];
}
