import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_asset_type.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidAssetTypeResponse extends CosmosMessage {
  final OsmosisSuperfluidSuperfluidAssetType? assetType;
  const OsmosisSuperfluidAssetTypeResponse({this.assetType});
  factory OsmosisSuperfluidAssetTypeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidAssetTypeResponse(
        assetType: decode
            .getResult(1)
            ?.to<OsmosisSuperfluidSuperfluidAssetType, int>(
                (e) => OsmosisSuperfluidSuperfluidAssetType.fromValue(e)));
  }
  factory OsmosisSuperfluidAssetTypeResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidAssetTypeResponse(
        assetType:
            OsmosisSuperfluidSuperfluidAssetType.fromName(json["asset_type"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"asset_type": assetType?.value};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.assetTypeResponse;

  @override
  List get values => [assetType];
}
