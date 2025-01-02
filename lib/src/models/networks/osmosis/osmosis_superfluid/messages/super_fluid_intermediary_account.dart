import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SuperfluidIntermediaryAccount takes the role of intermediary between LP token and OSMO tokens for superfluid staking.
/// The intermediary account is the actual account responsible for delegation, not the validator account itself.
class OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount
    extends CosmosMessage {
  /// Denom indicates the denom of the superfluid asset.
  final String? denom;
  final String? valAddr;

  /// perpetual gauge for rewards distribution
  final BigInt? gaugeId;
  const OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount(
      {this.denom, this.valAddr, this.gaugeId});
  factory OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount(
        denom: decode.getField(1),
        valAddr: decode.getField(2),
        gaugeId: decode.getField(3));
  }
  factory OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount(
        denom: json["denom"],
        valAddr: json["val_addr"],
        gaugeId: BigintUtils.tryParse(json["gauge_id"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "denom": denom,
      "val_addr": valAddr,
      "gauge_id": gaugeId?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.superfluidIntermediaryAccount;

  @override
  List get values => [denom, valAddr, gaugeId];
}
