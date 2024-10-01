import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'lock_id_intermediary_account_connection.dart';
import 'osmo_equivalent_multiplier_record.dart';
import 'params.dart';
import 'super_fluid_asset.dart';
import 'super_fluid_intermediary_account.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the module's genesis state.
class OsmosisSuperfluidGenesisState extends CosmosMessage {
  final OsmosisSuperfluidParams params;

  /// superfluid_assets defines the registered superfluid assets that have been
  /// registered via governance.
  final List<OsmosisSuperfluidSuperfluidAsset> superfluidAssets;

  /// osmo_equivalent_multipliers is the records of osmo equivalent amount of
  /// each superfluid registered pool, updated every epoch.
  final List<OsmosisSuperfluidOsmoEquivalentMultiplierRecord>
      osmoEquivalentMultipliers;

  /// intermediary_accounts is a secondary account for superfluid staking that
  /// plays an intermediary role between validators and the delegators.
  final List<OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount>
      intermediaryAccounts;
  final List<OsmosisSuperfluidLockIdIntermediaryAccountConnection>
      intemediaryAccountConnections;

  OsmosisSuperfluidGenesisState({
    required this.params,
    required List<OsmosisSuperfluidSuperfluidAsset> superfluidAssets,
    required List<OsmosisSuperfluidOsmoEquivalentMultiplierRecord>
        osmoEquivalentMultipliers,
    required List<OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount>
        intermediaryAccounts,
    required List<OsmosisSuperfluidLockIdIntermediaryAccountConnection>
        intemediaryAccountConnections,
  })  : superfluidAssets = superfluidAssets.immutable,
        osmoEquivalentMultipliers = osmoEquivalentMultipliers.immutable,
        intermediaryAccounts = intermediaryAccounts.immutable,
        intemediaryAccountConnections = intemediaryAccountConnections.immutable;
  factory OsmosisSuperfluidGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidGenesisState(
      params: OsmosisSuperfluidParams.deserialize(decode.getField(1)),
      superfluidAssets: decode
          .getFields(2)
          .map((e) => OsmosisSuperfluidSuperfluidAsset.deserialize(e))
          .toList(),
      osmoEquivalentMultipliers: decode
          .getFields(3)
          .map((e) =>
              OsmosisSuperfluidOsmoEquivalentMultiplierRecord.deserialize(e))
          .toList(),
      intermediaryAccounts: decode
          .getFields(4)
          .map((e) =>
              OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount.deserialize(
                  e))
          .toList(),
      intemediaryAccountConnections: decode
          .getFields(5)
          .map((e) =>
              OsmosisSuperfluidLockIdIntermediaryAccountConnection.deserialize(
                  e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "params": params.toJson(),
      "superfluid_assets": superfluidAssets.map((e) => e.toJson()).toList(),
      "osmo_equivalent_multipliers":
          osmoEquivalentMultipliers.map((e) => e.toJson()).toList(),
      "intermediary_accounts":
          intermediaryAccounts.map((e) => e.toJson()).toList(),
      "intemediary_account_connections":
          intemediaryAccountConnections.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes.genesisState.typeUrl;

  @override
  List get values => [
        params,
        superfluidAssets,
        osmoEquivalentMultipliers,
        intermediaryAccounts,
        intemediaryAccountConnections
      ];
}
