import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgDeposit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final List<common_common.Coin> coins;

  final String? memo;

  final BuBytes? signer;

  final BuBytes? salt;

  MsgDeposit({
    this.coins = const [],
    this.memo,
    List<int>? signer,
    List<int>? salt,
  }) : signer = signer?.asImmutableBytes,
       salt = salt?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "thorchain/MsgDeposit"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bytes(
          3,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [coins, memo, signer, salt];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
      'memo': memo,
      'signer': config.encodeBinary(signer),
      'salt': config.encodeBinary(salt),
    };
  }

  factory MsgDeposit.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDeposit(
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<common_common.Coin, Object>(
                  value: e,
                  parse:
                      (v) => common_common.Coin.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      memo: json.valueAsString<String?>(
        'memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
      salt: config.decodeBinary<List<int>?>(
        json.valueAs('salt', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeposit(
      coins:
          decode
              .getListOfBytes(1)
              .map((b) => common_common.Coin.deserialize(b))
              .toList(),
      memo: decode.getString<String?>(2),
      signer: decode.getBytes<List<int>?>(3),
      salt: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgDeposit;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
