import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// MigratePoolContractsProposal is a gov Content type for migrating given pools to the new
/// contract code and adding to internal whitelist if needed. It has two options to perform the migration:
/// If the codeID is non-zero, it will migrate the pool contracts to a given codeID assuming that
/// it has already been uploaded. uploadByteCode must be empty in such a case. Fails if codeID does
///  not exist. Fails if uploadByteCode is not empty.
/// If the codeID is zero, it will upload the given uploadByteCode and use the new resulting code
/// id to migrate the pool to. Errors if uploadByteCode is empty or invalid.
/// In both cases, if one of the pools specified by the given poolID does not exist, the proposal fails.
/// The reason for having poolIDs be a slice of ids is to account for the potential need for emergency
/// migration of all old code ids associated with particular pools to new code ids, or simply having the
/// flexibility of migrating multiple older pool contracts to a new one at once when there is a release.
/// poolD count to be submitted at once is gated by a governance paramets (20 at launch). The proposal
/// fails if more. Note that 20 was chosen arbitrarily to have a constant bound on the number of pools
/// migrated at once. This size will be configured by a module parameter so it can be changed by a constant.
class OsmosisCosmWasmPoolMigratePoolContractsProposal extends CosmosMessage {
  final String? title;
  final String? description;

  /// pool_ids are the pool ids of the contracts to be migrated
  /// either to the new_code_id that is already uploaded to chain or to
  /// the given wasm_byte_code.
  final List<BigInt>? poolIds;

  /// new_code_id is the code id of the contract code to migrate to.
  /// Assumes that the code is already uploaded to chain. Only one of
  /// new_code_id and wasm_byte_code should be set.
  final BigInt? newCodeId;

  /// WASMByteCode can be raw or gzip compressed. Assumes that the code id
  /// has not been uploaded yet so uploads the given code and migrates to it.
  /// Only one of new_code_id and wasm_byte_code should be set.
  final List<int>? wasmByteCode;

  /// MigrateMsg migrate message to be used for migrating the pool contracts.
  final List<int>? migrateMsg;
  OsmosisCosmWasmPoolMigratePoolContractsProposal(
      {this.title,
      this.description,
      List<BigInt>? poolIds,
      this.newCodeId,
      List<int>? wasmByteCode,
      List<int>? migrateMsg})
      : poolIds = poolIds?.emptyAsNull?.immutable,
        wasmByteCode = BytesUtils.tryToBytes(wasmByteCode, unmodifiable: true),
        migrateMsg = BytesUtils.tryToBytes(migrateMsg, unmodifiable: true);
  factory OsmosisCosmWasmPoolMigratePoolContractsProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisCosmWasmPoolMigratePoolContractsProposal(
        title: decode.getField(1),
        description: decode.getField(2),
        poolIds: decode
                .getResult<ProtocolBufferDecoderResult?>(3)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[],
        newCodeId: decode.getField(4),
        wasmByteCode: decode.getField(5),
        migrateMsg: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "pool_ids": poolIds?.map((e) => e.toString()).toList(),
      "new_code_id": newCodeId?.toString(),
      "wasm_byte_code": BytesUtils.tryToHexString(wasmByteCode),
      "migrate_msg": BytesUtils.tryToHexString(migrateMsg),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisCosmWasmPoolV1beta1Types.migratePoolContractsProposal;

  @override
  List get values =>
      [title, description, poolIds, newCodeId, wasmByteCode, migrateMsg];
}
