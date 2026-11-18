import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;

class MsgNetworkFee extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final BigInt? blockHeight;

  final String? chain;

  final BigInt? transactionSize;

  final BigInt? transactionFeeRate;

  final BuBytes? signer;

  MsgNetworkFee({
    this.blockHeight,
    this.chain,
    this.transactionSize,
    this.transactionFeeRate,
    List<int>? signer,
  }) : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "thorchain/MsgNetworkFee"),
      ],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.bytes(
          5,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    blockHeight,
    chain,
    transactionSize,
    transactionFeeRate,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_height': config.encodeBigint(blockHeight),
      'chain': chain,
      'transaction_size': config.encodeBigint(transactionSize),
      'transaction_fee_rate': config.encodeBigint(transactionFeeRate),
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgNetworkFee.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgNetworkFee(
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      transactionSize: json.valueAsBigInt<BigInt?>(
        'transaction_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      transactionFeeRate: json.valueAsBigInt<BigInt?>(
        'transaction_fee_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgNetworkFee.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgNetworkFee(
      blockHeight: decode.getBigInt<BigInt?>(1),
      chain: decode.getString<String?>(2),
      transactionSize: decode.getBigInt<BigInt?>(3),
      transactionFeeRate: decode.getBigInt<BigInt?>(4),
      signer: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgNetworkFee;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}

class MsgNetworkFeeQuorum extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final common_common.QuorumNetworkFee? quoNetFee;

  final BuBytes? signer;

  MsgNetworkFeeQuorum({this.quoNetFee, List<int>? signer})
    : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/MsgNetworkFeeQuorum",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [quoNetFee, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'quoNetFee': config.encodeMessage(quoNetFee),
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgNetworkFeeQuorum.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgNetworkFeeQuorum(
      quoNetFee: json.valueTo<common_common.QuorumNetworkFee?, Object>(
        key: 'quoNetFee',
        parse:
            (v) => common_common.QuorumNetworkFee.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgNetworkFeeQuorum.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgNetworkFeeQuorum(
      quoNetFee: decode.messageTo<common_common.QuorumNetworkFee?>(
        1,
        (b) => common_common.QuorumNetworkFee.deserialize(b),
      ),
      signer: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgNetworkFeeQuorum;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
