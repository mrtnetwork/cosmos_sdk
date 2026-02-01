import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainPendingLiquidityType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const ThorchainPendingLiquidityType._(this.value, this.name);
  static const ThorchainPendingLiquidityType add =
      ThorchainPendingLiquidityType._(0, "add");
  static const ThorchainPendingLiquidityType withdraw =
      ThorchainPendingLiquidityType._(1, "withdraw");
  static const List<ThorchainPendingLiquidityType> values = [add, withdraw];
  static ThorchainPendingLiquidityType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No ThorchainPendingLiquidityType element found for the given value.",
                details: {"value": value},
              ),
    );
  }
}
