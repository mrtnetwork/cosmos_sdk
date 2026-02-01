import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_crypto/messages/publick_key.dart';

class TendermintValidator extends CosmosMessage {
  final List<int>? address;
  final TendermintPublicKey pubkey;
  final BigInt? votingPower;
  final BigInt? proposerPriority;
  TendermintValidator({
    List<int>? address,
    required this.pubkey,
    this.votingPower,
    this.proposerPriority,
  }) : address = BytesUtils.tryToBytes(address);
  factory TendermintValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TendermintValidator(
      address: decode.getField(1),
      pubkey: TendermintPublicKey.deserialize(decode.getField(2)),
      proposerPriority: decode.getField(4),
      votingPower: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": BytesUtils.tryToHexString(address),
      "pub_key": pubkey.toJson(),
      "voting_power": votingPower?.toString(),
      "proposer_priority": proposerPriority?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.tendermintValidator;

  @override
  List get values => [address, pubkey, votingPower, proposerPriority];
}
