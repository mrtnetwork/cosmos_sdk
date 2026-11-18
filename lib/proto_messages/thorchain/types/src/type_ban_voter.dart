import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class BanVoter extends CosmosProtoMessage {
  final BuBytes? nodeAddress;

  final BigInt? blockHeight;

  final List<String> signers;

  BanVoter({List<int>? nodeAddress, this.blockHeight, this.signers = const []})
    : nodeAddress = nodeAddress?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'node_address': config.encodeBinary(nodeAddress),
      'block_height': config.encodeBigint(blockHeight),
      'signers': signers.map((e) => e).toList(),
    };
  }

  factory BanVoter.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BanVoter(
      nodeAddress: config.decodeBinary<List<int>?>(
        json.valueAs('node_address', normalizeKeyLookup: config.normalizeKeys),
      ),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signers:
          (json.valueEnsureAsList<dynamic>(
            'signers',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
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
