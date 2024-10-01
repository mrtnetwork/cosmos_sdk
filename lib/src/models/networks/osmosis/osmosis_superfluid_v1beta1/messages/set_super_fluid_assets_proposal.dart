import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_asset.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// SetSuperfluidAssetsProposal is a gov Content type to update the superfluid assets
class OsmosisSuperfluidSetSuperfluidAssetsProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final List<OsmosisSuperfluidSuperfluidAsset> assets;
  OsmosisSuperfluidSetSuperfluidAssetsProposal(
      {this.title,
      this.description,
      required List<OsmosisSuperfluidSuperfluidAsset> assets})
      : assets = assets.immutable;
  factory OsmosisSuperfluidSetSuperfluidAssetsProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSetSuperfluidAssetsProposal(
        description: decode.getField(2),
        title: decode.getField(1),
        assets: decode
            .getFields<List<int>>(3)
            .map((e) => OsmosisSuperfluidSuperfluidAsset.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "assets": assets.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidV1beta1Types.setSuperfluidAssetsProposal.typeUrl;

  @override
  List get values => [title, description, assets];
}
