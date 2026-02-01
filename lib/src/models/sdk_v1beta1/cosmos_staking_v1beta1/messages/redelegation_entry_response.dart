import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/redelegation_entry.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// RedelegationEntryResponse is equivalent to a RedelegationEntry except that it
/// contains a balance in addition to shares which is more suitable for client responses.
class RedelegationEntryResponse extends CosmosMessage {
  final RedelegationEntry redelegationEntry;
  final BigInt balance;
  const RedelegationEntryResponse({
    required this.redelegationEntry,
    required this.balance,
  });
  factory RedelegationEntryResponse.fromJson(Map<String, dynamic> json) {
    return RedelegationEntryResponse(
      redelegationEntry: RedelegationEntry.fromJson(json["redelegation_entry"]),
      balance: BigintUtils.parse(json["balance"]),
    );
  }

  factory RedelegationEntryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return RedelegationEntryResponse(
      redelegationEntry: RedelegationEntry.deserialize(decode.getField(1)),
      balance: BigintUtils.parse(decode.getField<String>(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "redelegation_entry": redelegationEntry.toJson(),
      "balance": balance.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.redelegationEntryResponse;

  @override
  List get values => [redelegationEntry, balance.toString()];
}
