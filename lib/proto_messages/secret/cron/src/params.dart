import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Defines the parameters for the module.
class Params extends CosmosProtoMessage {
  /// Security address that can remove schedules
  final String? securityAddress;

  /// Limit of schedules executed in one block
  final BigInt? limit;

  const Params({this.securityAddress, this.limit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [securityAddress, limit];

  @override
  Map<String, dynamic> toJson() {
    return {'security_address': securityAddress, 'limit': limit?.toString()};
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      securityAddress: json.valueAsString<String?>(
        'security_address',
        acceptCamelCase: true,
      ),
      limit: json.valueAsBigInt<BigInt?>('limit', acceptCamelCase: true),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      securityAddress: decode.getString<String?>(1),
      limit: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronParams;
}
