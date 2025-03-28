import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// The Osmo-Equivalent-Multiplier Record for epoch N refers to the osmo worth we treat
/// an LP share as having, for all of epoch N. Eventually this is intended to be set as
/// the Time-weighted-average-osmo-backing for the entire duration of epoch N-1.
/// (Thereby locking whats in use for epoch N as based on the prior epochs rewards)
/// However for now, this is not the TWAP but instead the spot price at the boundary.
/// For different types of assets in the future, it could change.
class OsmosisSuperfluidOsmoEquivalentMultiplierRecord extends CosmosMessage {
  final BigInt? epochNumber;

  /// superfluid asset denom, can be LP token or native token
  final String? denom;
  final String multiplier;

  const OsmosisSuperfluidOsmoEquivalentMultiplierRecord(
      {this.epochNumber, this.denom, required this.multiplier});
  factory OsmosisSuperfluidOsmoEquivalentMultiplierRecord.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidOsmoEquivalentMultiplierRecord(
      epochNumber: decode.getField(1),
      denom: decode.getField(2),
      multiplier: decode.getField(3),
    );
  }
  factory OsmosisSuperfluidOsmoEquivalentMultiplierRecord.fromJson(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidOsmoEquivalentMultiplierRecord(
        multiplier: json["multiplier"],
        denom: json["denom"],
        epochNumber: BigintUtils.tryParse(json["epoch_number"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "epoch_number": epochNumber?.toString(),
      "denom": denom,
      "multiplier": multiplier
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.osmoEquivalentMultiplierRecord;

  @override
  List get values => [epochNumber, denom, multiplier];
}
