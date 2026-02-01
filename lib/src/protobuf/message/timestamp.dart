import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';

/// https://buf.build/protocolbuffers/wellknowntypes/docs/657250e6a39648cbb169d079a60bd9ba:google.protobuf#google.protobuf.Timestamp
class ProtobufTimestamp extends CosmosProtocolBuffer {
  /// Represents seconds of UTC time since Unix epoch
  /// 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to
  /// 9999-12-31T23:59:59Z inclusive.
  final BigInt seconds;

  /// Non-negative fractions of a second at nanosecond resolution. Negative
  /// second values with fractions must still have non-negative nanos values
  /// that count forward in time. Must be from 0 to 999,999,999
  /// inclusive.
  final BigInt? nanos;
  const ProtobufTimestamp({required this.seconds, required this.nanos});
  factory ProtobufTimestamp.fromDateTime(DateTime time) {
    final BigInt seconds = BigInt.from(time.millisecondsSinceEpoch ~/ 1000);
    final int nanos = (time.millisecondsSinceEpoch % 1000) * 1000000;
    return ProtobufTimestamp(seconds: seconds, nanos: BigInt.from(nanos));
  }
  factory ProtobufTimestamp.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ProtobufTimestamp(
      seconds: BigintUtils.parse(decode.getField(1)),
      nanos: BigintUtils.tryParse(decode.getField(2)),
    );
  }
  factory ProtobufTimestamp.fromString(String time) {
    final parse = DateTime.parse(time);
    return ProtobufTimestamp.fromDateTime(parse);
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"seconds": seconds, "nanos": nanos};
  }

  @override
  String toString() {
    if (nanos != null) {
      return DateTime.fromMicrosecondsSinceEpoch(
        nanos!.toInt(),
      ).toIso8601String();
    }
    return DateTime.fromMillisecondsSinceEpoch(
      (seconds.toInt() * 1000),
    ).toIso8601String();
  }

  @override
  List get values => [seconds, nanos];
}
