import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_asset.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidAllAssetsResponse extends CosmosMessage {
  final List<OsmosisSuperfluidSuperfluidAsset> assets;
  OsmosisSuperfluidAllAssetsResponse(
      {required List<OsmosisSuperfluidSuperfluidAsset> assets})
      : assets = assets.immutable;
  factory OsmosisSuperfluidAllAssetsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidAllAssetsResponse(
        assets: decode
            .getFields<List<int>>(1)
            .map((e) => OsmosisSuperfluidSuperfluidAsset.deserialize(e))
            .toList());
  }
  factory OsmosisSuperfluidAllAssetsResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidAllAssetsResponse(
        assets: (json["assets"] as List?)
                ?.map((e) => OsmosisSuperfluidSuperfluidAsset.fromJson(e))
                .toList() ??
            <OsmosisSuperfluidSuperfluidAsset>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"assets": assets.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.allAssetsResponse;

  @override
  List get values => [assets];
}
