import 'package:blockchain_utils/utils/utils.dart';
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
  factory PartSetHeader.fromJson(Map<String, dynamic> json) {
    return PartSetHeader(
      total: json["total"],
      hash: StringUtils.encode(json["hash"], type: StringEncoding.base64),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"total": total, "hash": BytesUtils.tryToHexString(hash)};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.partSetHeader;

  @override
  List get values => [total, hash];
}
