import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

class Minter extends CosmosProtoMessage {
  final int? sequenceId;

  final google_protobuf_timestamp.Timestamp? endTime;

  final google_protobuf_any.Any? config;

  const Minter({this.sequenceId, this.endTime, this.config});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sequenceId, endTime, config];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sequence_id': sequenceId,
      'end_time': endTime?.toRfc3339(),
      'config': config?.toJson(),
    };
  }

  factory Minter.fromJson(Map<String, dynamic> json) {
    return Minter(
      sequenceId: json.valueAsInt<int?>('sequence_id', acceptCamelCase: true),
      endTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'end_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      config: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'config',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory Minter.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Minter(
      sequenceId: decode.getInt<int?>(1),
      endTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      config: decode.messageTo<google_protobuf_any.Any?>(
        3,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterMinter;
}

class MinterState extends CosmosProtoMessage {
  final int? sequenceId;

  final String? amountMinted;

  final String? remainderToMint;

  final google_protobuf_timestamp.Timestamp? lastMintBlockTime;

  final String? remainderFromPreviousMinter;

  const MinterState({
    this.sequenceId,
    this.amountMinted,
    this.remainderToMint,
    this.lastMintBlockTime,
    this.remainderFromPreviousMinter,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    sequenceId,
    amountMinted,
    remainderToMint,
    lastMintBlockTime,
    remainderFromPreviousMinter,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sequence_id': sequenceId,
      'amount_minted': amountMinted,
      'remainder_to_mint': remainderToMint,
      'last_mint_block_time': lastMintBlockTime?.toRfc3339(),
      'remainder_from_previous_minter': remainderFromPreviousMinter,
    };
  }

  factory MinterState.fromJson(Map<String, dynamic> json) {
    return MinterState(
      sequenceId: json.valueAsInt<int?>('sequence_id', acceptCamelCase: true),
      amountMinted: json.valueAsString<String?>(
        'amount_minted',
        acceptCamelCase: true,
      ),
      remainderToMint: json.valueAsString<String?>(
        'remainder_to_mint',
        acceptCamelCase: true,
      ),
      lastMintBlockTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'last_mint_block_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      remainderFromPreviousMinter: json.valueAsString<String?>(
        'remainder_from_previous_minter',
        acceptCamelCase: true,
      ),
    );
  }

  factory MinterState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MinterState(
      sequenceId: decode.getInt<int?>(1),
      amountMinted: decode.getString<String?>(2),
      remainderToMint: decode.getString<String?>(3),
      lastMintBlockTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      remainderFromPreviousMinter: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfeminterMinterState;
}
