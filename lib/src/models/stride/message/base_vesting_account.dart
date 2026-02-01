import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/models/stride/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class StrideBaseVestingAccount extends CosmosMessage {
  final BaseAccount baseAccount;
  final List<Coin> orginalVesting;
  final List<Coin> delegatedFree;
  final List<Coin> delegatedVesting;
  final BigInt endTime;

  StrideBaseVestingAccount({
    required this.baseAccount,
    required List<Coin> orginalVesting,
    required List<Coin> delegatedFree,
    required List<Coin> delegatedVesting,
    required this.endTime,
  }) : orginalVesting = orginalVesting.immutable,
       delegatedFree = delegatedFree.immutable,
       delegatedVesting = delegatedVesting.immutable;
  factory StrideBaseVestingAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StrideBaseVestingAccount(
      baseAccount: BaseAccount.deserialize(decode.getField(1)),
      orginalVesting:
          decode.getFields<List<int>>(2).map(Coin.deserialize).toList(),
      delegatedFree:
          decode.getFields<List<int>>(3).map(Coin.deserialize).toList(),
      delegatedVesting:
          decode.getFields<List<int>>(4).map(Coin.deserialize).toList(),
      endTime: decode.getField(5),
    );
  }
  factory StrideBaseVestingAccount.fromJson(Map<String, dynamic> json) {
    return StrideBaseVestingAccount(
      baseAccount: BaseAccount.fromJson(json["base_account"]),
      orginalVesting:
          json
              .asListOfMap("original_vesting", throwOnNull: true)!
              .map(Coin.fromJson)
              .toList(),
      delegatedFree:
          json
              .asListOfMap("delegated_free", throwOnNull: true)!
              .map(Coin.fromJson)
              .toList(),
      delegatedVesting:
          json
              .asListOfMap("delegated_vesting", throwOnNull: true)!
              .map(Coin.fromJson)
              .toList(),
      endTime: json.asBigInt("end_time"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "base_account": baseAccount.toJson(),
      "original_vesting": orginalVesting.map((e) => e.toJson()).toList(),
      "delegated_free": delegatedFree.map((e) => e.toJson()).toList(),
      "end_time": endTime.toString(),
      "delegated_vesting": delegatedVesting.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => StrideTypes.baseVestingAccount;

  @override
  List get values => [
    baseAccount,
    orginalVesting,
    delegatedFree,
    delegatedVesting,
    endTime,
  ];
}
