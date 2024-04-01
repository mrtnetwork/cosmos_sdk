// AuthorizationType defines the type of staking module authorization type
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

class AuthorizationType implements CosmosEnum {
  // AUTHORIZATION_TYPE_UNSPECIFIED specifies an unknown authorization type
  static const AuthorizationType authorizationTypeUnspecified =
      AuthorizationType._(0, "authorizationTypeUnspecified");

  // AUTHORIZATION_TYPE_DELEGATE defines an authorization type for Msg/Delegate
  static const AuthorizationType authorizationTypeDelegate =
      AuthorizationType._(1, "authorizationTypeDelegate");

  // AUTHORIZATION_TYPE_UNDELEGATE defines an authorization type for Msg/Undelegate
  static const AuthorizationType authorizationTypeUndelegate =
      AuthorizationType._(2, "authorizationTypeUndelegate");

  // AUTHORIZATION_TYPE_REDELEGATE defines an authorization type for Msg/BeginRedelegate
  static const AuthorizationType authorizationTypeRedelegate =
      AuthorizationType._(3, "authorizationTypeRedelegate");

  @override
  final int value;
  @override
  final String name;

  const AuthorizationType._(this.value, this.name);
}
