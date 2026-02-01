import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/redelegation.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/redelegation_entry_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// RedelegationResponse is equivalent to a Redelegation except that its entries contain
/// a balance in addition to shares which is more suitable for client responses.
class RedelegationResponse extends CosmosMessage {
  final Redelegation redelegation;
  final List<RedelegationEntryResponse> entries;
  const RedelegationResponse({
    required this.redelegation,
    required this.entries,
  });

  factory RedelegationResponse.fromJson(Map<String, dynamic> json) {
    return RedelegationResponse(
      redelegation: Redelegation.fromJson(json["redelegation"]),
      entries:
          (json["entries"] as List?)
              ?.map((e) => RedelegationEntryResponse.fromJson(e))
              .toList() ??
          [],
    );
  }

  factory RedelegationResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return RedelegationResponse(
      redelegation: Redelegation.deserialize(decode.getField(1)),
      entries:
          decode
              .getFields<List<int>>(2)
              .map((e) => RedelegationEntryResponse.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "redelegation": redelegation.toJson(),
      "entries": entries.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.redelegationResponse;

  @override
  List get values => [redelegation, entries];
}
