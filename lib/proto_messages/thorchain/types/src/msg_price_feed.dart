import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class MsgPriceFeedQuorumBatch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final List<common_common.QuorumPriceFeed> quoPriceFeeds;

  final List<int>? signer;

  const MsgPriceFeedQuorumBatch({this.quoPriceFeeds = const [], this.signer});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/MsgPriceFeedQuorumBatch",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [quoPriceFeeds, signer];

  @override
  Map<String, dynamic> toJson() {
    return {
      'quoPriceFeeds': quoPriceFeeds.map((e) => e.toJson()).toList(),
      'signer': switch (signer) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgPriceFeedQuorumBatch.fromJson(Map<String, dynamic> json) {
    return MsgPriceFeedQuorumBatch(
      quoPriceFeeds:
          (json.valueEnsureAsList<dynamic>(
                'quoPriceFeeds',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  common_common.QuorumPriceFeed,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => common_common.QuorumPriceFeed.fromJson(v),
                ),
              )
              .toList(),
      signer: json.valueAsBytes<List<int>?>(
        'signer',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgPriceFeedQuorumBatch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPriceFeedQuorumBatch(
      quoPriceFeeds:
          decode
              .getListOfBytes(1)
              .map((b) => common_common.QuorumPriceFeed.deserialize(b))
              .toList(),
      signer: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgPriceFeedQuorumBatch;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
