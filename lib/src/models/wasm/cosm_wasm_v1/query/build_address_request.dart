import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'build_address_response.dart';

/// QueryBuildAddressRequest is the request type for the Query/BuildAddress RPC
/// method.
class CosmWasmV1QueryBuildAddressRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryBuildAddressResponse> {
  /// CodeHash is the hash of the code
  final String? codeHash;

  /// CreatorAddress is the address of the contract instantiator
  final String? creatorAddress;

  /// Salt is a hex encoded salt
  final String? salt;

  /// InitArgs are optional json encoded init args to be used in contract address
  /// building if provided
  final List<int>? intArgs;
  CosmWasmV1QueryBuildAddressRequest({
    required this.codeHash,
    required this.creatorAddress,
    required this.salt,
    required List<int>? intArgs,
  }) : intArgs = intArgs?.asImmutableBytes;
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_hash": codeHash,
      "creator_address": creatorAddress,
      "salt": salt,
      "init_args": CosmosUtils.tryToBase64(intArgs),
    };
  }

  @override
  List get values => [codeHash, creatorAddress, salt, intArgs];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryBuildAddress;

  @override
  CosmWasmV1QueryBuildAddressResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryBuildAddressResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryBuildAddressResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1QueryBuildAddressResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
    "code_hash": codeHash,
    "creator_address": creatorAddress,
    "salt": salt,
    "init_args": CosmosUtils.tryToBase64(intArgs),
  };
}
