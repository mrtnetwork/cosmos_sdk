import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisMetadata defines the genesis type for metadata that will be used to export all client store keys
/// that are not client or consensus states.
class IbcClientGenesisMetadata extends CosmosMessage {
  /// store key of metadata without clientID-prefix
  final List<int>? key;

  /// metadata value
  final List<int>? value;
  IbcClientGenesisMetadata({List<int>? key, List<int>? value})
      : key = BytesUtils.tryToBytes(key, unmodifiable: true),
        value = BytesUtils.tryToBytes(value, unmodifiable: true);
  factory IbcClientGenesisMetadata.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientGenesisMetadata(
        key: decode.getField(1), value: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "key": BytesUtils.tryToHexString(key),
      "value": BytesUtils.tryToHexString(value)
    };
  }

  @override
  String get typeUrl => IbcTypes.genesisMetadata.typeUrl;

  @override
  List get values => [key, value];
}
