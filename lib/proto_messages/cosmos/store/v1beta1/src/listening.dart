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
  final List<int>? key;

  final List<int>? value;

  const StoreKVPair({this.storeKey, this.delete, this.key, this.value});

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
  Map<String, dynamic> toJson() {
    return {
      'store_key': storeKey,
      'delete': delete,
      'key': switch (key) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'value': switch (value) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory StoreKVPair.fromJson(Map<String, dynamic> json) {
    return StoreKVPair(
      storeKey: json.valueAsString<String?>('store_key', acceptCamelCase: true),
      delete: json.valueAsBool<bool?>('delete', acceptCamelCase: true),
      key: json.valueAsBytes<List<int>?>(
        'key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      value: json.valueAsBytes<List<int>?>(
        'value',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
