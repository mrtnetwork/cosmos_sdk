import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// StoreKVPair is a KVStore KVPair used for listening to state changes (Sets and Deletes)
/// It optionally includes the StoreKey for the originating KVStore and a Boolean flag to distinguish between Sets and
/// Deletes
class StoreKVPair extends CosmosProtoMessage {
  final String? storeKey;

  /// the store key for the KVStore this pair originates from
  final bool? delete;

  /// true indicates a delete operation, false indicates a set operation
  final BuBytes? key;

  final BuBytes? value;

  StoreKVPair({this.storeKey, this.delete, List<int>? key, List<int>? value})
    : key = key?.asImmutableBytes,
      value = value?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [storeKey, delete, key, value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'store_key': storeKey,
      'delete': delete,
      'key': config.encodeBinary(key),
      'value': config.encodeBinary(value),
    };
  }

  factory StoreKVPair.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StoreKVPair(
      storeKey: json.valueAsString<String?>(
        'store_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      delete: json.valueAsBool<bool?>(
        'delete',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      key: config.decodeBinary<List<int>?>(
        json.valueAs('key', normalizeKeyLookup: config.normalizeKeys),
      ),
      value: config.decodeBinary<List<int>?>(
        json.valueAs('value', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory StoreKVPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StoreKVPair(
      storeKey: decode.getString<String?>(1),
      delete: decode.getBool<bool?>(2),
      key: decode.getBytes<List<int>?>(3),
      value: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosStoreV1beta1StoreKVPair;
}
