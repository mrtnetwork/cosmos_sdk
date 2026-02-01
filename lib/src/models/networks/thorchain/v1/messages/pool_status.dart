import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainPoolStatus implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const ThorchainPoolStatus._(this.value, this.name);
  static const ThorchainPoolStatus unknownPoolStatus = ThorchainPoolStatus._(
    0,
    "UnknownPoolStatus",
  );
  static const ThorchainPoolStatus available = ThorchainPoolStatus._(
    1,
    "Available",
  );
  static const ThorchainPoolStatus staged = ThorchainPoolStatus._(2, "Staged");
  static const ThorchainPoolStatus suspended = ThorchainPoolStatus._(
    3,
    "Suspended",
  );
  static const List<ThorchainPoolStatus> values = [
    unknownPoolStatus,
    available,
    staged,
    suspended,
  ];
  static ThorchainPoolStatus fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No ThorchainPoolStatus element found for the given value.",
                details: {"value": value},
              ),
    );
  }
}
