import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ValidatorParams restrict the public key types validators can use. NOTE: uses ABCI pubkey naming, not Amino names.
class ValidatorParams extends CosmosMessage {
  final String? pubKeyTypes;
  const ValidatorParams({this.pubKeyTypes});
  factory ValidatorParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ValidatorParams(pubKeyTypes: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pub_key_types": pubKeyTypes};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.tendermintValidatorParams;

  @override
  List get values => [pubKeyTypes];
}
