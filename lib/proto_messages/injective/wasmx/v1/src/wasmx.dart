import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmwasm/wasm/v1/src/types.dart"
    as cosmwasm_wasm_v1_types;
import "package:cosmos_sdk/proto_messages/injective/wasmx/v1/src/proposal.dart"
    as injective_wasmx_v1_proposal;

class Params extends CosmosProtoMessage {
  /// Set the status to active to indicate that contracts can be executed in
  /// begin blocker.
  final bool? isExecutionEnabled;

  /// Maximum aggregate total gas to be used for the contract executions in the
  /// BeginBlocker.
  final BigInt? maxBeginBlockTotalGas;

  /// the maximum gas limit each individual contract can consume in the
  /// BeginBlocker.
  final BigInt? maxContractGasLimit;

  /// min_gas_price defines the minimum gas price the contracts must pay to be
  /// executed in the BeginBlocker.
  final BigInt? minGasPrice;

  final cosmwasm_wasm_v1_types.AccessConfig? registerContractAccess;

  const Params({
    this.isExecutionEnabled,
    this.maxBeginBlockTotalGas,
    this.maxContractGasLimit,
    this.minGasPrice,
    this.registerContractAccess,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "wasmx/Params")],
      fields: [
        ProtoFieldConfig.bool(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.message(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    isExecutionEnabled,
    maxBeginBlockTotalGas,
    maxContractGasLimit,
    minGasPrice,
    registerContractAccess,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'is_execution_enabled': isExecutionEnabled,
      'max_begin_block_total_gas': maxBeginBlockTotalGas?.toString(),
      'max_contract_gas_limit': maxContractGasLimit?.toString(),
      'min_gas_price': minGasPrice?.toString(),
      'register_contract_access': registerContractAccess?.toJson(),
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      isExecutionEnabled: json.valueAsBool<bool?>(
        'is_execution_enabled',
        acceptCamelCase: true,
      ),
      maxBeginBlockTotalGas: json.valueAsBigInt<BigInt?>(
        'max_begin_block_total_gas',
        acceptCamelCase: true,
      ),
      maxContractGasLimit: json.valueAsBigInt<BigInt?>(
        'max_contract_gas_limit',
        acceptCamelCase: true,
      ),
      minGasPrice: json.valueAsBigInt<BigInt?>(
        'min_gas_price',
        acceptCamelCase: true,
      ),
      registerContractAccess: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Map<String, dynamic>>(
            key: 'register_contract_access',
            parse: (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      isExecutionEnabled: decode.getBool<bool?>(1),
      maxBeginBlockTotalGas: decode.getBigInt<BigInt?>(2),
      maxContractGasLimit: decode.getBigInt<BigInt?>(3),
      minGasPrice: decode.getBigInt<BigInt?>(4),
      registerContractAccess: decode
          .messageTo<cosmwasm_wasm_v1_types.AccessConfig?>(
            5,
            (b) => cosmwasm_wasm_v1_types.AccessConfig.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1Params;
}

class RegisteredContract extends CosmosProtoMessage {
  /// limit of gas per BB execution
  final BigInt? gasLimit;

  /// gas price that contract is willing to pay for execution in BeginBlocker
  final BigInt? gasPrice;

  /// is contract currently active
  final bool? isExecutable;

  /// code_id that is allowed to be executed (to prevent malicious updates) - if
  /// nil/0 any code_id can be executed
  final BigInt? codeId;

  /// optional - admin addr that is allowed to update contract data
  final String? adminAddress;

  /// Optional: address of the contract granting fee
  /// Must be set if fund_mode is GrantOnly
  final String? granterAddress;

  /// funding mode
  final injective_wasmx_v1_proposal.FundingMode? fundMode;

  const RegisteredContract({
    this.gasLimit,
    this.gasPrice,
    this.isExecutable,
    this.codeId,
    this.adminAddress,
    this.granterAddress,
    this.fundMode,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.bool(3),
        ProtoFieldConfig.uint64(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.enumType(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    gasLimit,
    gasPrice,
    isExecutable,
    codeId,
    adminAddress,
    granterAddress,
    fundMode,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'gas_limit': gasLimit?.toString(),
      'gas_price': gasPrice?.toString(),
      'is_executable': isExecutable,
      'code_id': codeId?.toString(),
      'admin_address': adminAddress,
      'granter_address': granterAddress,
      'fund_mode': fundMode?.protoName,
    };
  }

  factory RegisteredContract.fromJson(Map<String, dynamic> json) {
    return RegisteredContract(
      gasLimit: json.valueAsBigInt<BigInt?>('gas_limit', acceptCamelCase: true),
      gasPrice: json.valueAsBigInt<BigInt?>('gas_price', acceptCamelCase: true),
      isExecutable: json.valueAsBool<bool?>(
        'is_executable',
        acceptCamelCase: true,
      ),
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      adminAddress: json.valueAsString<String?>(
        'admin_address',
        acceptCamelCase: true,
      ),
      granterAddress: json.valueAsString<String?>(
        'granter_address',
        acceptCamelCase: true,
      ),
      fundMode: json.valueTo<injective_wasmx_v1_proposal.FundingMode?, Object?>(
        key: 'fund_mode',
        parse: (v) => injective_wasmx_v1_proposal.FundingMode.from(v),
      ),
    );
  }

  factory RegisteredContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RegisteredContract(
      gasLimit: decode.getBigInt<BigInt?>(1),
      gasPrice: decode.getBigInt<BigInt?>(2),
      isExecutable: decode.getBool<bool?>(3),
      codeId: decode.getBigInt<BigInt?>(4),
      adminAddress: decode.getString<String?>(5),
      granterAddress: decode.getString<String?>(6),
      fundMode: decode.getEnum<injective_wasmx_v1_proposal.FundingMode?>(
        7,
        injective_wasmx_v1_proposal.FundingMode.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1RegisteredContract;
}
