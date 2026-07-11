import 'package:blockchain_utils/cbor/serialization/cbor/tag.dart';
import 'package:blockchain_utils/exception/exceptions.dart';

enum CosmosSerializationIdentifiers implements SerializationIdentifier {
  cosmosPluginError(19001),
  aminoJsonParserError(19002),
  thorNodeApiException(19003),
  defaultTag(19004);

  @override
  final int id;
  const CosmosSerializationIdentifiers(this.id);

  static CosmosSerializationIdentifiers fromIdentifier(int? value) {
    return values.firstWhere(
      (e) => e.id == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "CosmosSerializationIdentifiers",
              ),
    );
  }

  @override
  bool isValid(int? tag) {
    return tag == id;
  }
}
