import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/crypto/public_key/public_key.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';

class BaseAccount extends CosmosMessage {
  final BaseAddress address;
  final CosmosPublicKeyInfo? pubKey;
  final BigInt accountNumber;
  final BigInt sequence;
  const BaseAccount(
      {required this.address,
      required this.pubKey,
      required this.accountNumber,
      required this.sequence});
  factory BaseAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BaseAccount(
        address: BaseAddress(decode.getField(1)),
        pubKey: decode.getResult(2)?.to<CosmosPublicKeyInfo, List<int>>(
            (e) => CosmosPublicKeyInfo.fromAnyBytes(e)),
        accountNumber:
            decode.getResult<ProtocolBufferDecoderResult>(3).cast<BigInt>(),
        sequence: decode.getResult(4)?.cast<BigInt>() ?? BigInt.zero);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address.address,
      "pub_key": pubKey?.toJson(),
      "account_number": accountNumber.toString(),
      "sequence": sequence.toString()
    };
  }

  @override
  String get typeUrl => AuthV1beta1Types.baseAccount.typeUrl;

  @override
  List get values => [
        address.address,
        pubKey?.toAny(),
        accountNumber,
        sequence == BigInt.zero ? null : sequence
      ];
}
