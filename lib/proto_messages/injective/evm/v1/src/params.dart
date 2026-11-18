import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/evm/v1/src/chain_config.dart"
    as injective_evm_v1_chain_config;

/// Params defines the EVM module parameters
class Params extends CosmosProtoMessage {
  /// evm_denom represents the token denomination used to run the EVM state
  /// transitions.
  final String? evmDenom;

  /// enable_create toggles state transitions that use the vm.Create function
  final bool? enableCreate;

  /// enable_call toggles state transitions that use the vm.Call function
  final bool? enableCall;

  /// extra_eips defines the additional EIPs for the vm.Config
  final List<BigInt> extraEips;

  /// chain_config defines the EVM chain configuration parameters
  final injective_evm_v1_chain_config.ChainConfig? chainConfig;

  /// allow_unprotected_txs defines if replay-protected (i.e non EIP155
  /// signed) transactions can be executed on the state machine.
  final bool? allowUnprotectedTxs;

  /// list of ETH addresses that are allowed to deploy contracts. Only relevant
  /// if permissioned is true.
  final List<String> authorizedDeployers;

  /// make contract deployment permissioned, such that only accounts listed in
  /// authorized_deployers are allowed to deploy contracts.
  final bool? permissioned;

  const Params({
    this.evmDenom,
    this.enableCreate,
    this.enableCall,
    this.extraEips = const [],
    this.chainConfig,
    this.allowUnprotectedTxs,
    this.authorizedDeployers = const [],
    this.permissioned,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bool(2, options: const []),
        ProtoFieldConfig.bool(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.int64,
          options: const [],
        ),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.bool(6),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.bool(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    evmDenom,
    enableCreate,
    enableCall,
    extraEips,
    chainConfig,
    allowUnprotectedTxs,
    authorizedDeployers,
    permissioned,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'evm_denom': evmDenom,
      'enable_create': enableCreate,
      'enable_call': enableCall,
      'extra_eips': extraEips.map((e) => config.encodeBigint(e)).toList(),
      'chain_config': config.encodeMessage(chainConfig),
      'allow_unprotected_txs': allowUnprotectedTxs,
      'authorized_deployers': authorizedDeployers.map((e) => e).toList(),
      'permissioned': permissioned,
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      evmDenom: json.valueAsString<String?>(
        'evm_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      enableCreate: json.valueAsBool<bool?>(
        'enable_create',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      enableCall: json.valueAsBool<bool?>(
        'enable_call',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      extraEips:
          (json.valueEnsureAsList<dynamic>(
            'extra_eips',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
      chainConfig: json
          .valueTo<injective_evm_v1_chain_config.ChainConfig?, Object>(
            key: 'chain_config',
            parse:
                (v) => injective_evm_v1_chain_config.ChainConfig.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      allowUnprotectedTxs: json.valueAsBool<bool?>(
        'allow_unprotected_txs',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      authorizedDeployers:
          (json.valueEnsureAsList<dynamic>(
            'authorized_deployers',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      permissioned: json.valueAsBool<bool?>(
        'permissioned',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      evmDenom: decode.getString<String?>(1),
      enableCreate: decode.getBool<bool?>(2),
      enableCall: decode.getBool<bool?>(3),
      extraEips: decode.getListOrEmpty<BigInt>(4),
      chainConfig: decode.messageTo<injective_evm_v1_chain_config.ChainConfig?>(
        5,
        (b) => injective_evm_v1_chain_config.ChainConfig.deserialize(b),
      ),
      allowUnprotectedTxs: decode.getBool<bool?>(6),
      authorizedDeployers: decode.getListOrEmpty<String>(7),
      permissioned: decode.getBool<bool?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1Params;
}
