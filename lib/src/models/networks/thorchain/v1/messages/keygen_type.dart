import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainKeygenType implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const ThorchainKeygenType._(this.name, this.value);
  static const ThorchainKeygenType unknownKeygen =
      ThorchainKeygenType._("UnknownKeygen", 0);
  static const ThorchainKeygenType asgardKeygen =
      ThorchainKeygenType._("AsgardKeygen", 1);
  static const ThorchainKeygenType yggdrasilKeygen =
      ThorchainKeygenType._("YggdrasilKeygen", 2);
  static List<ThorchainKeygenType> values = [
    unknownKeygen,
    asgardKeygen,
    yggdrasilKeygen
  ];

  static ThorchainKeygenType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No ThorchainKeygenType element found for the given value.",
          details: {"value": value}),
    );
  }
}
