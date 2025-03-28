import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class InjectiveTypes extends TypeUrl {
  const InjectiveTypes._(super.typeUrl);
  static const InjectiveTypes ethAccount =
      InjectiveTypes._("/injective.types.v1beta1.EthAccount");
}
