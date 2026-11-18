import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgSend extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final BuBytes? fromAddress;

  final BuBytes? toAddress;

  final List<cosmos_base_v1beta1_coin.Coin> amount;

  MsgSend({
    List<int>? fromAddress,
    List<int>? toAddress,
    this.amount = const [],
  }) : fromAddress = fromAddress?.asImmutableBytes,
       toAddress = toAddress?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "thorchain/MsgSend"),
      ],
      fields: [
        ProtoFieldConfig.bytes(
          1,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [fromAddress, toAddress, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from_address': config.encodeBinary(fromAddress),
      'to_address': config.encodeBinary(toAddress),
      'amount': amount.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgSend.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSend(
      fromAddress: config.decodeBinary<List<int>?>(
        json.valueAs('from_address', normalizeKeyLookup: config.normalizeKeys),
      ),
      toAddress: config.decodeBinary<List<int>?>(
        json.valueAs('to_address', normalizeKeyLookup: config.normalizeKeys),
      ),
      amount:
          (json.valueEnsureAsList<dynamic>(
                'amount',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory MsgSend.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSend(
      fromAddress: decode.getBytes<List<int>?>(1),
      toAddress: decode.getBytes<List<int>?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgSend;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
