import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/common/src/common.dart"
    as common_common;

class TxOutItem extends CosmosProtoMessage {
  final String? chain;

  final String? toAddress;

  final String? vaultPubKey;

  final common_common.Coin? coin;

  final String? memo;

  final String? originalMemo;

  final List<common_common.Coin> maxGas;

  final BigInt? gasRate;

  final String? inHash;

  final String? outHash;

  final String? moduleName;

  final String? aggregator;

  final String? aggregatorTargetAsset;

  final String? aggregatorTargetLimit;

  final String? cloutSpent;

  final String? vaultPubKeyEddsa;

  final String? vaultPubKeyFrost;

  const TxOutItem({
    this.chain,
    this.toAddress,
    this.vaultPubKey,
    this.coin,
    this.memo,
    this.originalMemo,
    this.maxGas = const [],
    this.gasRate,
    this.inHash,
    this.outHash,
    this.moduleName,
    this.aggregator,
    this.aggregatorTargetAsset,
    this.aggregatorTargetLimit,
    this.cloutSpent,
    this.vaultPubKeyEddsa,
    this.vaultPubKeyFrost,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(16),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.int64(7),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(
          10,
          options: [ProtoOptionString(name: "json_name", value: "-")],
        ),
        ProtoFieldConfig.string(11),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(17, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    chain,
    toAddress,
    vaultPubKey,
    coin,
    memo,
    originalMemo,
    maxGas,
    gasRate,
    inHash,
    outHash,
    moduleName,
    aggregator,
    aggregatorTargetAsset,
    aggregatorTargetLimit,
    cloutSpent,
    vaultPubKeyEddsa,
    vaultPubKeyFrost,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'chain': chain,
      'to_address': toAddress,
      'vault_pub_key': vaultPubKey,
      'coin': config.encodeMessage(coin),
      'memo': memo,
      'original_memo': originalMemo,
      'max_gas': maxGas.map((e) => config.encodeMessage(e)).toList(),
      'gas_rate': config.encodeBigint(gasRate),
      'in_hash': inHash,
      'out_hash': outHash,
      'module_name': moduleName,
      'aggregator': aggregator,
      'aggregator_target_asset': aggregatorTargetAsset,
      'aggregator_target_limit': aggregatorTargetLimit,
      'clout_spent': cloutSpent,
      'vault_pub_key_eddsa': vaultPubKeyEddsa,
      'vault_pub_key_frost': vaultPubKeyFrost,
    };
  }

  factory TxOutItem.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TxOutItem(
      chain: json.valueAsString<String?>(
        'chain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      toAddress: json.valueAsString<String?>(
        'to_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      vaultPubKey: json.valueAsString<String?>(
        'vault_pub_key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coin: json.valueTo<common_common.Coin?, Object>(
        key: 'coin',
        parse:
            (v) => common_common.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      memo: json.valueAsString<String?>(
        'memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      originalMemo: json.valueAsString<String?>(
        'original_memo',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxGas:
          (json.valueEnsureAsList<dynamic>(
                'max_gas',
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
      gasRate: json.valueAsBigInt<BigInt?>(
        'gas_rate',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      inHash: json.valueAsString<String?>(
        'in_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      outHash: json.valueAsString<String?>(
        'out_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregator: json.valueAsString<String?>(
        'aggregator',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregatorTargetAsset: json.valueAsString<String?>(
        'aggregator_target_asset',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aggregatorTargetLimit: json.valueAsString<String?>(
        'aggregator_target_limit',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cloutSpent: json.valueAsString<String?>(
        'clout_spent',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      vaultPubKeyEddsa: json.valueAsString<String?>(
        'vault_pub_key_eddsa',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      vaultPubKeyFrost: json.valueAsString<String?>(
        'vault_pub_key_frost',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory TxOutItem.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxOutItem(
      chain: decode.getString<String?>(1),
      toAddress: decode.getString<String?>(2),
      vaultPubKey: decode.getString<String?>(3),
      coin: decode.messageTo<common_common.Coin?>(
        4,
        (b) => common_common.Coin.deserialize(b),
      ),
      memo: decode.getString<String?>(5),
      originalMemo: decode.getString<String?>(16),
      maxGas:
          decode
              .getListOfBytes(6)
              .map((b) => common_common.Coin.deserialize(b))
              .toList(),
      gasRate: decode.getBigInt<BigInt?>(7),
      inHash: decode.getString<String?>(8),
      outHash: decode.getString<String?>(9),
      moduleName: decode.getString<String?>(10),
      aggregator: decode.getString<String?>(11),
      aggregatorTargetAsset: decode.getString<String?>(12),
      aggregatorTargetLimit: decode.getString<String?>(13),
      cloutSpent: decode.getString<String?>(14),
      vaultPubKeyEddsa: decode.getString<String?>(15),
      vaultPubKeyFrost: decode.getString<String?>(17),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesTxOutItem;
}

class TxOut extends CosmosProtoMessage {
  final BigInt? height;

  final List<TxOutItem> txArray;

  const TxOut({this.height, this.txArray = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, txArray];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': config.encodeBigint(height),
      'tx_array': txArray.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory TxOut.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return TxOut(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      txArray:
          (json.valueEnsureAsList<dynamic>(
                'tx_array',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<TxOutItem, Object>(
                  value: e,
                  parse:
                      (v) => TxOutItem.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory TxOut.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TxOut(
      height: decode.getBigInt<BigInt?>(1),
      txArray:
          decode
              .getListOfBytes(2)
              .map((b) => TxOutItem.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesTxOut;
}
