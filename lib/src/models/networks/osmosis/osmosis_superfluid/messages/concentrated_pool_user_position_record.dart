import 'package:blockchain_utils/bip/electrum/mnemonic_v1/wrodlist/languages.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/synthetic_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidConcentratedPoolUserPositionRecord
    extends CosmosMessage {
  final String? validatorAddress;
  final BigInt? positionId;
  final BigInt? lockId;
  final OsmosisLockupSyntheticLock syntheticLock;
  final Coin delegationAmount;
  final Coin equivalentStakedAmount;

  const OsmosisSuperfluidConcentratedPoolUserPositionRecord(
      {this.validatorAddress,
      this.positionId,
      this.lockId,
      required this.syntheticLock,
      required this.delegationAmount,
      required this.equivalentStakedAmount});
  factory OsmosisSuperfluidConcentratedPoolUserPositionRecord.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidConcentratedPoolUserPositionRecord(
        validatorAddress: decode.getField(1),
        positionId: decode.getField(2),
        lockId: decode.getField(3),
        syntheticLock:
            OsmosisLockupSyntheticLock.deserialize(decode.getField(4)),
        delegationAmount: Coin.deserialize(decode.getField(5)),
        equivalentStakedAmount: Coin.deserialize(decode.getField(6)));
  }
  factory OsmosisSuperfluidConcentratedPoolUserPositionRecord.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidConcentratedPoolUserPositionRecord(
        validatorAddress: json["validator_address"],
        positionId: BigintUtils.tryParse(json["position_id"]),
        lockId: BigintUtils.tryParse(json["lock_id"]),
        syntheticLock:
            OsmosisLockupSyntheticLock.fromRpc(json["synthetic_lock"]),
        delegationAmount: Coin.fromRpc(json["delegation_amount"]),
        equivalentStakedAmount: Coin.fromRpc(json["equivalent_staked_amount"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorAddress,
      "position_id": positionId?.toString(),
      "lock_id": lockId?.toString(),
      "synthetic_lock": syntheticLock.toJson(),
      "delegation_amount": delegationAmount.toJson(),
      "equivalent_staked_amount": equivalentStakedAmount.toJson()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.concentratedPoolUserPositionRecord;

  @override
  List get values => [
        validatorAddress,
        positionId,
        lockId,
        syntheticLock,
        delegationAmount,
        elctrumMnemonicWordsList
      ];
}
