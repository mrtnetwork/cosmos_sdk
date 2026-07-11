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

  final List<int>? signer;

  const MsgSetNodeKeys({
    this.pubKeySetSet,
    this.validatorConsPubKey,
    this.signer,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'pub_key_set_set': pubKeySetSet?.toJson(),
      'validator_cons_pub_key': validatorConsPubKey,
      'signer': switch (signer) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgSetNodeKeys.fromJson(Map<String, dynamic> json) {
    return MsgSetNodeKeys(
      pubKeySetSet: json
          .valueTo<common_common.PubKeySet?, Map<String, dynamic>>(
            key: 'pub_key_set_set',
            parse: (v) => common_common.PubKeySet.fromJson(v),
            acceptCamelCase: true,
          ),
      validatorConsPubKey: json.valueAsString<String?>(
        'validator_cons_pub_key',
        acceptCamelCase: true,
      ),
      signer: json.valueAsBytes<List<int>?>(
        'signer',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
