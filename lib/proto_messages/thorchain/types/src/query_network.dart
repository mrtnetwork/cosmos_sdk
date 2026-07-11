import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryNetworkRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryNetworkResponse> {
  final String? height;

  const QueryNetworkRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/network",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryNetworkRequest.fromJson(Map<String, dynamic> json) {
    return QueryNetworkRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryNetworkRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNetworkRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryNetworkRequest;
  @override
  QueryNetworkResponse onQueryResponse(List<int> bytes) {
    return QueryNetworkResponse.deserialize(bytes);
  }

  @override
  QueryNetworkResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryNetworkResponse.fromJson(json);
  }
}

class QueryNetworkResponse extends CosmosProtoMessage {
  /// total amount of RUNE awarded to node operators
  final String? bondRewardRune;

  /// total bonded RUNE
  final String? totalBondUnits;

  /// RUNE in Available pools (equal in value to the Assets in those pools)
  final String? availablePoolsRune;

  /// RUNE value of Layer 1 Assets in vaults
  final String? vaultsLiquidityRune;

  /// effective security bond used to determine maximum pooled RUNE
  final String? effectiveSecurityBond;

  /// total reserve RUNE
  final String? totalReserve;

  /// Returns true if there exist RetiringVaults which have not finished
  /// migrating funds to new ActiveVaults
  final bool? vaultsMigrating;

  /// Sum of the gas the network has spent to send outbounds
  final String? gasSpentRune;

  /// Sum of the gas withheld from users to cover outbound gas
  final String? gasWithheldRune;

  /// Current outbound fee multiplier, in basis points
  final String? outboundFeeMultiplier;

  /// the outbound transaction fee in rune, converted from the
  /// NativeOutboundFeeUSD mimir (after USD fees are enabled)
  final String? nativeOutboundFeeRune;

  /// the native transaction fee in rune, converted from the
  /// NativeTransactionFeeUSD mimir (after USD fees are enabled)
  final String? nativeTxFeeRune;

  /// the thorname register fee in rune, converted from the TNSRegisterFeeUSD
  /// mimir (after USD fees are enabled)
  final String? tnsRegisterFeeRune;

  /// the thorname fee per block in rune, converted from the TNSFeePerBlockUSD
  /// mimir (after USD fees are enabled)
  final String? tnsFeePerBlockRune;

  /// the rune price in tor
  final String? runePriceInTor;

  /// the tor price in rune
  final String? torPriceInRune;

  /// indicator if all anchor chains are halted
  final bool? torPriceHalted;

  /// indicates whether an active Asgard vault currently has spendable XMR funds
  final bool? xmrActiveVaultReady;

  const QueryNetworkResponse({
    this.bondRewardRune,
    this.totalBondUnits,
    this.availablePoolsRune,
    this.vaultsLiquidityRune,
    this.effectiveSecurityBond,
    this.totalReserve,
    this.vaultsMigrating,
    this.gasSpentRune,
    this.gasWithheldRune,
    this.outboundFeeMultiplier,
    this.nativeOutboundFeeRune,
    this.nativeTxFeeRune,
    this.tnsRegisterFeeRune,
    this.tnsFeePerBlockRune,
    this.runePriceInTor,
    this.torPriceInRune,
    this.torPriceHalted,
    this.xmrActiveVaultReady,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.bool(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(13, options: const []),
        ProtoFieldConfig.string(14, options: const []),
        ProtoFieldConfig.bool(17, options: const []),
        ProtoFieldConfig.bool(18, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bondRewardRune,
    totalBondUnits,
    availablePoolsRune,
    vaultsLiquidityRune,
    effectiveSecurityBond,
    totalReserve,
    vaultsMigrating,
    gasSpentRune,
    gasWithheldRune,
    outboundFeeMultiplier,
    nativeOutboundFeeRune,
    nativeTxFeeRune,
    tnsRegisterFeeRune,
    tnsFeePerBlockRune,
    runePriceInTor,
    torPriceInRune,
    torPriceHalted,
    xmrActiveVaultReady,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bond_reward_rune': bondRewardRune,
      'total_bond_units': totalBondUnits,
      'available_pools_rune': availablePoolsRune,
      'vaults_liquidity_rune': vaultsLiquidityRune,
      'effective_security_bond': effectiveSecurityBond,
      'total_reserve': totalReserve,
      'vaults_migrating': vaultsMigrating,
      'gas_spent_rune': gasSpentRune,
      'gas_withheld_rune': gasWithheldRune,
      'outbound_fee_multiplier': outboundFeeMultiplier,
      'native_outbound_fee_rune': nativeOutboundFeeRune,
      'native_tx_fee_rune': nativeTxFeeRune,
      'tns_register_fee_rune': tnsRegisterFeeRune,
      'tns_fee_per_block_rune': tnsFeePerBlockRune,
      'rune_price_in_tor': runePriceInTor,
      'tor_price_in_rune': torPriceInRune,
      'tor_price_halted': torPriceHalted,
      'xmr_active_vault_ready': xmrActiveVaultReady,
    };
  }

  factory QueryNetworkResponse.fromJson(Map<String, dynamic> json) {
    return QueryNetworkResponse(
      bondRewardRune: json.valueAsString<String?>(
        'bond_reward_rune',
        acceptCamelCase: true,
      ),
      totalBondUnits: json.valueAsString<String?>(
        'total_bond_units',
        acceptCamelCase: true,
      ),
      availablePoolsRune: json.valueAsString<String?>(
        'available_pools_rune',
        acceptCamelCase: true,
      ),
      vaultsLiquidityRune: json.valueAsString<String?>(
        'vaults_liquidity_rune',
        acceptCamelCase: true,
      ),
      effectiveSecurityBond: json.valueAsString<String?>(
        'effective_security_bond',
        acceptCamelCase: true,
      ),
      totalReserve: json.valueAsString<String?>(
        'total_reserve',
        acceptCamelCase: true,
      ),
      vaultsMigrating: json.valueAsBool<bool?>(
        'vaults_migrating',
        acceptCamelCase: true,
      ),
      gasSpentRune: json.valueAsString<String?>(
        'gas_spent_rune',
        acceptCamelCase: true,
      ),
      gasWithheldRune: json.valueAsString<String?>(
        'gas_withheld_rune',
        acceptCamelCase: true,
      ),
      outboundFeeMultiplier: json.valueAsString<String?>(
        'outbound_fee_multiplier',
        acceptCamelCase: true,
      ),
      nativeOutboundFeeRune: json.valueAsString<String?>(
        'native_outbound_fee_rune',
        acceptCamelCase: true,
      ),
      nativeTxFeeRune: json.valueAsString<String?>(
        'native_tx_fee_rune',
        acceptCamelCase: true,
      ),
      tnsRegisterFeeRune: json.valueAsString<String?>(
        'tns_register_fee_rune',
        acceptCamelCase: true,
      ),
      tnsFeePerBlockRune: json.valueAsString<String?>(
        'tns_fee_per_block_rune',
        acceptCamelCase: true,
      ),
      runePriceInTor: json.valueAsString<String?>(
        'rune_price_in_tor',
        acceptCamelCase: true,
      ),
      torPriceInRune: json.valueAsString<String?>(
        'tor_price_in_rune',
        acceptCamelCase: true,
      ),
      torPriceHalted: json.valueAsBool<bool?>(
        'tor_price_halted',
        acceptCamelCase: true,
      ),
      xmrActiveVaultReady: json.valueAsBool<bool?>(
        'xmr_active_vault_ready',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryNetworkResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryNetworkResponse(
      bondRewardRune: decode.getString<String?>(1),
      totalBondUnits: decode.getString<String?>(2),
      availablePoolsRune: decode.getString<String?>(15),
      vaultsLiquidityRune: decode.getString<String?>(16),
      effectiveSecurityBond: decode.getString<String?>(3),
      totalReserve: decode.getString<String?>(4),
      vaultsMigrating: decode.getBool<bool?>(5),
      gasSpentRune: decode.getString<String?>(6),
      gasWithheldRune: decode.getString<String?>(7),
      outboundFeeMultiplier: decode.getString<String?>(8),
      nativeOutboundFeeRune: decode.getString<String?>(9),
      nativeTxFeeRune: decode.getString<String?>(10),
      tnsRegisterFeeRune: decode.getString<String?>(11),
      tnsFeePerBlockRune: decode.getString<String?>(12),
      runePriceInTor: decode.getString<String?>(13),
      torPriceInRune: decode.getString<String?>(14),
      torPriceHalted: decode.getBool<bool?>(17),
      xmrActiveVaultReady: decode.getBool<bool?>(18),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryNetworkResponse;
}
