import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_config.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'store_and_instantiate_contract_response.dart';

/// MsgStoreAndInstantiateContract is the MsgStoreAndInstantiateContract request type.
class CosmWasmV1StoreAndInstantiateContract
    extends
        CosmWasm1Beta1Service<
          CosmWasmV1MsgStoreAndInstantiateContractResponse
        > {
  /// Authority is the address of the governance account.
  final String? authority;

  /// WASMByteCode can be raw or gzip compressed
  final List<int>? wasmByteCode;

  /// InstantiatePermission to apply on contract creation, optional
  final CosmWasmV1AccessConfig? instantiatePermission;

  /// UnpinCode code on upload, optional. As default the uploaded contract is
  /// pinned to cache.
  final bool? unpinCode;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// Label is optional metadata to be stored with a contract instance.
  final String? label;

  /// Msg json encoded message to be passed to the contract on instantiation
  final List<int>? msg;

  /// Funds coins that are transferred from the authority account to the contract
  /// on instantiation
  final List<Coin>? funds;

  /// Source is the URL where the code is hosted
  final String? source;

  /// Builder is the docker image used to build the code deterministically, used
  /// for smart contract verification
  final String? builder;

  /// CodeHash is the SHA256 sum of the code outputted by builder, used for smart
  /// contract verification
  final List<int>? codeHash;

  CosmWasmV1StoreAndInstantiateContract({
    this.authority,
    List<int>? wasmByteCode,
    this.instantiatePermission,
    this.unpinCode,
    this.admin,
    this.label,
    List<int>? msg,
    List<Coin>? funds,
    this.source,
    this.builder,
    List<int>? codeHash,
  }) : wasmByteCode = wasmByteCode?.immutable,
       msg = msg?.asImmutableBytes,
       funds = funds?.immutable,
       codeHash = codeHash?.asImmutableBytes;
  factory CosmWasmV1StoreAndInstantiateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1StoreAndInstantiateContract(
      authority: decode.getField(1),
      wasmByteCode: decode.getField(3),
      instantiatePermission: decode
          .getResult(4)
          ?.to<CosmWasmV1AccessConfig, List<int>>(
            (e) => CosmWasmV1AccessConfig.deserialize(e),
          ),
      unpinCode: decode.getField(5),
      admin: decode.getField(6),
      label: decode.getField(7),
      msg: decode.getField(8),
      funds:
          decode
              .getFields<List<int>>(9)
              .map((e) => Coin.deserialize(e))
              .toList(),
      source: decode.getField(10),
      builder: decode.getField(11),
      codeHash: decode.getField(12),
    );
  }
  factory CosmWasmV1StoreAndInstantiateContract.fromJson(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1StoreAndInstantiateContract(
      authority: json.as("authority"),
      wasmByteCode: json.asBytes("wasm_byte_code"),
      instantiatePermission: json
          .maybeAs<CosmWasmV1AccessConfig, Map<String, dynamic>>(
            key: "instantiate_permission",
            onValue: (e) => CosmWasmV1AccessConfig.fromJson(e),
          ),
      admin: json.as("admin"),
      builder: json.as("builder"),
      codeHash: json.asBytes("code_hash"),
      msg: json.asBytes("msg"),
      label: json.as("label"),
      source: json.as("source"),
      unpinCode: json.as("unpin_code"),
      funds: json.asListOfMap("funds")?.map((e) => Coin.fromJson(e)).toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority,
      "wasm_byte_code": CosmosUtils.tryToBase64(wasmByteCode),
      "instantiate_permission": instantiatePermission?.toJson(),
      "unpin_code": unpinCode,
      "admin": admin,
      "label": label,
      "msg": CosmosUtils.tryToBase64(msg),
      "funds": funds?.map((e) => e.toJson()).toList(),
      "source": source,
      "builder": builder,
      "code_hash": CosmosUtils.tryToBase64(codeHash),
    };
  }

  @override
  List get values => [
    authority,
    wasmByteCode,
    instantiatePermission,
    unpinCode,
    admin,
    label,
    msg,
    funds,
    source,
    builder,
    codeHash,
  ];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgStoreAndInstantiateContract;

  @override
  List<String?> get signers => [authority];

  @override
  CosmWasmV1MsgStoreAndInstantiateContractResponse onResponse(List<int> bytes) {
    return CosmWasmV1MsgStoreAndInstantiateContractResponse.deserialize(bytes);
  }
}
