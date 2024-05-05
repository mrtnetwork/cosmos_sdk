import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisIbcRatelimitV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisIbcRatelimitV1beta1Types._(this.typeUrl);
  static const OsmosisIbcRatelimitV1beta1Types params =
      OsmosisIbcRatelimitV1beta1Types._("/osmosis.ibcratelimit.v1beta1.Params");
}
