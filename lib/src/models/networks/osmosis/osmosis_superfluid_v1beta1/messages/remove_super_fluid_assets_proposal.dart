import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// RemoveSuperfluidAssetsProposal is a gov Content type to remove the superfluid assets by denom
class OsmosisSuperfluidRemoveSuperfluidAssetsProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final List<String>? superfluidAssetDenoms;
  OsmosisSuperfluidRemoveSuperfluidAssetsProposal(
      {this.title, this.description, List<String>? superfluidAssetDenoms})
      : superfluidAssetDenoms = superfluidAssetDenoms?.nullOnEmpy;
  factory OsmosisSuperfluidRemoveSuperfluidAssetsProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidRemoveSuperfluidAssetsProposal(
        description: decode.getField(2),
        title: decode.getField(1),
        superfluidAssetDenoms: decode.getFields<String>(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "superfluid_asset_denoms": superfluidAssetDenoms
    };
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidV1beta1Types.removeSuperfluidAssetsProposal.typeUrl;

  @override
  List get values => [title, description, superfluidAssetDenoms];
}
