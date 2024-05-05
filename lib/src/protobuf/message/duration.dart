import 'package:cosmos_sdk/src/constant/constant.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';

/// https://buf.build/protocolbuffers/wellknowntypes/docs/657250e6a39648cbb169d079a60bd9ba:google.protobuf#google.protobuf.Duration
class ProtobufDuration extends CosmosProtocolBuffer {
  /// Signed seconds of the span of time. Must be from -315,576,000,000
  /// to +315,576,000,000 inclusive. Note: these bounds are computed from:
  /// 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
  final BigInt seconds;

  /// Signed fractions of a second at nanosecond resolution of the span
  /// of time. Durations less than one second are represented with a 0
  /// `seconds` field and a positive or negative `nanos` field. For durations
  /// of one second or more, a non-zero value for the `nanos` field must be
  /// of the same sign as the `seconds` field. Must be from -999,999,999
  /// to +999,999,999 inclusive.
  final int? nanos;
  const ProtobufDuration({required this.seconds, this.nanos});
  factory ProtobufDuration.fromDuration(Duration duration) {
    final BigInt seconds = BigInt.from(duration.inSeconds);
    final int nanos = duration.inMilliseconds.remainder(1000) * 1000000;
    return ProtobufDuration(seconds: seconds, nanos: nanos);
  }
  factory ProtobufDuration.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ProtobufDuration(
        seconds: decode.getField(1), nanos: decode.getField(2));
  }
  factory ProtobufDuration.fromString(String duration) {
    final match = CosmosConstants.strDurationRegExp.firstMatch(duration);

    if (match != null) {
      BigInt seconds = BigInt.parse(match.group(1)!);
      int nanos = int.parse(match.group(2) ?? '0');
      return ProtobufDuration(seconds: seconds, nanos: nanos);
    } else {
      throw FormatException('Invalid duration format');
    }
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"seconds": seconds, "nanos": nanos};
  }

  @override
  List get values => [seconds, nanos];
}
