import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainOrderType implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const ThorchainOrderType._(this.name, this.value);
  static const ThorchainOrderType market = ThorchainOrderType._("market", 0);
  static const ThorchainOrderType limit = ThorchainOrderType._("limit", 1);
  static const List<ThorchainOrderType> values = [market, limit];
  static ThorchainOrderType fromValue(Object? value) {
    return values.firstWhere(
      (e) => e.value == value || e.name == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No ThorchainOrderType element found for the given value.",
          details: {"value": value}),
    );
  }
}
