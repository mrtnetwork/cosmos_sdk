import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisGammPoolmodelsBalancerV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisGammPoolmodelsBalancerV1beta1Types._(this.typeUrl);
  static const OsmosisGammPoolmodelsBalancerV1beta1Types msgCreateBalancerPool =
      OsmosisGammPoolmodelsBalancerV1beta1Types._(
          "/osmosis.gamm.poolmodels.balancer.v1beta1.MsgCreateBalancerPool");
  static const OsmosisGammPoolmodelsBalancerV1beta1Types
      msgCreateBalancerPoolResponse =
      OsmosisGammPoolmodelsBalancerV1beta1Types._(
          "/osmosis.gamm.poolmodels.balancer.v1beta1.MsgCreateBalancerPoolResponse");

  /// msg
  static const OsmosisGammPoolmodelsBalancerV1beta1Types createBalancerPool =
      OsmosisGammPoolmodelsBalancerV1beta1Types._(
          "/osmosis.gamm.poolmodels.balancer.v1beta1.Msg/CreateBalancerPool");
}
