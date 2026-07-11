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

  final List<int>? slashFractionValset;

  final List<int>? slashFractionBatch;

  final List<int>? slashFractionClaim;

  final List<int>? slashFractionConflictingClaim;

  final BigInt? unbondSlashingValsetsWindow;

  final List<int>? slashFractionBadEthSignature;

  final String? cosmosCoinDenom;

  final String? cosmosCoinErc20Contract;

  final bool? claimSlashingEnabled;

  final BigInt? bridgeContractStartHeight;

  final cosmos_base_v1beta1_coin.Coin? valsetReward;

  final List<String> admins;

  /// address for receiving Peggy Deposits from sanctioned Ethereum addresses
  final String? segregatedWalletAddress;

  const Params({
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
    this.slashFractionValset,
    this.slashFractionBatch,
    this.slashFractionClaim,
    this.slashFractionConflictingClaim,
    this.unbondSlashingValsetsWindow,
    this.slashFractionBadEthSignature,
    this.cosmosCoinDenom,
    this.cosmosCoinErc20Contract,
    this.claimSlashingEnabled,
    this.bridgeContractStartHeight,
    this.valsetReward,
    this.admins = const [],
    this.segregatedWalletAddress,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'peggy_id': peggyId,
      'contract_source_hash': contractSourceHash,
      'bridge_ethereum_address': bridgeEthereumAddress,
      'bridge_chain_id': bridgeChainId?.toString(),
      'signed_valsets_window': signedValsetsWindow?.toString(),
      'signed_batches_window': signedBatchesWindow?.toString(),
      'signed_claims_window': signedClaimsWindow?.toString(),
      'target_batch_timeout': targetBatchTimeout?.toString(),
      'average_block_time': averageBlockTime?.toString(),
      'average_ethereum_block_time': averageEthereumBlockTime?.toString(),
      'slash_fraction_valset': switch (slashFractionValset) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'slash_fraction_batch': switch (slashFractionBatch) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'slash_fraction_claim': switch (slashFractionClaim) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'slash_fraction_conflicting_claim':
          switch (slashFractionConflictingClaim) {
            List<int> bytes => StringUtils.decode(
              bytes,
              encoding: StringEncoding.base64,
            ),
            _ => null,
          },
      'unbond_slashing_valsets_window': unbondSlashingValsetsWindow?.toString(),
      'slash_fraction_bad_eth_signature':
          switch (slashFractionBadEthSignature) {
            List<int> bytes => StringUtils.decode(
              bytes,
              encoding: StringEncoding.base64,
            ),
            _ => null,
          },
      'cosmos_coin_denom': cosmosCoinDenom,
      'cosmos_coin_erc20_contract': cosmosCoinErc20Contract,
      'claim_slashing_enabled': claimSlashingEnabled,
      'bridge_contract_start_height': bridgeContractStartHeight?.toString(),
      'valset_reward': valsetReward?.toJson(),
      'admins': admins.map((e) => e).toList(),
      'segregated_wallet_address': segregatedWalletAddress,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      peggyId: json.valueAsString<String?>('peggy_id', acceptCamelCase: true),
      contractSourceHash: json.valueAsString<String?>(
        'contract_source_hash',
        acceptCamelCase: true,
      ),
      bridgeEthereumAddress: json.valueAsString<String?>(
        'bridge_ethereum_address',
        acceptCamelCase: true,
      ),
      bridgeChainId: json.valueAsBigInt<BigInt?>(
        'bridge_chain_id',
        acceptCamelCase: true,
      ),
      signedValsetsWindow: json.valueAsBigInt<BigInt?>(
        'signed_valsets_window',
        acceptCamelCase: true,
      ),
      signedBatchesWindow: json.valueAsBigInt<BigInt?>(
        'signed_batches_window',
        acceptCamelCase: true,
      ),
      signedClaimsWindow: json.valueAsBigInt<BigInt?>(
        'signed_claims_window',
        acceptCamelCase: true,
      ),
      targetBatchTimeout: json.valueAsBigInt<BigInt?>(
        'target_batch_timeout',
        acceptCamelCase: true,
      ),
      averageBlockTime: json.valueAsBigInt<BigInt?>(
        'average_block_time',
        acceptCamelCase: true,
      ),
      averageEthereumBlockTime: json.valueAsBigInt<BigInt?>(
        'average_ethereum_block_time',
        acceptCamelCase: true,
      ),
      slashFractionValset: json.valueAsBytes<List<int>?>(
        'slash_fraction_valset',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      slashFractionBatch: json.valueAsBytes<List<int>?>(
        'slash_fraction_batch',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      slashFractionClaim: json.valueAsBytes<List<int>?>(
        'slash_fraction_claim',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      slashFractionConflictingClaim: json.valueAsBytes<List<int>?>(
        'slash_fraction_conflicting_claim',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      unbondSlashingValsetsWindow: json.valueAsBigInt<BigInt?>(
        'unbond_slashing_valsets_window',
        acceptCamelCase: true,
      ),
      slashFractionBadEthSignature: json.valueAsBytes<List<int>?>(
        'slash_fraction_bad_eth_signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      cosmosCoinDenom: json.valueAsString<String?>(
        'cosmos_coin_denom',
        acceptCamelCase: true,
      ),
      cosmosCoinErc20Contract: json.valueAsString<String?>(
        'cosmos_coin_erc20_contract',
        acceptCamelCase: true,
      ),
      claimSlashingEnabled: json.valueAsBool<bool?>(
        'claim_slashing_enabled',
        acceptCamelCase: true,
      ),
      bridgeContractStartHeight: json.valueAsBigInt<BigInt?>(
        'bridge_contract_start_height',
        acceptCamelCase: true,
      ),
      valsetReward: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'valset_reward',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      admins:
          (json.valueEnsureAsList<dynamic>(
            'admins',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      segregatedWalletAddress: json.valueAsString<String?>(
        'segregated_wallet_address',
        acceptCamelCase: true,
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
