import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

class Ics23LengthOp implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const Ics23LengthOp._(this.name, this.value);

  /// NO_PREFIX don't include any length info
  static const Ics23LengthOp noPrefix = Ics23LengthOp._("NO_PREFIX", 0);

  /// VAR_PROTO uses protobuf (and go-amino) varint encoding of the length
  static const Ics23LengthOp varProto = Ics23LengthOp._("VAR_PROTO", 1);

  /// VAR_RLP uses rlp int encoding of the length
  static const Ics23LengthOp varRlp = Ics23LengthOp._("VAR_RLP", 2);

  /// FIXED32_BIG uses big-endian encoding of the length as a 32 bit integer
  static const Ics23LengthOp fixed32Big = Ics23LengthOp._("FIXED32_BIG", 3);

  /// FIXED32_LITTLE uses little-endian encoding of the length as a 32 bit integer
  static const Ics23LengthOp fixed32Little =
      Ics23LengthOp._("FIXED32_LITTLE", 4);

  /// FIXED64_BIG uses big-endian encoding of the length as a 64 bit integer
  static const Ics23LengthOp fixed64Big = Ics23LengthOp._("FIXED64_BIG", 5);

  /// FIXED64_LITTLE uses little-endian encoding of the length as a 64 bit integer
  static const Ics23LengthOp fixed64Little =
      Ics23LengthOp._("FIXED64_LITTLE", 6);

  /// REQUIRE_32_BYTES is like NONE, but will fail if the input is not exactly 32 bytes (sha256 output)
  static const Ics23LengthOp require32Bytes =
      Ics23LengthOp._("REQUIRE_32_BYTES", 7);

  /// REQUIRE_64_BYTES is like NONE, but will fail if the input is not exactly 64 bytes (sha512 output)
  static const Ics23LengthOp require64Bytes =
      Ics23LengthOp._("REQUIRE_64_BYTES", 8);
  static const List<Ics23LengthOp> values = [
    noPrefix,
    varProto,
    varRlp,
    fixed32Big,
    fixed32Little,
    fixed64Big,
    fixed64Little,
    require32Bytes,
    require64Bytes
  ];
  static Ics23LengthOp fromValue(int? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => throw DartCosmosSdkPluginException(
          "No matching element found for the given value.",
          details: {"value": value}),
    );
  }
}
