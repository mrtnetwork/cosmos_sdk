import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// DepositParams defines the params for deposits on governance proposals.
class GovDepositParams extends CosmosMessage {
  /// Minimum deposit for a proposal to enter voting period.
  final List<Coin> minDeposit;

  /// Maximum period for Atom holders to deposit on a proposal. Initial value: 2
  /// months.
  final ProtobufDuration maxDepositPeriod;
  factory GovDepositParams.fromJson(Map<String, dynamic> json) {
    return GovDepositParams(
      minDeposit:
          (json["min_deposit"] as List?)
              ?.map((e) => Coin.fromJson(e))
              .toList() ??
          [],
      maxDepositPeriod: ProtobufDuration.fromString(json["max_deposit_period"]),
    );
  }
  GovDepositParams({
    required List<Coin> minDeposit,
    required this.maxDepositPeriod,
  }) : minDeposit = minDeposit.immutable;
  factory GovDepositParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovDepositParams(
      minDeposit:
          decode
              .getFields<List<int>>(1)
              .map((e) => Coin.deserialize(e))
              .toList(),
      maxDepositPeriod: ProtobufDuration.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "min_deposit": minDeposit.map((e) => e.toJson()).toList(),
      "max_deposit_period": maxDepositPeriod.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govDepositParams;

  @override
  List get values => [minDeposit, maxDepositPeriod];
}
