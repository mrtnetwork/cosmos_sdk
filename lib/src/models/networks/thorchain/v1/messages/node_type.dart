import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainNodeType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const ThorchainNodeType._(this.value, this.name);
  static const ThorchainNodeType typeValidator = ThorchainNodeType._(
    0,
    "TypeValidator",
  );
  static const ThorchainNodeType typeVault = ThorchainNodeType._(
    1,
    "TypeVault",
  );
  static const ThorchainNodeType typeUnknown = ThorchainNodeType._(
    2,
    "TypeUnknown",
  );

  static const List<ThorchainNodeType> values = [
    typeValidator,
    typeVault,
    typeUnknown,
  ];
  static ThorchainNodeType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No ThorchainNodeType element found for the given value.",
                details: {"value": value},
              ),
    );
  }
}
