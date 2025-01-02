import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/tendermint_validator.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ValidatorSet extends CosmosMessage {
  final List<TendermintValidator> validators;
  final TendermintValidator? proposer;
  final BigInt? totalVotingPower;
  ValidatorSet(
      {required List<TendermintValidator> validators,
      this.proposer,
      this.totalVotingPower})
      : validators = validators.immutable;
  factory ValidatorSet.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ValidatorSet(
        validators: decode
            .getFields<List<int>>(1)
            .map((e) => TendermintValidator.deserialize(e))
            .toList(),
        proposer: decode.getResult(2)?.to<TendermintValidator, List<int>>(
            (e) => TendermintValidator.deserialize(e)),
        totalVotingPower: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validators": validators.map((e) => e.toJson()).toList(),
      "proposer": proposer?.toJson(),
      "total_voting_power": totalVotingPower?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.tendermintValidatorSet;

  @override
  List get values => [validators, proposer, totalVotingPower];
}
