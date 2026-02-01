import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/osmo_equivalent_multiplier_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidAssetMultiplierResponse extends CosmosMessage {
  final OsmosisSuperfluidOsmoEquivalentMultiplierRecord?
  osmoEquivalentMultiplier;
  const OsmosisSuperfluidAssetMultiplierResponse({
    this.osmoEquivalentMultiplier,
  });
  factory OsmosisSuperfluidAssetMultiplierResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidAssetMultiplierResponse(
      osmoEquivalentMultiplier: decode
          .getResult(1)
          ?.to<OsmosisSuperfluidOsmoEquivalentMultiplierRecord, List<int>>(
            (e) =>
                OsmosisSuperfluidOsmoEquivalentMultiplierRecord.deserialize(e),
          ),
    );
  }
  factory OsmosisSuperfluidAssetMultiplierResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidAssetMultiplierResponse(
      osmoEquivalentMultiplier:
          json["osmo_equivalent_multiplier"] == null
              ? null
              : OsmosisSuperfluidOsmoEquivalentMultiplierRecord(
                multiplier: json["osmo_equivalent_multiplier"],
              ),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"osmo_equivalent_multiplier": osmoEquivalentMultiplier?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.assetMultiplierResponse;

  @override
  List get values => [osmoEquivalentMultiplier];
}
