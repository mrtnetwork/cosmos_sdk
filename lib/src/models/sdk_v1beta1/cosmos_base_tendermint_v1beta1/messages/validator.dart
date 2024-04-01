import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Validator is the type for the validator-set.
class CosmosTendermintValidator extends CosmosMessage {
  final BaseAddress? address;
  final Any? pubKey;
  final BigInt? votingPower;
  final BigInt? proposerPriority;
  const CosmosTendermintValidator(
      {this.address, this.pubKey, this.votingPower, this.proposerPriority});
  factory CosmosTendermintValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosTendermintValidator(
        address:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        pubKey:
            decode.getResult(2)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        votingPower: decode.getField(3),
        proposerPriority: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address?.address,
      "pub_key": pubKey?.toJson(),
      "voting_power": votingPower?.toString(),
      "proposer_priority": proposerPriority?.toString()
    };
  }

  @override
  String get typeUrl => BaseTendermintV1beta1Types.cosmosValidator.typeUrl;

  @override
  List get values => [address?.address, pubKey, votingPower, proposerPriority];
}
