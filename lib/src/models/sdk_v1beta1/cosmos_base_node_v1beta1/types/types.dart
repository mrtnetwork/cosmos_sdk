class BaseNodeV1beta1Types {
  final String typeUrl;
  const BaseNodeV1beta1Types._(this.typeUrl);
  static const BaseNodeV1beta1Types nodeConfigRequest =
      BaseNodeV1beta1Types._("/cosmos.base.node.v1beta1.ConfigRequest");
  static const BaseNodeV1beta1Types nodeStatusRequest =
      BaseNodeV1beta1Types._("/cosmos.base.node.v1beta1.StatusRequest");
  static const BaseNodeV1beta1Types nodeConfigResponse =
      BaseNodeV1beta1Types._("/cosmos.base.node.v1beta1.ConfigResponse");
  static const BaseNodeV1beta1Types nodeStatusResponse =
      BaseNodeV1beta1Types._("/cosmos.base.node.v1beta1.StatusResponse");

  /// queries
  static const BaseNodeV1beta1Types nodeConfig =
      BaseNodeV1beta1Types._("/cosmos.base.node.v1beta1.Service/Config");
  static const BaseNodeV1beta1Types nodeStatus =
      BaseNodeV1beta1Types._("/cosmos.base.node.v1beta1.Service/Status");
}
