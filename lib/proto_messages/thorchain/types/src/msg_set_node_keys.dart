import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgSetNodeKeys extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final common_common.PubKeySet? pubKeySetSet;

  final String? validatorConsPubKey;

  final BuBytes? signer;

  MsgSetNodeKeys({
    this.pubKeySetSet,
    this.validatorConsPubKey,
    List<int>? signer,
  }) : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/MsgSetNodeKeys",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bytes(
          3,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pubKeySetSet, validatorConsPubKey, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'pub_key_set_set': config.encodeMessage(pubKeySetSet),
      'validator_cons_pub_key': validatorConsPubKey,
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgSetNodeKeys.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetNodeKeys(
      pubKeySetSet: json.valueTo<common_common.PubKeySet?, Object>(
        key: 'pub_key_set_set',
        parse:
            (v) => common_common.PubKeySet.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validatorConsPubKey: json.valueAsString<String?>(
        'validator_cons_pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgSetNodeKeys.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetNodeKeys(
      pubKeySetSet: decode.messageTo<common_common.PubKeySet?>(
        1,
        (b) => common_common.PubKeySet.deserialize(b),
      ),
      validatorConsPubKey: decode.getString<String?>(2),
      signer: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgSetNodeKeys;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
