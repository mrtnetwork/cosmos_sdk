import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'super_fluid_asset_type.dart';

class OsmosisSuperfluidSuperfluidAsset extends CosmosMessage {
  final String? denom;
  // AssetType indicates whether the superfluid asset is a native token or an lp
  /// share
  final OsmosisSuperfluidSuperfluidAssetType? assetType;

  const OsmosisSuperfluidSuperfluidAsset({this.denom, this.assetType});
  factory OsmosisSuperfluidSuperfluidAsset.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidAsset(
      denom: decode.getField(1),
      assetType: decode
          .getResult(2)
          ?.to<OsmosisSuperfluidSuperfluidAssetType, int>(
            (e) => OsmosisSuperfluidSuperfluidAssetType.fromValue(e),
          ),
    );
  }
  factory OsmosisSuperfluidSuperfluidAsset.fromJson(Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidAsset(
      denom: json["denom"],
      assetType:
          json["asset_type"] == null
              ? null
              : OsmosisSuperfluidSuperfluidAssetType.fromName(
                json["asset_type"],
              ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "asset_type": assetType?.name};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.superfluidAsset;

  @override
  List get values => [denom, assetType?.value];
}
