import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryEncryptedSeedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEncryptedSeedResponse> {
  final BuBytes? pubKey;

  QueryEncryptedSeedRequest({List<int>? pubKey})
    : pubKey = pubKey?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/registration/v1beta1/encrypted-seed/{pub_key}",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pubKey];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pub_key': config.encodeBinary(pubKey)};
  }

  factory QueryEncryptedSeedRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEncryptedSeedRequest(
      pubKey: config.decodeBinary<List<int>?>(
        json.valueAs('pub_key', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryEncryptedSeedRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEncryptedSeedRequest(pubKey: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretRegistrationV1beta1QueryEncryptedSeedRequest;
  @override
  QueryEncryptedSeedResponse onQueryResponse(List<int> bytes) {
    return QueryEncryptedSeedResponse.deserialize(bytes);
  }

  @override
  QueryEncryptedSeedResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryEncryptedSeedResponse.fromJson(json);
  }
}

class QueryEncryptedSeedResponse extends CosmosProtoMessage {
  final BuBytes? encryptedSeed;

  QueryEncryptedSeedResponse({List<int>? encryptedSeed})
    : encryptedSeed = encryptedSeed?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [encryptedSeed];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'encrypted_seed': config.encodeBinary(encryptedSeed)};
  }

  factory QueryEncryptedSeedResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEncryptedSeedResponse(
      encryptedSeed: config.decodeBinary<List<int>?>(
        json.valueAs(
          'encrypted_seed',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory QueryEncryptedSeedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEncryptedSeedResponse(
      encryptedSeed: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretRegistrationV1beta1QueryEncryptedSeedResponse;
}
