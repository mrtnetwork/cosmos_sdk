import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisAccumV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisAccumV1beta1Types._(this.typeUrl);
  static const OsmosisAccumV1beta1Types accumulatorContent =
      OsmosisAccumV1beta1Types._("/osmosis.accum.v1beta1.AccumulatorContent");
  static const OsmosisAccumV1beta1Types options =
      OsmosisAccumV1beta1Types._("/osmosis.accum.v1beta1.Options");
  static const OsmosisAccumV1beta1Types record =
      OsmosisAccumV1beta1Types._("/osmosis.accum.v1beta1.Record");
}
