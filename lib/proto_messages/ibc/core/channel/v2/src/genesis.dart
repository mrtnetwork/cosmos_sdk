import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// PacketState defines the generic type necessary to retrieve and store
/// packet commitments, acknowledgements, and receipts.
/// Caller is responsible for knowing the context necessary to interpret this
/// state as a commitment, acknowledgement, or a receipt.
class PacketState extends CosmosProtoMessage {
  /// client unique identifier.
  final String? clientId;

  /// packet sequence.
  final BigInt? sequence;

  /// embedded data that represents packet state.
  final List<int>? data;

  const PacketState({this.clientId, this.sequence, this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, sequence, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'sequence': sequence?.toString(),
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory PacketState.fromJson(Map<String, dynamic> json) {
    return PacketState(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory PacketState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PacketState(
      clientId: decode.getString<String?>(1),
      sequence: decode.getBigInt<BigInt?>(2),
      data: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV2PacketState;
}
