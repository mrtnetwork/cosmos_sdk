import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisGammPoolmodelsBalancerV1beta1Types extends TypeUrl {
  const OsmosisGammPoolmodelsBalancerV1beta1Types._(super.typeUrl);
  static const String root = "/osmosis.gamm.poolmodels.balancer.v1beta1";
  static const OsmosisGammPoolmodelsBalancerV1beta1Types msgCreateBalancerPool =
      OsmosisGammPoolmodelsBalancerV1beta1Types._(
        "/osmosis.gamm.poolmodels.balancer.v1beta1.MsgCreateBalancerPool",
      );
  static const OsmosisGammPoolmodelsBalancerV1beta1Types
  msgCreateBalancerPoolResponse = OsmosisGammPoolmodelsBalancerV1beta1Types._(
    "/osmosis.gamm.poolmodels.balancer.v1beta1.MsgCreateBalancerPoolResponse",
  );

  static const List<TypeUrl> services = [msgCreateBalancerPool];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
