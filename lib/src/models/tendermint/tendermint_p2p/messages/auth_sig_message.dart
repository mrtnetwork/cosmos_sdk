import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_crypto/messages/publick_key.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class AuthSigMessage extends CosmosMessage {
  final TendermintPublicKey pubKey;
  final List<int>? sig;
  AuthSigMessage({required this.pubKey, List<int>? sig})
      : sig = BytesUtils.tryToBytes(sig, unmodifiable: true);
  factory AuthSigMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return AuthSigMessage(
        pubKey: TendermintPublicKey.deserialize(decode.getField(1)),
        sig: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pub_key": pubKey.toJson(), "sig": BytesUtils.tryToHexString(sig)};
  }

  @override
  String get typeUrl => TendermintTypes.authSigMessage.typeUrl;

  @override
  List get values => [pubKey, sig];
}
