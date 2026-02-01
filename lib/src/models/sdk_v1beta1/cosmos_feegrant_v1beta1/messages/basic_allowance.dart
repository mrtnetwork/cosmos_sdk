import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// BasicAllowance implements Allowance with a one-time grant of coins that optionally expires.
/// The grantee can use up to SpendLimit to cover fees.
class BasicAllowance extends CosmosMessage {
  /// spend_limit specifies the maximum amount of coins that can be spent
  /// by this allowance and will be updated as coins are spent. If it is
  /// empty, there is no spend limit and any amount of coins can be spent.
  final List<Coin> spendLimit;

  /// expiration specifies an optional time when this allowance expires
  final ProtobufTimestamp? expiration;
  BasicAllowance({required List<Coin> spendLimit, this.expiration})
    : spendLimit = spendLimit.immutable;
  factory BasicAllowance.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return BasicAllowance(
      spendLimit:
          decode
              .getFields<List<int>>(1)
              .map((e) => Coin.deserialize(e))
              .toList(),
      expiration: decode
          .getResult(2)
          ?.to<ProtobufTimestamp, List<int>>(
            (e) => ProtobufTimestamp.deserialize(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "spend_limit": spendLimit.map((e) => e.toJson()).toList(),
      "expiration": expiration?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => FeegrantV1beta1Types.basicAllowance;

  @override
  List get values => [spendLimit, expiration];
}
