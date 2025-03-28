import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_tendermint_v1/messages/fraction.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/ics23/messages/proof_spec.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class IbcTendermintClientState extends CosmosMessage {
  final String? chainId;
  final IbcTendermintFraction trustLevel;

  /// duration of the period since the LatestTimestamp during which the
  /// submitted headers are valid for upgrade
  final ProtobufDuration trustingPeriod;

  /// duration of the staking unbonding period
  final ProtobufDuration unbondingPeriod;

  /// defines how much new (untrusted) header's Time can drift into the future.
  final ProtobufDuration maxClockDrift;

  /// Block height when the client was frozen due to a misbehaviour
  final IbcClientHeight frozenHeight;

  /// Latest height the client was updated to
  final IbcClientHeight latestHeight;

  /// Proof specifications used in verifying counterparty state
  final List<Ics23ProofSpec>? proofSpecs;

  /// Path at which next upgraded client will be committed.
  /// Each element corresponds to the key for a single CommitmentProof in the
  /// chained proof. NOTE: ClientState must stored under
  /// `{upgradePath}/{upgradeHeight}/clientState` ConsensusState must be stored
  /// under `{upgradepath}/{upgradeHeight}/consensusState` For SDK chains using
  /// the default upgrade module, upgrade_path should be []string{"upgrade",
  /// "upgradedIBCState"}`
  final List<String>? upgradePath;

  /// allow_update_after_expiry is deprecated
  final bool? allowUpdateAfterExpiry;

  /// // allow_update_after_misbehaviour is deprecated
  final bool? allowUpdateAfterMisbehaviour;
  IbcTendermintClientState(
      {this.chainId,
      required this.trustLevel,
      required this.trustingPeriod,
      required this.unbondingPeriod,
      required this.maxClockDrift,
      required this.frozenHeight,
      required this.latestHeight,
      List<Ics23ProofSpec>? proofSpecs,
      List<String>? upgradePath,
      this.allowUpdateAfterExpiry,
      this.allowUpdateAfterMisbehaviour})
      : proofSpecs = proofSpecs?.emptyAsNull?.immutable,
        upgradePath = upgradePath?.emptyAsNull?.immutable;
  factory IbcTendermintClientState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTendermintClientState(
        chainId: decode.getField(1),
        trustLevel: IbcTendermintFraction.deserialize(decode.getField(2)),
        trustingPeriod: ProtobufDuration.deserialize(decode.getField(3)),
        unbondingPeriod: ProtobufDuration.deserialize(decode.getField(4)),
        maxClockDrift: ProtobufDuration.deserialize(decode.getField(5)),
        frozenHeight: IbcClientHeight.deserialize(decode.getField(6)),
        latestHeight: IbcClientHeight.deserialize(decode.getField(7)),
        proofSpecs: decode
            .getFields<List<int>>(8)
            .map((e) => Ics23ProofSpec.deserialize(e))
            .toList(),
        upgradePath: decode.getFields<String>(9),
        allowUpdateAfterExpiry: decode.getField(10),
        allowUpdateAfterMisbehaviour: decode.getField(11));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Map<String, dynamic> toJson() {
    return {
      "chain_id": chainId,
      "trust_level": trustLevel.toJson(),
      "trusting_period": trustingPeriod.toJson(),
      "unbonding_period": unbondingPeriod.toJson(),
      "max_clock_drift": maxClockDrift.toJson(),
      "frozen_height": frozenHeight.toJson(),
      "latest_height": latestHeight.toJson(),
      "proof_specs": proofSpecs?.map((e) => e.toJson()).toList(),
      "upgrade_path": upgradePath,
      "allow_update_after_expiry": allowUpdateAfterExpiry,
      "allow_update_after_misbehaviour": allowUpdateAfterMisbehaviour
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcTendermintV1ClientState;

  @override
  List get values => [
        chainId,
        trustLevel,
        trustingPeriod,
        unbondingPeriod,
        maxClockDrift,
        frozenHeight,
        latestHeight,
        proofSpecs,
        upgradePath,
        allowUpdateAfterExpiry,
        allowUpdateAfterMisbehaviour
      ];
}
