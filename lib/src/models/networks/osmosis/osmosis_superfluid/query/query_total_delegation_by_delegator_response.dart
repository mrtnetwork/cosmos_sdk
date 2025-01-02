import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_delegation_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/delegation_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse
    extends CosmosMessage {
  final List<OsmosisSuperfluidSuperfluidDelegationRecord>
      superfluidDelegationRecords;
  final List<DelegationResponse> delegationResponse;
  final List<Coin> totalDelegatedCoins;
  final Coin totalEquivalentStakedAmount;
  OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse(
      {required List<OsmosisSuperfluidSuperfluidDelegationRecord>
          superfluidDelegationRecords,
      required List<DelegationResponse> delegationResponse,
      required List<Coin> totalDelegatedCoins,
      required this.totalEquivalentStakedAmount})
      : superfluidDelegationRecords = superfluidDelegationRecords.immutable,
        delegationResponse = delegationResponse.immutable,
        totalDelegatedCoins = totalDelegatedCoins.immutable;
  factory OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse(
        superfluidDelegationRecords: decode
            .getFields(1)
            .map((e) =>
                OsmosisSuperfluidSuperfluidDelegationRecord.deserialize(e))
            .toList(),
        delegationResponse: decode
            .getFields(2)
            .map((e) => DelegationResponse.deserialize(e))
            .toList(),
        totalDelegatedCoins:
            decode.getFields(3).map((e) => Coin.deserialize(e)).toList(),
        totalEquivalentStakedAmount: Coin.deserialize(decode.getField(4)));
  }
  factory OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse(
        superfluidDelegationRecords:
            (json["superfluid_delegation_records"] as List?)
                    ?.map((e) =>
                        OsmosisSuperfluidSuperfluidDelegationRecord.fromRpc(e))
                    .toList() ??
                <OsmosisSuperfluidSuperfluidDelegationRecord>[],
        delegationResponse: (json["delegation_response"] as List?)
                ?.map((e) => DelegationResponse.fromRpc(e))
                .toList() ??
            <DelegationResponse>[],
        totalDelegatedCoins: (json["total_delegated_coins"] as List?)
                ?.map((e) => Coin.fromRpc(e))
                .toList() ??
            <Coin>[],
        totalEquivalentStakedAmount:
            Coin.fromRpc(json["total_equivalent_staked_amount"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "superfluid_delegation_records":
          superfluidDelegationRecords.map((e) => e.toJson()).toList(),
      "delegation_response": delegationResponse.map((e) => e.toJson()).toList(),
      "total_delegated_coins":
          totalDelegatedCoins.map((e) => e.toJson()).toList(),
      "total_equivalent_staked_amount": totalEquivalentStakedAmount.toJson()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.queryTotalDelegationByDelegatorResponse;

  @override
  List get values => [
        superfluidDelegationRecords,
        delegationResponse,
        totalDelegatedCoins,
        totalEquivalentStakedAmount
      ];
}
