import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisLockupLockQueryType implements CosmosEnum {
  static const OsmosisLockupLockQueryType byDuration =
      OsmosisLockupLockQueryType._(0, "ByDuration");
  static const OsmosisLockupLockQueryType byTime =
      OsmosisLockupLockQueryType._(1, "ByTime");

  @override
  final int value;
  @override
  final String name;

  const OsmosisLockupLockQueryType._(this.value, this.name);
  static const List<OsmosisLockupLockQueryType> values = [byDuration, byTime];

  static OsmosisLockupLockQueryType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No OsmosisLockupLockQueryType element found for the given value.",
          details: {"value": value}),
    );
  }

  static OsmosisLockupLockQueryType fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw DartCosmosSdkPluginException(
          "No OsmosisLockupLockQueryType element found for the given name.",
          details: {"value": name}),
    );
  }
}
