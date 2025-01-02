import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainVaultStatus implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const ThorchainVaultStatus._(this.value, this.name);
  static const ThorchainVaultStatus inactiveVault =
      ThorchainVaultStatus._(0, "InactiveVault");
  static const ThorchainVaultStatus activeVault =
      ThorchainVaultStatus._(1, "ActiveVault");
  static const ThorchainVaultStatus retiringVault =
      ThorchainVaultStatus._(2, "RetiringVault");
  static const ThorchainVaultStatus initVault =
      ThorchainVaultStatus._(3, "InitVault");
  static const List<ThorchainVaultStatus> values = [
    inactiveVault,
    activeVault,
    retiringVault,
    initVault
  ];
  static ThorchainVaultStatus fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No ThorchainVaultStatus element found for the given value.",
          details: {"value": value}),
    );
  }
}
