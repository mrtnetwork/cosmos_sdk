import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class BaseQueryV1beta1Types extends TypeUrl {
  const BaseQueryV1beta1Types._(super.typeUrl);
  static const BaseQueryV1beta1Types pageRequest =
      BaseQueryV1beta1Types._("/cosmos.base.query.v1beta1.PageRequest");
  static const BaseQueryV1beta1Types pageResponse =
      BaseQueryV1beta1Types._("/cosmos.base.query.v1beta1.PageResponse");
}
