import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/provider/thornode/exception/exception.dart';
import 'package:cosmos_sdk/sdk/serialization/src/identifier.dart';

abstract class BaseDartCosmosSdkPluginException extends IException {
  const BaseDartCosmosSdkPluginException(super.message, {super.details});
  @override
  CosmosSerializationIdentifiers get serializationIdentifier;
  factory BaseDartCosmosSdkPluginException.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValueWithInfo(
      expectedTags: CosmosSerializationIdentifiers.values,
      cborBytes: bytes,
      cborObject: obj,
    );
    final type = values.identifier;
    return switch (type) {
      CosmosSerializationIdentifiers.cosmosPluginError =>
        DartCosmosSdkPluginException.deserialize(obj: values.tag),
      CosmosSerializationIdentifiers.aminoJsonParserError =>
        AminoJsonParserException.deserialize(obj: values.tag),
      CosmosSerializationIdentifiers.thorNodeApiException =>
        ThorNodeApiException.deserialize(obj: values.tag),
      CosmosSerializationIdentifiers.defaultTag =>
        throw CborSerializableException.incorrectTagValue(tag: [type.id]),
    };
  }

  @override
  BlockchainNetwork get relatedNetwork => BlockchainNetwork.cosmosAndRelated;
}

class DartCosmosSdkPluginException extends BaseDartCosmosSdkPluginException {
  const DartCosmosSdkPluginException(super.message, {super.details});

  factory DartCosmosSdkPluginException.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.cosmosPluginError,
      cborBytes: bytes,
      cborObject: obj,
    );
    return DartCosmosSdkPluginException(
      values.rawValueAt(0),
      details: values.maybeRawMapAt<String, String?>(1),
    );
  }

  @override
  CosmosSerializationIdentifiers get serializationIdentifier =>
      CosmosSerializationIdentifiers.cosmosPluginError;
}

class AminoJsonParserException extends BaseDartCosmosSdkPluginException {
  const AminoJsonParserException(super.message, {super.details});

  factory AminoJsonParserException.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: CosmosSerializationIdentifiers.aminoJsonParserError,
      cborBytes: bytes,
      cborObject: obj,
    );
    return AminoJsonParserException(
      values.rawValueAt(0),
      details: values.maybeRawMapAt<String, String?>(1),
    );
  }

  @override
  CosmosSerializationIdentifiers get serializationIdentifier =>
      CosmosSerializationIdentifiers.aminoJsonParserError;
}
