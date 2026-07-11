import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// EnforcedRestrictionsContract defines an EVM contract with its pause,
/// blacklist and unblacklist event signatures
class EnforcedRestrictionsEVMContract extends CosmosProtoMessage {
  /// EVM address of the contract
  final String? contractAddress;

  /// Pause event signature for the contract (e.g. "Pause()")
  final String? pauseEventSignature;

  /// Unpause event signature for the contract (e.g. "Unpause()")
  final String? unpauseEventSignature;

  /// Blacklist event signature for the contract (e.g. Blacklisted(address)")
  final String? blacklistEventSignature;

  /// UnBlacklist event signature for the contract (e.g.
  /// "UnBlacklisted(address)")
  final String? unblacklistEventSignature;

  const EnforcedRestrictionsEVMContract({
    this.contractAddress,
    this.pauseEventSignature,
    this.unpauseEventSignature,
    this.blacklistEventSignature,
    this.unblacklistEventSignature,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    contractAddress,
    pauseEventSignature,
    unpauseEventSignature,
    blacklistEventSignature,
    unblacklistEventSignature,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'contract_address': contractAddress,
      'pause_event_signature': pauseEventSignature,
      'unpause_event_signature': unpauseEventSignature,
      'blacklist_event_signature': blacklistEventSignature,
      'unblacklist_event_signature': unblacklistEventSignature,
    };
  }

  factory EnforcedRestrictionsEVMContract.fromJson(Map<String, dynamic> json) {
    return EnforcedRestrictionsEVMContract(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      pauseEventSignature: json.valueAsString<String?>(
        'pause_event_signature',
        acceptCamelCase: true,
      ),
      unpauseEventSignature: json.valueAsString<String?>(
        'unpause_event_signature',
        acceptCamelCase: true,
      ),
      blacklistEventSignature: json.valueAsString<String?>(
        'blacklist_event_signature',
        acceptCamelCase: true,
      ),
      unblacklistEventSignature: json.valueAsString<String?>(
        'unblacklist_event_signature',
        acceptCamelCase: true,
      ),
    );
  }

  factory EnforcedRestrictionsEVMContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EnforcedRestrictionsEVMContract(
      contractAddress: decode.getString<String?>(1),
      pauseEventSignature: decode.getString<String?>(2),
      unpauseEventSignature: decode.getString<String?>(3),
      blacklistEventSignature: decode.getString<String?>(4),
      unblacklistEventSignature: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePermissionsV1beta1EnforcedRestrictionsEVMContract;
}

/// Params defines the parameters for the permissions module.
class Params extends CosmosProtoMessage {
  /// Max amount of gas allowed for contract hook queries
  final BigInt? contractHookMaxGas;

  /// DEPRECATED in favor of enforced_restrictions_evm_contracts, but left
  /// for compatibility and upgrade purposes
  ///
  /// EVM addresses of contracts that will not bypass module-to-module transfers
  final List<String> deprecatedEnforcedRestrictionsContracts;

  /// EVM Contracts that module will be listening to sync permissions stored
  /// inside namespace on every update inside smart contract state
  final List<EnforcedRestrictionsEVMContract> enforcedRestrictionsEvmContracts;

  const Params({
    this.contractHookMaxGas,
    this.deprecatedEnforcedRestrictionsContracts = const [],
    this.enforcedRestrictionsEvmContracts = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "permissions/Params"),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    contractHookMaxGas,
    deprecatedEnforcedRestrictionsContracts,
    enforcedRestrictionsEvmContracts,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'contract_hook_max_gas': contractHookMaxGas?.toString(),
      'deprecated_enforced_restrictions_contracts':
          deprecatedEnforcedRestrictionsContracts.map((e) => e).toList(),
      'enforced_restrictions_evm_contracts':
          enforcedRestrictionsEvmContracts.map((e) => e.toJson()).toList(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      contractHookMaxGas: json.valueAsBigInt<BigInt?>(
        'contract_hook_max_gas',
        acceptCamelCase: true,
      ),
      deprecatedEnforcedRestrictionsContracts:
          (json.valueEnsureAsList<dynamic>(
            'deprecated_enforced_restrictions_contracts',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      enforcedRestrictionsEvmContracts:
          (json.valueEnsureAsList<dynamic>(
                'enforced_restrictions_evm_contracts',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  EnforcedRestrictionsEVMContract,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => EnforcedRestrictionsEVMContract.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      contractHookMaxGas: decode.getBigInt<BigInt?>(1),
      deprecatedEnforcedRestrictionsContracts: decode.getListOrEmpty<String>(2),
      enforcedRestrictionsEvmContracts:
          decode
              .getListOfBytes(3)
              .map((b) => EnforcedRestrictionsEVMContract.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePermissionsV1beta1Params;
}
