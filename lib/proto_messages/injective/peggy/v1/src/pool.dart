import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class BatchFees extends CosmosProtoMessage {
  final String? token;

  final String? totalFees;

  const BatchFees({this.token, this.totalFees});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [token, totalFees];

  @override
  Map<String, dynamic> toJson() {
    return {'token': token, 'total_fees': totalFees};
  }

  factory BatchFees.fromJson(Map<String, dynamic> json) {
    return BatchFees(
      token: json.valueAsString<String?>('token', acceptCamelCase: true),
      totalFees: json.valueAsString<String?>(
        'total_fees',
        acceptCamelCase: true,
      ),
    );
  }

  factory BatchFees.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BatchFees(
      token: decode.getString<String?>(1),
      totalFees: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1BatchFees;
}
