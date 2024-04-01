import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/signed_header.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/validator_set.dart';

class LightBlock extends CosmosMessage {
  final SignedHeader? signedHeader;
  final ValidatorSet? validatorSet;
  const LightBlock({this.signedHeader, this.validatorSet});
  factory LightBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return LightBlock(
        signedHeader: decode
            .getResult(1)
            ?.to<SignedHeader, List<int>>((e) => SignedHeader.deserialize(e)),
        validatorSet: decode
            .getResult(2)
            ?.to<ValidatorSet, List<int>>((e) => ValidatorSet.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signed_header": signedHeader?.toJson(),
      "validator_set": validatorSet?.toJson()
    };
  }

  @override
  String get typeUrl => TendermintTypes.lightBlock.typeUrl;

  @override
  List get values => [signedHeader, validatorSet];
}
