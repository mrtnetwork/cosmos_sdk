import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainNodeStatus implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const ThorchainNodeStatus._(this.value, this.name);
  static const ThorchainNodeStatus unknown =
      ThorchainNodeStatus._(0, "Unknown");
  static const ThorchainNodeStatus whitelisted =
      ThorchainNodeStatus._(1, "Whitelisted");
  static const ThorchainNodeStatus standby =
      ThorchainNodeStatus._(2, "Standby");
  static const ThorchainNodeStatus ready = ThorchainNodeStatus._(3, "Ready");
  static const ThorchainNodeStatus active = ThorchainNodeStatus._(4, "Active");
  static const ThorchainNodeStatus disabled =
      ThorchainNodeStatus._(5, "Disabled");
  static const List<ThorchainNodeStatus> values = [
    unknown,
    whitelisted,
    standby,
    ready,
    active,
    disabled
  ];
  static ThorchainNodeStatus fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No ThorchainNodeStatus element found for the given value.",
          details: {"value": value}),
    );
  }
}
