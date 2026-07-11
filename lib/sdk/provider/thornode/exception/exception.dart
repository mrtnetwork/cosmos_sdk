import 'package:blockchain_utils/cbor/cbor.dart';
import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/sdk/serialization/src/identifier.dart';

class ThorNodeApiException extends BaseDartCosmosSdkPluginException {
  const ThorNodeApiException(super.message, {super.details});
  factory ThorNodeApiException.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.thorNodeApiException,
      cborBytes: bytes,
      cborObject: obj,
    );
    return ThorNodeApiException(
      values.rawValueAt(0),
      details: values.maybeRawMapAt<String, String?>(1),
    );
  }

  @override
  CosmosSerializationIdentifiers get serializationIdentifier =>
      CosmosSerializationIdentifiers.thorNodeApiException;
}
