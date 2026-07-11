import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class VestingPoolReservation extends CosmosProtoMessage {
  final BigInt? id;

  final String? amount;

  const VestingPoolReservation({this.id, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'id': id?.toString(), 'amount': amount};
  }

  factory VestingPoolReservation.fromJson(Map<String, dynamic> json) {
    return VestingPoolReservation(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory VestingPoolReservation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VestingPoolReservation(
      id: decode.getBigInt<BigInt?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfevestingVestingPoolReservation;
}
