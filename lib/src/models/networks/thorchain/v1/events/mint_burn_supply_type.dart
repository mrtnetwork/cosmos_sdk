import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMintBurnSupplyType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const ThorchainMintBurnSupplyType._(this.value, this.name);
  static const ThorchainMintBurnSupplyType mint =
      ThorchainMintBurnSupplyType._(0, "mint");
  static const ThorchainMintBurnSupplyType burn =
      ThorchainMintBurnSupplyType._(1, "burn");
  static const List<ThorchainMintBurnSupplyType> values = [mint, burn];
  static ThorchainMintBurnSupplyType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No ThorchainMintBurnSupplyType element found for the given value.",
          details: {"value": value}),
    );
  }
}
