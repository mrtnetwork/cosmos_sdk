import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'denom_unit.dart';

/// Metadata represents a struct that describes a basic token.
class Metadata extends CosmosMessage {
  final String description;

  /// denom_units represents the list of DenomUnit's for a given coin
  final List<DenomUnit> denomUnits;

  /// base represents the base denom (should be the DenomUnit with exponent = 0).
  final String base;

  /// display indicates the suggested denom that should be
  /// displayed in clients.
  final String display;

  /// name defines the name of the token (eg: Cosmos Atom)
  ///
  /// Since: cosmos-sdk 0.43
  final String name;

  /// symbol is the token symbol usually shown on exchanges (eg: ATOM). This can
  /// be the same as the display.
  ///
  /// Since: cosmos-sdk 0.43
  final String symbol;

  /// URI to a document (on or off-chain) that contains additional information. Optional.
  ///
  /// Since: cosmos-sdk 0.46
  final String? uri;

  /// URIHash is a sha256 hash of a document pointed by URI. It's used to verify that
  /// the document didn't change. Optional.
  ///
  /// Since: cosmos-sdk 0.46
  final String? uriHash;
  const Metadata(
      {required this.description,
      required this.denomUnits,
      required this.base,
      required this.display,
      required this.name,
      required this.symbol,
      this.uri,
      this.uriHash});
  factory Metadata.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Metadata(
        description: decode.getField(1),
        denomUnits: decode
            .getFileds<List<int>>(2)
            .map((e) => DenomUnit.deserialize(e))
            .toList(),
        base: decode.getField(3),
        display: decode.getField(4),
        name: decode.getField(5),
        symbol: decode.getField(6),
        uri: decode.getField(7),
        uriHash: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "denom_units": denomUnits.map((e) => e.toJson()).toList(),
      "base": base,
      "display": display,
      "name": name,
      "symbol": symbol,
      "uri": uri,
      "uri_hash": uriHash
    };
  }

  @override
  String get typeUrl => BankV1beta1Types.metadata.typeUrl;

  @override
  List get values =>
      [description, denomUnits, base, display, name, symbol, uri, uriHash];
}
