import 'package:blockchain_utils/blockchain_utils.dart';

enum Downtime implements ProtoEnumVariant {
  duration30s(0, 'DURATION_30S'),
  duration1m(1, 'DURATION_1M'),
  duration2m(2, 'DURATION_2M'),
  duration3m(3, 'DURATION_3M'),
  duration4m(4, 'DURATION_4M'),
  duration5m(5, 'DURATION_5M'),
  duration10m(6, 'DURATION_10M'),
  duration20m(7, 'DURATION_20M'),
  duration30m(8, 'DURATION_30M'),
  duration40m(9, 'DURATION_40M'),
  duration50m(10, 'DURATION_50M'),
  duration1h(11, 'DURATION_1H'),
  duration15h(12, 'DURATION_1_5H'),
  duration2h(13, 'DURATION_2H'),
  duration25h(14, 'DURATION_2_5H'),
  duration3h(15, 'DURATION_3H'),
  duration4h(16, 'DURATION_4H'),
  duration5h(17, 'DURATION_5H'),
  duration6h(18, 'DURATION_6H'),
  duration9h(19, 'DURATION_9H'),
  duration12h(20, 'DURATION_12H'),
  duration18h(21, 'DURATION_18H'),
  duration24h(22, 'DURATION_24H'),
  duration36h(23, 'DURATION_36H'),
  duration48h(24, 'DURATION_48H');

  const Downtime(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static Downtime fromValue(int? value) {
    return Downtime.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "Downtime", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static Downtime from(Object? value) {
    return Downtime.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "Downtime", value: value),
    );
  }
}
