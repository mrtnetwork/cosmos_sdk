class BaseReflectionV1beta1 {
  final String typeUrl;
  const BaseReflectionV1beta1._(this.typeUrl);
  static const BaseReflectionV1beta1 listAllInterfacesRequest =
      BaseReflectionV1beta1._(
          "/cosmos.base.reflection.v1beta1.ListAllInterfacesRequest");
  static const BaseReflectionV1beta1 listAllInterfacesResponse =
      BaseReflectionV1beta1._(
          "/cosmos.base.reflection.v1beta1.ListAllInterfacesResponse");
  static const BaseReflectionV1beta1 listImplementationsRequest =
      BaseReflectionV1beta1._(
          "/cosmos.base.reflection.v1beta1.ListImplementationsRequest");
  static const BaseReflectionV1beta1 listImplementationsResponse =
      BaseReflectionV1beta1._(
          "/cosmos.base.reflection.v1beta1.ListImplementationsResponse");

  /// queries
  static const BaseReflectionV1beta1 reflectionListAllInterfaces =
      BaseReflectionV1beta1._(
          "/cosmos.base.reflection.v1beta1.ReflectionService/ListAllInterfaces");
  static const BaseReflectionV1beta1 reflectionListImplementations =
      BaseReflectionV1beta1._(
          "/cosmos.base.reflection.v1beta1.ReflectionService/ListImplementations");
}
