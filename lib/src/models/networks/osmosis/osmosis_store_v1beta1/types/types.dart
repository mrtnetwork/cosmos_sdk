import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisStoreV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisStoreV1beta1Types._(this.typeUrl);
  static OsmosisStoreV1beta1Types child =
      OsmosisStoreV1beta1Types._("/osmosis.store.v1beta1.Child");
  static OsmosisStoreV1beta1Types leaf =
      OsmosisStoreV1beta1Types._("/osmosis.store.v1beta1.Leaf");
  static OsmosisStoreV1beta1Types node =
      OsmosisStoreV1beta1Types._("/osmosis.store.v1beta1.Node");
}
