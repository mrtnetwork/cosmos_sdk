import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class BaseV1beta1Types extends TypeUrl {
  const BaseV1beta1Types._(super.typeUrl);
  static const BaseV1beta1Types coin =
      BaseV1beta1Types._("cosmos.base.v1beta1.Coin");
  static const BaseV1beta1Types decCoin =
      BaseV1beta1Types._("cosmos.base.v1beta1.DecCoin");
}
