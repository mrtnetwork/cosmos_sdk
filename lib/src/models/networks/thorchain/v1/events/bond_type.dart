import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainBondType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const ThorchainBondType._(this.value, this.name);
  static const ThorchainBondType bondPaid = ThorchainBondType._(0, "bondPaid");
  static const ThorchainBondType bondReturned = ThorchainBondType._(
    1,
    "bondReturned",
  );
  static const ThorchainBondType bondReward = ThorchainBondType._(
    2,
    "bondReward",
  );
  static const ThorchainBondType bondCost = ThorchainBondType._(3, "bondCost");

  static const List<ThorchainBondType> values = [
    bondPaid,
    bondReturned,
    bondReward,
    bondCost,
  ];
  static ThorchainBondType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No ThorchainBondType element found for the given value.",
                details: {"value": value},
              ),
    );
  }
}
