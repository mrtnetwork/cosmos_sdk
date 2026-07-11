import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgObservedTxIn extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final List<common_common.ObservedTx> txs;

  final List<int>? signer;

  const MsgObservedTxIn({this.txs = const [], this.signer});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "thorchain/ObservedTxIn"),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txs, signer];

  @override
  Map<String, dynamic> toJson() {
    return {
      'txs': txs.map((e) => e.toJson()).toList(),
      'signer': switch (signer) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgObservedTxIn.fromJson(Map<String, dynamic> json) {
    return MsgObservedTxIn(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  common_common.ObservedTx,
                  Map<String, dynamic>
                >(value: e, parse: (v) => common_common.ObservedTx.fromJson(v)),
              )
              .toList(),
      signer: json.valueAsBytes<List<int>?>(
        'signer',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgObservedTxIn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgObservedTxIn(
      txs:
          decode
              .getListOfBytes(1)
              .map((b) => common_common.ObservedTx.deserialize(b))
              .toList(),
      signer: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgObservedTxIn;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
