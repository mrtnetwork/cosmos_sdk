import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

class Ics23HashOp implements CosmosEnum {
  @override
  final String name;
  @override
  final int value;
  const Ics23HashOp._(this.name, this.value);

  /// NO_HASH is the default if no data passed. Note this is an illegal argument some places.
  static const Ics23HashOp noHash = Ics23HashOp._("NO_HASH", 0);
  static const Ics23HashOp sha256 = Ics23HashOp._("SHA256", 1);
  static const Ics23HashOp sha512 = Ics23HashOp._("SHA512", 2);
  static const Ics23HashOp keccak = Ics23HashOp._("KECCAK", 3);
  static const Ics23HashOp ripemd160 = Ics23HashOp._("RIPEMD160", 4);
  static const Ics23HashOp bitcoin = Ics23HashOp._("BITCOIN", 5);
  static const Ics23HashOp sha512256 = Ics23HashOp._("SHA512_256", 6);
  static const List<Ics23HashOp> values = [
    noHash,
    sha256,
    sha512,
    keccak,
    ripemd160,
    bitcoin,
    sha512256
  ];
  static Ics23HashOp fromValue(int? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => throw MessageException(
          "No matching element found for the given value.",
          details: {"value": value}),
    );
  }
}
