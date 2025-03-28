import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_delegation_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse
    extends CosmosMessage {
  final List<OsmosisSuperfluidSuperfluidDelegationRecord>
      superfluidDelegationRecords;
  final List<Coin> totalDelegatedCoins;
  final Coin totalEquivalentStakedAmount;
  // final String totalDelegations;
  OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse(
      {required List<OsmosisSuperfluidSuperfluidDelegationRecord>
          superfluidDelegationRecords,
      required List<Coin> totalDelegatedCoins,
      required this.totalEquivalentStakedAmount})
      : superfluidDelegationRecords = superfluidDelegationRecords.immutable,
        totalDelegatedCoins = totalDelegatedCoins.immutable;
  factory OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse(
        superfluidDelegationRecords: decode
            .getFields<List<int>>(1)
            .map((e) =>
                OsmosisSuperfluidSuperfluidDelegationRecord.deserialize(e))
            .toList(),
        totalDelegatedCoins: decode
            .getFields<List<int>>(2)
            .map((e) => Coin.deserialize(e))
            .toList(),
        totalEquivalentStakedAmount: Coin.deserialize(decode.getField(3)));
  }
  factory OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse(
        superfluidDelegationRecords:
            (json["superfluid_delegation_records"] as List?)
                    ?.map((e) =>
                        OsmosisSuperfluidSuperfluidDelegationRecord.fromJson(e))
                    .toList() ??
                <OsmosisSuperfluidSuperfluidDelegationRecord>[],
        totalDelegatedCoins: (json["total_delegated_coins"] as List?)
                ?.map((e) => Coin.fromJson(e))
                .toList() ??
            <Coin>[],
        totalEquivalentStakedAmount:
            Coin.fromJson(json["total_equivalent_staked_amount"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "superfluid_delegation_records":
          superfluidDelegationRecords.map((e) => e.toJson()).toList(),
      "total_delegated_coins":
          totalDelegatedCoins.map((e) => e.toJson()).toList(),
      "total_equivalent_staked_amount": totalEquivalentStakedAmount.toJson()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.superfluidDelegationsByDelegatorResponse;

  @override
  List get values => [
        superfluidDelegationRecords,
        totalDelegatedCoins,
        totalEquivalentStakedAmount
      ];
}
