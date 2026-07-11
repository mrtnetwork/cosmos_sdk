import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAccountResponse> {
  final String? address;

  final String? height;

  const QueryAccountRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/auth/accounts/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, height];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'height': height};
  }

  factory QueryAccountRequest.fromJson(Map<String, dynamic> json) {
    return QueryAccountRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryAccountRequest;
  @override
  QueryAccountResponse onQueryResponse(List<int> bytes) {
    return QueryAccountResponse.deserialize(bytes);
  }

  @override
  QueryAccountResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAccountResponse.fromJson(json);
  }
}

class QueryAccountResponse extends CosmosProtoMessage {
  final String? address;

  final String? pubKey;

  final String? accountNumber;

  final String? sequence;

  const QueryAccountResponse({
    this.address,
    this.pubKey,
    this.accountNumber,
    this.sequence,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, pubKey, accountNumber, sequence];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'pub_key': pubKey,
      'account_number': accountNumber,
      'sequence': sequence,
    };
  }

  factory QueryAccountResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      pubKey: json.valueAsString<String?>('pub_key', acceptCamelCase: true),
      accountNumber: json.valueAsString<String?>(
        'account_number',
        acceptCamelCase: true,
      ),
      sequence: json.valueAsString<String?>('sequence', acceptCamelCase: true),
    );
  }

  factory QueryAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountResponse(
      address: decode.getString<String?>(1),
      pubKey: decode.getString<String?>(2),
      accountNumber: decode.getString<String?>(3),
      sequence: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryAccountResponse;
}
