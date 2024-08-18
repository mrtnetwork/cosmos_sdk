import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// DepositParams defines the params for deposits on governance proposals.
class GovDepositParams extends CosmosMessage {
  /// Minimum deposit for a proposal to enter voting period.
  final List<Coin> minDeposit;

  /// Maximum period for Atom holders to deposit on a proposal. Initial value: 2
  /// months.
  final ProtobufDuration maxDepositPeriod;
  GovDepositParams(
      {required List<Coin> minDeposit, required this.maxDepositPeriod})
      : minDeposit = minDeposit.immutable;
  factory GovDepositParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovDepositParams(
        minDeposit:
            decode.getFields(1).map((e) => Coin.deserialize(e)).toList(),
        maxDepositPeriod: ProtobufDuration.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "min_deposit": minDeposit.map((e) => e.toJson()).toList(),
      "max_deposit_period": maxDepositPeriod.toJson()
    };
  }

  @override
  String get typeUrl => GovV1beta1types.govDepositParams.typeUrl;

  @override
  List get values => [minDeposit, maxDepositPeriod];
}
