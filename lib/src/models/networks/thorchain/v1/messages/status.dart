import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainStatus implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const ThorchainStatus._(this.name, this.value);
  static const ThorchainStatus incomplete = ThorchainStatus._("incomplete", 0);
  static const ThorchainStatus done = ThorchainStatus._("done", 1);
  static const ThorchainStatus reverted = ThorchainStatus._("reverted", 2);
  static const List<ThorchainStatus> values = [incomplete, done, reverted];

  static ThorchainStatus fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No ThorchainStatus element found for the given value.",
                details: {"value": value},
              ),
    );
  }
}
