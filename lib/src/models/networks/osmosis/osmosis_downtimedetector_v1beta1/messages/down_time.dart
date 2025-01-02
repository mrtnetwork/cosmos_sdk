import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisDowntimeDetectorDowntime implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const OsmosisDowntimeDetectorDowntime._(this.name, this.value);

  static const OsmosisDowntimeDetectorDowntime duration30S =
      OsmosisDowntimeDetectorDowntime._("DURATION_30S", 0);
  static const OsmosisDowntimeDetectorDowntime duration1M =
      OsmosisDowntimeDetectorDowntime._("DURATION_1M", 1);
  static const OsmosisDowntimeDetectorDowntime duration2M =
      OsmosisDowntimeDetectorDowntime._("DURATION_2M", 2);
  static const OsmosisDowntimeDetectorDowntime duration3M =
      OsmosisDowntimeDetectorDowntime._("DURATION_3M", 3);
  static const OsmosisDowntimeDetectorDowntime duration4M =
      OsmosisDowntimeDetectorDowntime._("DURATION_4M", 4);
  static const OsmosisDowntimeDetectorDowntime duration5M =
      OsmosisDowntimeDetectorDowntime._("DURATION_5M", 5);
  static const OsmosisDowntimeDetectorDowntime duration10M =
      OsmosisDowntimeDetectorDowntime._("DURATION_10M", 6);
  static const OsmosisDowntimeDetectorDowntime duration20M =
      OsmosisDowntimeDetectorDowntime._("DURATION_20M", 7);
  static const OsmosisDowntimeDetectorDowntime duration30M =
      OsmosisDowntimeDetectorDowntime._("DURATION_30M", 8);
  static const OsmosisDowntimeDetectorDowntime duration40M =
      OsmosisDowntimeDetectorDowntime._("DURATION_40M", 9);
  static const OsmosisDowntimeDetectorDowntime duration50M =
      OsmosisDowntimeDetectorDowntime._("DURATION_50M", 10);
  static const OsmosisDowntimeDetectorDowntime duration1H =
      OsmosisDowntimeDetectorDowntime._("DURATION_1H", 11);
  static const OsmosisDowntimeDetectorDowntime duration1_5H =
      OsmosisDowntimeDetectorDowntime._("DURATION_1_5H", 12);
  static const OsmosisDowntimeDetectorDowntime duration2H =
      OsmosisDowntimeDetectorDowntime._("DURATION_2H", 13);
  static const OsmosisDowntimeDetectorDowntime duration2_5H =
      OsmosisDowntimeDetectorDowntime._("DURATION_2_5H", 14);
  static const OsmosisDowntimeDetectorDowntime duration3H =
      OsmosisDowntimeDetectorDowntime._("DURATION_3H", 15);
  static const OsmosisDowntimeDetectorDowntime duration4H =
      OsmosisDowntimeDetectorDowntime._("DURATION_4H", 16);
  static const OsmosisDowntimeDetectorDowntime duration5H =
      OsmosisDowntimeDetectorDowntime._("DURATION_5H", 17);
  static const OsmosisDowntimeDetectorDowntime duration6H =
      OsmosisDowntimeDetectorDowntime._("DURATION_6H", 18);
  static const OsmosisDowntimeDetectorDowntime duration9H =
      OsmosisDowntimeDetectorDowntime._("DURATION_9H", 19);
  static const OsmosisDowntimeDetectorDowntime duration12H =
      OsmosisDowntimeDetectorDowntime._("DURATION_12H", 20);
  static const OsmosisDowntimeDetectorDowntime duration18H =
      OsmosisDowntimeDetectorDowntime._("DURATION_18H", 21);
  static const OsmosisDowntimeDetectorDowntime duration24H =
      OsmosisDowntimeDetectorDowntime._("DURATION_24H", 22);
  static const OsmosisDowntimeDetectorDowntime duration36H =
      OsmosisDowntimeDetectorDowntime._("DURATION_36H", 23);
  static const OsmosisDowntimeDetectorDowntime duration48H =
      OsmosisDowntimeDetectorDowntime._("DURATION_48H", 24);
  static const List<OsmosisDowntimeDetectorDowntime> values = [
    OsmosisDowntimeDetectorDowntime.duration30S,
    OsmosisDowntimeDetectorDowntime.duration1M,
    OsmosisDowntimeDetectorDowntime.duration2M,
    OsmosisDowntimeDetectorDowntime.duration3M,
    OsmosisDowntimeDetectorDowntime.duration4M,
    OsmosisDowntimeDetectorDowntime.duration5M,
    OsmosisDowntimeDetectorDowntime.duration10M,
    OsmosisDowntimeDetectorDowntime.duration20M,
    OsmosisDowntimeDetectorDowntime.duration30M,
    OsmosisDowntimeDetectorDowntime.duration40M,
    OsmosisDowntimeDetectorDowntime.duration50M,
    OsmosisDowntimeDetectorDowntime.duration1H,
    OsmosisDowntimeDetectorDowntime.duration1_5H,
    OsmosisDowntimeDetectorDowntime.duration2H,
    OsmosisDowntimeDetectorDowntime.duration2_5H,
    OsmosisDowntimeDetectorDowntime.duration3H,
    OsmosisDowntimeDetectorDowntime.duration4H,
    OsmosisDowntimeDetectorDowntime.duration5H,
    OsmosisDowntimeDetectorDowntime.duration6H,
    OsmosisDowntimeDetectorDowntime.duration9H,
    OsmosisDowntimeDetectorDowntime.duration12H,
    OsmosisDowntimeDetectorDowntime.duration18H,
    OsmosisDowntimeDetectorDowntime.duration24H,
    OsmosisDowntimeDetectorDowntime.duration36H,
    OsmosisDowntimeDetectorDowntime.duration48H,
  ];
  static OsmosisDowntimeDetectorDowntime fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No OsmosisDowntimeDetectorDowntime element found for the given value.",
          details: {"value": value}),
    );
  }

  static OsmosisDowntimeDetectorDowntime fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw DartCosmosSdkPluginException(
          "No OsmosisDowntimeDetectorDowntime element found for the given name.",
          details: {"name": name}),
    );
  }
}
