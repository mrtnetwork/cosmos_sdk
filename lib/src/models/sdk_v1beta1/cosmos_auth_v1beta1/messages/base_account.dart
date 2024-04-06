import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/crypto/public_key/public_key.dart';
import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class BaseAccount extends CosmosBaseAccount {
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
        accountNumber: decode.getResult(3)?.cast<BigInt>() ?? BigInt.zero,
        sequence: decode.getResult(4)?.cast<BigInt>() ?? BigInt.zero);
  }
  factory BaseAccount.fromRpc(Map<String, dynamic> json) {
    CosmosUtils.validateMessageType(AuthV1beta1Types.baseAccount.typeUrl,
        json["@type"] ?? AuthV1beta1Types.baseAccount.typeUrl);

    return BaseAccount(
        address: BaseAddress(json["address"]),
        pubKey: json["pub_key"] == null
            ? null
            : CosmosPublicKeyInfo.fromRpc(json["pub_key"]),
        accountNumber: BigInt.parse(json["account_number"]),
        sequence: BigInt.parse(json["sequence"]));
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
