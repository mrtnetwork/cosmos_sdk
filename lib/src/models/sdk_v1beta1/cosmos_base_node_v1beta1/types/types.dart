import 'package:cosmos_sdk/cosmos_sdk.dart';

class BaseNodeV1beta1Types extends TypeUrl {
  const BaseNodeV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const BaseNodeV1beta1Types nodeConfigRequest = BaseNodeV1beta1Types._(
    "/cosmos.base.node.v1beta1.ConfigRequest",
    query: "/cosmos.base.node.v1beta1.Service/Config",
    rpc: "/cosmos/base/node/v1beta1/config",
  );
  static const BaseNodeV1beta1Types nodeStatusRequest = BaseNodeV1beta1Types._(
    "/cosmos.base.node.v1beta1.StatusRequest",
    query: "/cosmos.base.node.v1beta1.Service/Status",
    rpc: "/cosmos/base/node/v1beta1/status",
  );
  static const BaseNodeV1beta1Types nodeConfigResponse = BaseNodeV1beta1Types._(
    "/cosmos.base.node.v1beta1.ConfigResponse",
  );
  static const BaseNodeV1beta1Types nodeStatusResponse = BaseNodeV1beta1Types._(
    "/cosmos.base.node.v1beta1.StatusResponse",
  );
}
