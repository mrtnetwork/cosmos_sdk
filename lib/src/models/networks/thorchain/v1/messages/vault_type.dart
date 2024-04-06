import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainVaultType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const ThorchainVaultType._(this.value, this.name);
  static const ThorchainVaultType unknownVault =
      ThorchainVaultType._(0, "UnknownVault");
  static const ThorchainVaultType asgardVault =
      ThorchainVaultType._(1, "AsgardVault");
  static const ThorchainVaultType yggdrasilVault =
      ThorchainVaultType._(2, "YggdrasilVault");
  static const List<ThorchainVaultType> values = [
    unknownVault,
    asgardVault,
    yggdrasilVault
  ];
  static ThorchainVaultType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No ThorchainVaultType element found for the given value.",
          details: {"value": value}),
    );
  }
}
