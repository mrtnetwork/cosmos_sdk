import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// CounterpartyInfo defines the key that the counterparty will use to message our client
class CounterpartyInfo extends CosmosProtoMessage {
  /// merkle prefix key is the prefix that ics provable keys are stored under
  final List<List<int>> merklePrefix;

  /// client identifier is the identifier used to send packet messages to our client
  final String? clientId;

  const CounterpartyInfo({this.merklePrefix = const [], this.clientId});

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
  Map<String, dynamic> toJson() {
    return {
      'merkle_prefix':
          merklePrefix
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'client_id': clientId,
    };
  }

  factory CounterpartyInfo.fromJson(Map<String, dynamic> json) {
    return CounterpartyInfo(
      merklePrefix:
          (json.valueEnsureAsList<dynamic>(
                'merkle_prefix',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
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
