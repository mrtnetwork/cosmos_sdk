import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// DenomUnit represents a struct that describes a given denomination unit of the basic token.
class DenomUnit extends CosmosMessage {
  /// denom represents the string name of the given denom unit (e.g uatom).
  final String denom;

  /// exponent represents power of 10 exponent that one must
  /// raise the base_denom to in order to equal the given DenomUnit's denom
  /// 1 denom = 10^exponent base_denom
  /// (e.g. with a base_denom of uatom, one can create a DenomUnit of 'atom' with
  /// exponent = 6, thus: 1 atom = 10^6 uatom).
  final int? exponent;

  /// aliases is a list of string aliases for the given denom
  final List<String> aliases;
  const DenomUnit({required this.denom, this.exponent, required this.aliases});
  factory DenomUnit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DenomUnit(
        denom: decode.getField(1),
        exponent: decode.getField(2),
        aliases: decode.getFields<String>(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "exponent": exponent, "aliases": aliases};
  }

  @override
  String get typeUrl => BankV1beta1Types.denomUnit.typeUrl;

  @override
  List get values => [denom, exponent, aliases];
}
