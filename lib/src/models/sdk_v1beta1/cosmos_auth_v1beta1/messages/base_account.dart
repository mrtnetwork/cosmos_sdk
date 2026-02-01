import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class BaseAccount extends CosmosBaseAccount {
  final CosmosBaseAddress address;
  final AnyMessage? pubKey;
  final BigInt accountNumber;
  final BigInt sequence;
  const BaseAccount({
    required this.address,
    required this.pubKey,
    required this.accountNumber,
    required this.sequence,
  });

  factory BaseAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);

    return BaseAccount(
      pubKey: decode
          .getResult(2)
          ?.to<AnyMessage, List<int>>(AnyMessage.deserialize),
      address: CosmosBaseAddress(decode.getField(1)),
      accountNumber: decode.getResult(3)?.cast<BigInt>() ?? BigInt.zero,
      sequence: decode.getResult(4)?.cast<BigInt>() ?? BigInt.zero,
    );
  }
  factory BaseAccount.fromJson(Map<String, dynamic> json) {
    return BaseAccount(
      address: CosmosBaseAddress(json.as("address")),
      pubKey: json.maybeAs(key: "pub_key", onValue: AnyMessage.fromJson),
      accountNumber: json.asBigInt("account_number"),
      sequence: json.asBigInt("sequence"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address.address,
      "pub_key": pubKey?.toJson(),
      "account_number": accountNumber.toString(),
      "sequence": sequence.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.baseAccount;

  @override
  List get values => [
    address.address,
    pubKey,
    accountNumber,
    sequence == BigInt.zero ? null : sequence,
  ];

  @override
  BaseAccount get baseAccount => this;
}
