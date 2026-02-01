import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisAccumV1beta1Types extends TypeUrl {
  const OsmosisAccumV1beta1Types._(super.typeUrl);
  static const OsmosisAccumV1beta1Types accumulatorContent =
      OsmosisAccumV1beta1Types._("/osmosis.accum.v1beta1.AccumulatorContent");
  static const OsmosisAccumV1beta1Types options = OsmosisAccumV1beta1Types._(
    "/osmosis.accum.v1beta1.Options",
  );
  static const OsmosisAccumV1beta1Types record = OsmosisAccumV1beta1Types._(
    "/osmosis.accum.v1beta1.Record",
  );
}
