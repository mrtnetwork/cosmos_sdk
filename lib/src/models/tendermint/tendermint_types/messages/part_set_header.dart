import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

class PartSetHeader extends CosmosMessage {
  final int? total;
  final List<int>? hash;
  PartSetHeader({this.total, List<int>? hash})
      : hash = BytesUtils.tryToBytes(hash, unmodifiable: true);
  factory PartSetHeader.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PartSetHeader(total: decode.getField(1), hash: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"total": total, "hash": BytesUtils.tryToHexString(hash)};
  }

  @override
  String get typeUrl => TendermintTypes.partSetHeader.typeUrl;

  @override
  List get values => [total, hash];
}
