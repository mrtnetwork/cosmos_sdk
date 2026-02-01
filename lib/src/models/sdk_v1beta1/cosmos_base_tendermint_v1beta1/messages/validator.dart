import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Validator is the type for the validator-set.
class CosmosTendermintValidator extends CosmosMessage {
  final CosmosBaseAddress? address;
  final Any? pubKey;
  final BigInt? votingPower;
  final BigInt? proposerPriority;
  const CosmosTendermintValidator({
    this.address,
    this.pubKey,
    this.votingPower,
    this.proposerPriority,
  });
  factory CosmosTendermintValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosTendermintValidator(
      address: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      pubKey: decode
          .getResult(2)
          ?.to<Any, List<int>>((e) => Any.deserialize(e)),
      votingPower: decode.getField(3),
      proposerPriority: decode.getField(4),
    );
  }
  factory CosmosTendermintValidator.fromJson(Map<String, dynamic> json) {
    return CosmosTendermintValidator(
      address:
          json["address"] == null ? null : CosmosBaseAddress(json["address"]),
      pubKey: json["pub_key"] == null ? null : Any.fromJson(json["pub_key"]),
      votingPower: BigintUtils.tryParse(json["voting_power"]),
      proposerPriority: BigintUtils.tryParse(json["proposer_priority"]),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address?.address,
      "pub_key": pubKey?.toJson(),
      "voting_power": votingPower?.toString(),
      "proposer_priority": proposerPriority?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.cosmosValidator;

  @override
  List get values => [address?.address, pubKey, votingPower, proposerPriority];
}
