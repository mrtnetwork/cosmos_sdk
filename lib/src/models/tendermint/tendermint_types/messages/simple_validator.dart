import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_crypto/messages/publick_key.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class SimpleValidator extends CosmosMessage {
  final TendermintPublicKey? pubKey;
  final BigInt? votingPower;
  const SimpleValidator({this.pubKey, this.votingPower});
  factory SimpleValidator.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SimpleValidator(
        pubKey: decode.getResult(1)?.to<TendermintPublicKey, List<int>>(
            (e) => TendermintPublicKey.deserialize(e)),
        votingPower: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pub_key": pubKey?.toJson(), "voting_power": votingPower?.toString};
  }

  @override
  String get typeUrl => TendermintTypes.simpleValidator.typeUrl;

  @override
  List get values => [pubKey, votingPower];
}
