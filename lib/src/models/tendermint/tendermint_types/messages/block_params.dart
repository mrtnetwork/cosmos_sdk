import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// BlockParams contains limits on the block size.
class BlockParams extends CosmosMessage {
  /// Max block size, in bytes.
  /// Note: must be greater than 0
  final BigInt? maxBytes;

  /// Max gas per block.
  /// Note: must be greater or equal to -1
  final BigInt? maxGas;
  const BlockParams({this.maxBytes, this.maxGas});
  factory BlockParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BlockParams(
        maxBytes: decode.getField(1), maxGas: decode.getField(2));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"max_bytes": maxBytes?.toString(), "max_gas": maxBytes?.toString()};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.blockParams;

  @override
  List get values => [maxBytes, maxGas];
}
