import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class BanVoter extends CosmosProtoMessage {
  final List<int>? nodeAddress;

  final BigInt? blockHeight;

  final List<String> signers;

  const BanVoter({this.nodeAddress, this.blockHeight, this.signers = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1, options: const []),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nodeAddress, blockHeight, signers];

  @override
  Map<String, dynamic> toJson() {
    return {
      'node_address': switch (nodeAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'block_height': blockHeight?.toString(),
      'signers': signers.map((e) => e).toList(),
    };
  }

  factory BanVoter.fromJson(Map<String, dynamic> json) {
    return BanVoter(
      nodeAddress: json.valueAsBytes<List<int>?>(
        'node_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      signers:
          (json.valueEnsureAsList<dynamic>(
            'signers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory BanVoter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BanVoter(
      nodeAddress: decode.getBytes<List<int>?>(1),
      blockHeight: decode.getBigInt<BigInt?>(2),
      signers: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBanVoter;
}
