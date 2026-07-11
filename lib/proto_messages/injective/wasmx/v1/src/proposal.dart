import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

enum FundingMode implements ProtoEnumVariant {
  unspecified(0, 'Unspecified'),
  selfFunded(1, 'SelfFunded'),
  grantOnly(2, 'GrantOnly'),
  dual(3, 'Dual');

  const FundingMode(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FundingMode fromValue(int? value) {
    return FundingMode.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "FundingMode", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FundingMode from(Object? value) {
    return FundingMode.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "FundingMode", value: value),
    );
  }
}

class ContractRegistrationRequest extends CosmosProtoMessage {
  /// Unique Identifier for contract instance to be registered.
  final String? contractAddress;

  /// Maximum gas to be used for the smart contract execution.
  final BigInt? gasLimit;

  /// gas price to be used for the smart contract execution.
  final BigInt? gasPrice;

  final bool? shouldPinContract;

  /// if true contract owner can update it, if false only current code_id will be
  /// allowed to be executed
  final bool? isMigrationAllowed;

  /// code_id of the contract being registered - will be verified upon every
  /// execution but only if is_migration_allowed is false
  final BigInt? codeId;

  /// Optional address of admin account (that will be allowed to pause or update
  /// contract params)
  final String? adminAddress;

  /// Optional address of the contract that grants fees. Must be set if
  /// funding_mode is other than SelfFunded
  final String? granterAddress;

  /// Specifies how the contract will fund its execution
  final FundingMode? fundingMode;

  const ContractRegistrationRequest({
    this.contractAddress,
    this.gasLimit,
    this.gasPrice,
    this.shouldPinContract,
    this.isMigrationAllowed,
    this.codeId,
    this.adminAddress,
    this.granterAddress,
    this.fundingMode,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.bool(4),
        ProtoFieldConfig.bool(5),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.enumType(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    contractAddress,
    gasLimit,
    gasPrice,
    shouldPinContract,
    isMigrationAllowed,
    codeId,
    adminAddress,
    granterAddress,
    fundingMode,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'contract_address': contractAddress,
      'gas_limit': gasLimit?.toString(),
      'gas_price': gasPrice?.toString(),
      'should_pin_contract': shouldPinContract,
      'is_migration_allowed': isMigrationAllowed,
      'code_id': codeId?.toString(),
      'admin_address': adminAddress,
      'granter_address': granterAddress,
      'funding_mode': fundingMode?.protoName,
    };
  }

  factory ContractRegistrationRequest.fromJson(Map<String, dynamic> json) {
    return ContractRegistrationRequest(
      contractAddress: json.valueAsString<String?>(
        'contract_address',
        acceptCamelCase: true,
      ),
      gasLimit: json.valueAsBigInt<BigInt?>('gas_limit', acceptCamelCase: true),
      gasPrice: json.valueAsBigInt<BigInt?>('gas_price', acceptCamelCase: true),
      shouldPinContract: json.valueAsBool<bool?>(
        'should_pin_contract',
        acceptCamelCase: true,
      ),
      isMigrationAllowed: json.valueAsBool<bool?>(
        'is_migration_allowed',
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
      fundingMode: json.valueTo<FundingMode?, Object?>(
        key: 'funding_mode',
        parse: (v) => FundingMode.from(v),
      ),
    );
  }

  factory ContractRegistrationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ContractRegistrationRequest(
      contractAddress: decode.getString<String?>(1),
      gasLimit: decode.getBigInt<BigInt?>(2),
      gasPrice: decode.getBigInt<BigInt?>(3),
      shouldPinContract: decode.getBool<bool?>(4),
      isMigrationAllowed: decode.getBool<bool?>(5),
      codeId: decode.getBigInt<BigInt?>(6),
      adminAddress: decode.getString<String?>(7),
      granterAddress: decode.getString<String?>(8),
      fundingMode: decode.getEnum<FundingMode?>(9, FundingMode.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveWasmxV1ContractRegistrationRequest;
}
