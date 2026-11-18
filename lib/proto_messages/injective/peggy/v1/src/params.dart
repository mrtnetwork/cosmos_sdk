import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Params represent the peggy genesis and store parameters
/// peggy_id:
/// a random 32 byte value to prevent signature reuse, for example if the
/// cosmos validators decided to use the same Ethereum keys for another chain
/// also running Peggy we would not want it to be possible to play a deposit
/// from chain A back on chain B's peggy. This value IS USED ON ETHEREUM so
/// it must be set in your genesis.json before launch and not changed after
/// deploying Peggy
///
/// contract_hash:
/// the code hash of a known good version of the Peggy contract
/// solidity code. This can be used to verify the correct version
/// of the contract has been deployed. This is a reference value for
/// goernance action only it is never read by any Peggy code
///
/// bridge_ethereum_address:
/// is address of the bridge contract on the Ethereum side, this is a
/// reference value for governance only and is not actually used by any
/// Peggy code
///
/// bridge_chain_id:
/// the unique identifier of the Ethereum chain, this is a reference value
/// only and is not actually used by any Peggy code
///
/// These reference values may be used by future Peggy client implemetnations
/// to allow for saftey features or convenience features like the peggy address
/// in your relayer. A relayer would require a configured peggy address if
/// governance had not set the address on the chain it was relaying for.
///
/// signed_valsets_window
/// signed_batches_window
/// signed_claims_window
///
/// These values represent the time in blocks that a validator has to submit
/// a signature for a batch or valset, or to submit a claim for a particular
/// attestation nonce. In the case of attestations this clock starts when the
/// attestation is created, but only allows for slashing once the event has
/// passed
///
/// target_batch_timeout:
///
/// This is the 'target' value for when batches time out, this is a target
/// becuase Ethereum is a probabalistic chain and you can't say for sure what the
/// block frequency is ahead of time.
///
/// average_block_time
/// average_ethereum_block_time
///
/// These values are the average Cosmos block time and Ethereum block time
/// repsectively and they are used to copute what the target batch timeout is. It
/// is important that governance updates these in case of any major, prolonged
/// change in the time it takes to produce a block
///
/// slash_fraction_valset
/// slash_fraction_batch
/// slash_fraction_claim
/// slash_fraction_conflicting_claim
///
/// The slashing fractions for the various peggy related slashing conditions. The
/// first three refer to not submitting a particular message, the third for
/// submitting a different claim for the same Ethereum event
///
/// unbond_slashing_valsets_window
///
/// The unbond slashing valsets window is used to determine how many blocks after
/// starting to unbond a validator needs to continue signing blocks. The goal of
/// this paramater is that when a validator leaves the set, if their leaving
/// creates enough change in the validator set to justify an update they will
/// sign a validator set update for the Ethereum bridge that does not include
/// themselves. Allowing us to remove them from the Ethereum bridge and replace
/// them with the new set gracefully.
///
/// valset_reward
///
/// Valset rewards are the amount of tokens this chain issues to relayers of
/// validator sets. These can be any ERC20 token in the bridge, but it's strongly
/// advised that chains use only Cosmos originated tokens, which the bridge
/// effectively mints on Ethereum. If you run out of the token you are using for
/// validator set rewards valset updates will fail and the bridge will be
/// vulnerable to highjacking. For these paramaters the zero values are special
/// and indicate not to attempt any reward. This is the default for
/// bootstrapping.
class Params extends CosmosProtoMessage {
  final String? peggyId;

  final String? contractSourceHash;

  final String? bridgeEthereumAddress;

  final BigInt? bridgeChainId;

  final BigInt? signedValsetsWindow;

  final BigInt? signedBatchesWindow;

  final BigInt? signedClaimsWindow;

  final BigInt? targetBatchTimeout;

  final BigInt? averageBlockTime;

  final BigInt? averageEthereumBlockTime;

  final BuBytes? slashFractionValset;

  final BuBytes? slashFractionBatch;

  final BuBytes? slashFractionClaim;

  final BuBytes? slashFractionConflictingClaim;

  final BigInt? unbondSlashingValsetsWindow;

  final BuBytes? slashFractionBadEthSignature;

  final String? cosmosCoinDenom;

  final String? cosmosCoinErc20Contract;

  final bool? claimSlashingEnabled;

  final BigInt? bridgeContractStartHeight;

  final cosmos_base_v1beta1_coin.Coin? valsetReward;

  final List<String> admins;

  /// address for receiving Peggy Deposits from sanctioned Ethereum addresses
  final String? segregatedWalletAddress;

  Params({
    this.peggyId,
    this.contractSourceHash,
    this.bridgeEthereumAddress,
    this.bridgeChainId,
    this.signedValsetsWindow,
    this.signedBatchesWindow,
    this.signedClaimsWindow,
    this.targetBatchTimeout,
    this.averageBlockTime,
    this.averageEthereumBlockTime,
    List<int>? slashFractionValset,
    List<int>? slashFractionBatch,
    List<int>? slashFractionClaim,
    List<int>? slashFractionConflictingClaim,
    this.unbondSlashingValsetsWindow,
    List<int>? slashFractionBadEthSignature,
    this.cosmosCoinDenom,
    this.cosmosCoinErc20Contract,
    this.claimSlashingEnabled,
    this.bridgeContractStartHeight,
    this.valsetReward,
    this.admins = const [],
    this.segregatedWalletAddress,
  }) : slashFractionValset = slashFractionValset?.asImmutableBytes,
       slashFractionBatch = slashFractionBatch?.asImmutableBytes,
       slashFractionClaim = slashFractionClaim?.asImmutableBytes,
       slashFractionConflictingClaim =
           slashFractionConflictingClaim?.asImmutableBytes,
       slashFractionBadEthSignature =
           slashFractionBadEthSignature?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "peggy/Params")],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.uint64(8),
        ProtoFieldConfig.uint64(9),
        ProtoFieldConfig.uint64(10),
        ProtoFieldConfig.bytes(
          11,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bytes(
          12,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bytes(
          13,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bytes(
          14,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(15),
        ProtoFieldConfig.bytes(
          16,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.string(17),
        ProtoFieldConfig.string(18),
        ProtoFieldConfig.bool(
          19,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(20),
        ProtoFieldConfig.message(21, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 22,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.string(23),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    peggyId,
    contractSourceHash,
    bridgeEthereumAddress,
    bridgeChainId,
    signedValsetsWindow,
    signedBatchesWindow,
    signedClaimsWindow,
    targetBatchTimeout,
    averageBlockTime,
    averageEthereumBlockTime,
    slashFractionValset,
    slashFractionBatch,
    slashFractionClaim,
    slashFractionConflictingClaim,
    unbondSlashingValsetsWindow,
    slashFractionBadEthSignature,
    cosmosCoinDenom,
    cosmosCoinErc20Contract,
    claimSlashingEnabled,
    bridgeContractStartHeight,
    valsetReward,
    admins,
    segregatedWalletAddress,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'peggy_id': peggyId,
      'contract_source_hash': contractSourceHash,
      'bridge_ethereum_address': bridgeEthereumAddress,
      'bridge_chain_id': config.encodeBigint(bridgeChainId),
      'signed_valsets_window': config.encodeBigint(signedValsetsWindow),
      'signed_batches_window': config.encodeBigint(signedBatchesWindow),
      'signed_claims_window': config.encodeBigint(signedClaimsWindow),
      'target_batch_timeout': config.encodeBigint(targetBatchTimeout),
      'average_block_time': config.encodeBigint(averageBlockTime),
      'average_ethereum_block_time': config.encodeBigint(
        averageEthereumBlockTime,
      ),
      'slash_fraction_valset': config.encodeBinary(slashFractionValset),
      'slash_fraction_batch': config.encodeBinary(slashFractionBatch),
      'slash_fraction_claim': config.encodeBinary(slashFractionClaim),
      'slash_fraction_conflicting_claim': config.encodeBinary(
        slashFractionConflictingClaim,
      ),
      'unbond_slashing_valsets_window': config.encodeBigint(
        unbondSlashingValsetsWindow,
      ),
      'slash_fraction_bad_eth_signature': config.encodeBinary(
        slashFractionBadEthSignature,
      ),
      'cosmos_coin_denom': cosmosCoinDenom,
      'cosmos_coin_erc20_contract': cosmosCoinErc20Contract,
      'claim_slashing_enabled': claimSlashingEnabled,
      'bridge_contract_start_height': config.encodeBigint(
        bridgeContractStartHeight,
      ),
      'valset_reward': config.encodeMessage(valsetReward),
      'admins': admins.map((e) => e).toList(),
      'segregated_wallet_address': segregatedWalletAddress,
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      peggyId: json.valueAsString<String?>(
        'peggy_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      contractSourceHash: json.valueAsString<String?>(
        'contract_source_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bridgeEthereumAddress: json.valueAsString<String?>(
        'bridge_ethereum_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bridgeChainId: json.valueAsBigInt<BigInt?>(
        'bridge_chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signedValsetsWindow: json.valueAsBigInt<BigInt?>(
        'signed_valsets_window',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signedBatchesWindow: json.valueAsBigInt<BigInt?>(
        'signed_batches_window',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signedClaimsWindow: json.valueAsBigInt<BigInt?>(
        'signed_claims_window',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      targetBatchTimeout: json.valueAsBigInt<BigInt?>(
        'target_batch_timeout',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      averageBlockTime: json.valueAsBigInt<BigInt?>(
        'average_block_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      averageEthereumBlockTime: json.valueAsBigInt<BigInt?>(
        'average_ethereum_block_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      slashFractionValset: config.decodeBinary<List<int>?>(
        json.valueAs(
          'slash_fraction_valset',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      slashFractionBatch: config.decodeBinary<List<int>?>(
        json.valueAs(
          'slash_fraction_batch',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      slashFractionClaim: config.decodeBinary<List<int>?>(
        json.valueAs(
          'slash_fraction_claim',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      slashFractionConflictingClaim: config.decodeBinary<List<int>?>(
        json.valueAs(
          'slash_fraction_conflicting_claim',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      unbondSlashingValsetsWindow: json.valueAsBigInt<BigInt?>(
        'unbond_slashing_valsets_window',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      slashFractionBadEthSignature: config.decodeBinary<List<int>?>(
        json.valueAs(
          'slash_fraction_bad_eth_signature',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      cosmosCoinDenom: json.valueAsString<String?>(
        'cosmos_coin_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      cosmosCoinErc20Contract: json.valueAsString<String?>(
        'cosmos_coin_erc20_contract',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      claimSlashingEnabled: json.valueAsBool<bool?>(
        'claim_slashing_enabled',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bridgeContractStartHeight: json.valueAsBigInt<BigInt?>(
        'bridge_contract_start_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      valsetReward: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'valset_reward',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      admins:
          (json.valueEnsureAsList<dynamic>(
            'admins',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      segregatedWalletAddress: json.valueAsString<String?>(
        'segregated_wallet_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      peggyId: decode.getString<String?>(1),
      contractSourceHash: decode.getString<String?>(2),
      bridgeEthereumAddress: decode.getString<String?>(3),
      bridgeChainId: decode.getBigInt<BigInt?>(4),
      signedValsetsWindow: decode.getBigInt<BigInt?>(5),
      signedBatchesWindow: decode.getBigInt<BigInt?>(6),
      signedClaimsWindow: decode.getBigInt<BigInt?>(7),
      targetBatchTimeout: decode.getBigInt<BigInt?>(8),
      averageBlockTime: decode.getBigInt<BigInt?>(9),
      averageEthereumBlockTime: decode.getBigInt<BigInt?>(10),
      slashFractionValset: decode.getBytes<List<int>?>(11),
      slashFractionBatch: decode.getBytes<List<int>?>(12),
      slashFractionClaim: decode.getBytes<List<int>?>(13),
      slashFractionConflictingClaim: decode.getBytes<List<int>?>(14),
      unbondSlashingValsetsWindow: decode.getBigInt<BigInt?>(15),
      slashFractionBadEthSignature: decode.getBytes<List<int>?>(16),
      cosmosCoinDenom: decode.getString<String?>(17),
      cosmosCoinErc20Contract: decode.getString<String?>(18),
      claimSlashingEnabled: decode.getBool<bool?>(19),
      bridgeContractStartHeight: decode.getBigInt<BigInt?>(20),
      valsetReward: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        21,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      admins: decode.getListOrEmpty<String>(22),
      segregatedWalletAddress: decode.getString<String?>(23),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1Params;
}
