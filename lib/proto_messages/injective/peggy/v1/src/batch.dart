import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/attestation.dart"
    as injective_peggy_v1_attestation;

/// import "injective/peggy/v1/types.proto";
/// OutgoingTxBatch represents a batch of transactions going from Peggy to ETH
class OutgoingTxBatch extends CosmosProtoMessage {
  final BigInt? batchNonce;

  final BigInt? batchTimeout;

  final List<OutgoingTransferTx> transactions;

  final String? tokenContract;

  final BigInt? block;

  const OutgoingTxBatch({
    this.batchNonce,
    this.batchTimeout,
    this.transactions = const [],
    this.tokenContract,
    this.block,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.uint64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    batchNonce,
    batchTimeout,
    transactions,
    tokenContract,
    block,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'batch_nonce': batchNonce?.toString(),
      'batch_timeout': batchTimeout?.toString(),
      'transactions': transactions.map((e) => e.toJson()).toList(),
      'token_contract': tokenContract,
      'block': block?.toString(),
    };
  }

  factory OutgoingTxBatch.fromJson(Map<String, dynamic> json) {
    return OutgoingTxBatch(
      batchNonce: json.valueAsBigInt<BigInt?>(
        'batch_nonce',
        acceptCamelCase: true,
      ),
      batchTimeout: json.valueAsBigInt<BigInt?>(
        'batch_timeout',
        acceptCamelCase: true,
      ),
      transactions:
          (json.valueEnsureAsList<dynamic>(
                'transactions',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  OutgoingTransferTx,
                  Map<String, dynamic>
                >(value: e, parse: (v) => OutgoingTransferTx.fromJson(v)),
              )
              .toList(),
      tokenContract: json.valueAsString<String?>(
        'token_contract',
        acceptCamelCase: true,
      ),
      block: json.valueAsBigInt<BigInt?>('block', acceptCamelCase: true),
    );
  }

  factory OutgoingTxBatch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OutgoingTxBatch(
      batchNonce: decode.getBigInt<BigInt?>(1),
      batchTimeout: decode.getBigInt<BigInt?>(2),
      transactions:
          decode
              .getListOfBytes(3)
              .map((b) => OutgoingTransferTx.deserialize(b))
              .toList(),
      tokenContract: decode.getString<String?>(4),
      block: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1OutgoingTxBatch;
}

/// OutgoingTransferTx represents an individual send from Peggy to ETH
class OutgoingTransferTx extends CosmosProtoMessage {
  final BigInt? id;

  final String? sender;

  final String? destAddress;

  final injective_peggy_v1_attestation.ERC20Token? erc20Token;

  final injective_peggy_v1_attestation.ERC20Token? erc20Fee;

  const OutgoingTransferTx({
    this.id,
    this.sender,
    this.destAddress,
    this.erc20Token,
    this.erc20Fee,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.message(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    sender,
    destAddress,
    erc20Token,
    erc20Fee,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'sender': sender,
      'dest_address': destAddress,
      'erc20_token': erc20Token?.toJson(),
      'erc20_fee': erc20Fee?.toJson(),
    };
  }

  factory OutgoingTransferTx.fromJson(Map<String, dynamic> json) {
    return OutgoingTransferTx(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      destAddress: json.valueAsString<String?>(
        'dest_address',
        acceptCamelCase: true,
      ),
      erc20Token: json.valueTo<
        injective_peggy_v1_attestation.ERC20Token?,
        Map<String, dynamic>
      >(
        key: 'erc20_token',
        parse: (v) => injective_peggy_v1_attestation.ERC20Token.fromJson(v),
        acceptCamelCase: true,
      ),
      erc20Fee: json.valueTo<
        injective_peggy_v1_attestation.ERC20Token?,
        Map<String, dynamic>
      >(
        key: 'erc20_fee',
        parse: (v) => injective_peggy_v1_attestation.ERC20Token.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory OutgoingTransferTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OutgoingTransferTx(
      id: decode.getBigInt<BigInt?>(1),
      sender: decode.getString<String?>(2),
      destAddress: decode.getString<String?>(3),
      erc20Token: decode.messageTo<injective_peggy_v1_attestation.ERC20Token?>(
        4,
        (b) => injective_peggy_v1_attestation.ERC20Token.deserialize(b),
      ),
      erc20Fee: decode.messageTo<injective_peggy_v1_attestation.ERC20Token?>(
        5,
        (b) => injective_peggy_v1_attestation.ERC20Token.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1OutgoingTransferTx;
}
