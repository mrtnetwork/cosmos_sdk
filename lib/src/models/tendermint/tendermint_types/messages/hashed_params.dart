import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// HashedParams is a subset of ConsensusParams.
/// It is hashed into the Header.ConsensusHash.
class HashedParams extends CosmosMessage {
  final BigInt? blockMaxBytes;
  final BigInt? blockMaxGas;
  HashedParams({this.blockMaxBytes, this.blockMaxGas});
  factory HashedParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return HashedParams(
        blockMaxBytes: decode.getField(1), blockMaxGas: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_max_bytes": blockMaxBytes?.toString(),
      "block_max_gas": blockMaxGas?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.hashedParams;

  @override
  List get values => [blockMaxBytes, blockMaxGas];
}
