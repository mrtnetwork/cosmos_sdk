import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// CounterpartyInfo defines the key that the counterparty will use to message our client
class CounterpartyInfo extends CosmosProtoMessage {
  /// merkle prefix key is the prefix that ics provable keys are stored under
  final List<BuBytes> merklePrefix;

  /// client identifier is the identifier used to send packet messages to our client
  final String? clientId;

  CounterpartyInfo({List<List<int>> merklePrefix = const [], this.clientId})
    : merklePrefix = merklePrefix.map((e) => e.asImmutableBytes).toImutableList;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [merklePrefix, clientId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'merkle_prefix': merklePrefix.map((e) => config.encodeBinary(e)).toList(),
      'client_id': clientId,
    };
  }

  factory CounterpartyInfo.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CounterpartyInfo(
      merklePrefix:
          (json.valueEnsureAsList<dynamic>(
            'merkle_prefix',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => config.decodeBinary<List<int>>(e)).toList(),
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory CounterpartyInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CounterpartyInfo(
      merklePrefix: decode.getListOfBytes(1),
      clientId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2CounterpartyInfo;
}
