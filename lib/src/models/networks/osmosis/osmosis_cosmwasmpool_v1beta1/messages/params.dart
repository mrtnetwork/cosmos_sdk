import 'package:blockchain_utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisCosmWasmPoolParams extends CosmosMessage {
  /// [codeIdWhitelist] contains the list of code ids that are allowed to be
  /// instantiated.
  final BigInt? codeIdWhitelist;

  /// [poolMigrationLimit] is the maximum number of pools that can be migrated
  /// at once via governance proposal. This is to have a constant bound on the
  /// number of pools that can be migrated at once and remove the possibility
  /// of an unlikely scenario of causing a chain halt due to a large migration.
  final BigInt? poolMigrationLimit;

  OsmosisCosmWasmPoolParams({this.codeIdWhitelist, this.poolMigrationLimit});
  factory OsmosisCosmWasmPoolParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolParams(
        codeIdWhitelist: decode.getField(1),
        poolMigrationLimit: decode.getField(2));
  }
  factory OsmosisCosmWasmPoolParams.fromRpc(Map<String, dynamic> json) {
    return OsmosisCosmWasmPoolParams(
        poolMigrationLimit: BigintUtils.tryParse(json["pool_migration_limit"]),
        codeIdWhitelist: BigintUtils.tryParse(json["code_id_whitelist"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_id_whitelist": codeIdWhitelist?.toString(),
      "pool_migration_limit": poolMigrationLimit?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.params.typeUrl;

  @override
  List get values => [codeIdWhitelist, poolMigrationLimit];
}
