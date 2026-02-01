import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class BaseReflectionV1beta1 extends TypeUrl {
  const BaseReflectionV1beta1._(super.typeUrl, {super.query, super.rpc});
  static const BaseReflectionV1beta1
  listAllInterfacesRequest = BaseReflectionV1beta1._(
    "/cosmos.base.reflection.v1beta1.ListAllInterfacesRequest",
    query:
        "/cosmos.base.reflection.v1beta1.ReflectionService/ListAllInterfaces",
    rpc: "/cosmos/base/reflection/v1beta1/interfaces",
  );
  static const BaseReflectionV1beta1 listAllInterfacesResponse =
      BaseReflectionV1beta1._(
        "/cosmos.base.reflection.v1beta1.ListAllInterfacesResponse",
      );
  static const BaseReflectionV1beta1
  listImplementationsRequest = BaseReflectionV1beta1._(
    "/cosmos.base.reflection.v1beta1.ListImplementationsRequest",
    query:
        "/cosmos.base.reflection.v1beta1.ReflectionService/ListImplementations",
    rpc:
        "/cosmos/base/reflection/v1beta1/interfaces/:interface_name/implementations",
  );
  static const BaseReflectionV1beta1 listImplementationsResponse =
      BaseReflectionV1beta1._(
        "/cosmos.base.reflection.v1beta1.ListImplementationsResponse",
      );
}
