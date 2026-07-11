import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class Params extends CosmosProtoMessage {
  /// code_ide_whitelist contains the list of code ids that are allowed to be
  /// instantiated.
  final List<BigInt> codeIdWhitelist;

  /// pool_migration_limit is the maximum number of pools that can be migrated
  /// at once via governance proposal. This is to have a constant bound on the
  /// number of pools that can be migrated at once and remove the possibility
  /// of an unlikely scenario of causing a chain halt due to a large migration.
  final BigInt? poolMigrationLimit;

  const Params({this.codeIdWhitelist = const [], this.poolMigrationLimit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.uint64(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeIdWhitelist, poolMigrationLimit];

  @override
  Map<String, dynamic> toJson() {
    return {
      'code_id_whitelist': codeIdWhitelist.map((e) => e.toString()).toList(),
      'pool_migration_limit': poolMigrationLimit?.toString(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      codeIdWhitelist:
          (json.valueEnsureAsList<dynamic>(
            'code_id_whitelist',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      poolMigrationLimit: json.valueAsBigInt<BigInt?>(
        'pool_migration_limit',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      codeIdWhitelist: decode.getListOrEmpty<BigInt>(1),
      poolMigrationLimit: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisCosmwasmpoolV1beta1Params;
}
