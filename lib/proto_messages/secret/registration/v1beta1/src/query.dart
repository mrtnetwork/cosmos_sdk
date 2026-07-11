import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryEncryptedSeedRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEncryptedSeedResponse> {
  final List<int>? pubKey;

  const QueryEncryptedSeedRequest({this.pubKey});

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
  Map<String, dynamic> toJson() {
    return {
      'pub_key': switch (pubKey) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryEncryptedSeedRequest.fromJson(Map<String, dynamic> json) {
    return QueryEncryptedSeedRequest(
      pubKey: json.valueAsBytes<List<int>?>(
        'pub_key',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? encryptedSeed;

  const QueryEncryptedSeedResponse({this.encryptedSeed});

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
  Map<String, dynamic> toJson() {
    return {
      'encrypted_seed': switch (encryptedSeed) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryEncryptedSeedResponse.fromJson(Map<String, dynamic> json) {
    return QueryEncryptedSeedResponse(
      encryptedSeed: json.valueAsBytes<List<int>?>(
        'encrypted_seed',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
