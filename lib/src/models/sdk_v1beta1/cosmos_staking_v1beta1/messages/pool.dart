import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// Pool is used for tracking bonded and not-bonded token supply of the bond denomination.
class Pool extends CosmosMessage {
  final BigInt notBondedTokens;
  final BigInt bondedTokens;

  const Pool({required this.notBondedTokens, required this.bondedTokens});
  factory Pool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Pool(
      bondedTokens: BigintUtils.parse(decode.getField<String>(1)),
      notBondedTokens: BigintUtils.parse(decode.getField<String>(2)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'not_bonded_tokens': notBondedTokens.toString(),
      'bonded_tokens': bondedTokens.toString(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get typeUrl => StakingV1beta1Types.pool.typeUrl;

  @override
  List get values => [notBondedTokens.toString(), bondedTokens.toString()];
}
