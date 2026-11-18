import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/params.dart"
    as injective_peggy_v1_params;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/types.dart"
    as injective_peggy_v1_types;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/msgs.dart"
    as injective_peggy_v1_msgs;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/batch.dart"
    as injective_peggy_v1_batch;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/attestation.dart"
    as injective_peggy_v1_attestation;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/rate_limit.dart"
    as injective_peggy_v1_rate_limit;

/// GenesisState struct
class GenesisState extends CosmosProtoMessage {
  final injective_peggy_v1_params.Params? params;

  final BigInt? lastObservedNonce;

  final List<injective_peggy_v1_types.Valset> valsets;

  final List<injective_peggy_v1_msgs.MsgValsetConfirm> valsetConfirms;

  final List<injective_peggy_v1_batch.OutgoingTxBatch> batches;

  final List<injective_peggy_v1_msgs.MsgConfirmBatch> batchConfirms;

  final List<injective_peggy_v1_attestation.Attestation> attestations;

  final List<injective_peggy_v1_msgs.MsgSetOrchestratorAddresses>
  orchestratorAddresses;

  final List<injective_peggy_v1_types.ERC20ToDenom> erc20ToDenoms;

  final List<injective_peggy_v1_batch.OutgoingTransferTx> unbatchedTransfers;

  final BigInt? lastObservedEthereumHeight;

  final BigInt? lastOutgoingBatchId;

  final BigInt? lastOutgoingPoolId;

  final injective_peggy_v1_types.Valset? lastObservedValset;

  final List<String> ethereumBlacklist;

  final List<injective_peggy_v1_rate_limit.RateLimit> rateLimits;

  final List<injective_peggy_v1_rate_limit.RateLimitTransfers>
  rateLimitTransfers;

  final List<injective_peggy_v1_rate_limit.MintAmount> mintAmounts;

  const GenesisState({
    this.params,
    this.lastObservedNonce,
    this.valsets = const [],
    this.valsetConfirms = const [],
    this.batches = const [],
    this.batchConfirms = const [],
    this.attestations = const [],
    this.orchestratorAddresses = const [],
    this.erc20ToDenoms = const [],
    this.unbatchedTransfers = const [],
    this.lastObservedEthereumHeight,
    this.lastOutgoingBatchId,
    this.lastOutgoingPoolId,
    this.lastObservedValset,
    this.ethereumBlacklist = const [],
    this.rateLimits = const [],
    this.rateLimitTransfers = const [],
    this.mintAmounts = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.uint64(11),
        ProtoFieldConfig.uint64(12),
        ProtoFieldConfig.uint64(13),
        ProtoFieldConfig.message(14, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 15,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 16,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 17,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 18,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    params,
    lastObservedNonce,
    valsets,
    valsetConfirms,
    batches,
    batchConfirms,
    attestations,
    orchestratorAddresses,
    erc20ToDenoms,
    unbatchedTransfers,
    lastObservedEthereumHeight,
    lastOutgoingBatchId,
    lastOutgoingPoolId,
    lastObservedValset,
    ethereumBlacklist,
    rateLimits,
    rateLimitTransfers,
    mintAmounts,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'params': config.encodeMessage(params),
      'last_observed_nonce': config.encodeBigint(lastObservedNonce),
      'valsets': valsets.map((e) => config.encodeMessage(e)).toList(),
      'valset_confirms':
          valsetConfirms.map((e) => config.encodeMessage(e)).toList(),
      'batches': batches.map((e) => config.encodeMessage(e)).toList(),
      'batch_confirms':
          batchConfirms.map((e) => config.encodeMessage(e)).toList(),
      'attestations': attestations.map((e) => config.encodeMessage(e)).toList(),
      'orchestrator_addresses':
          orchestratorAddresses.map((e) => config.encodeMessage(e)).toList(),
      'erc20_to_denoms':
          erc20ToDenoms.map((e) => config.encodeMessage(e)).toList(),
      'unbatched_transfers':
          unbatchedTransfers.map((e) => config.encodeMessage(e)).toList(),
      'last_observed_ethereum_height': config.encodeBigint(
        lastObservedEthereumHeight,
      ),
      'last_outgoing_batch_id': config.encodeBigint(lastOutgoingBatchId),
      'last_outgoing_pool_id': config.encodeBigint(lastOutgoingPoolId),
      'last_observed_valset': config.encodeMessage(lastObservedValset),
      'ethereum_blacklist': ethereumBlacklist.map((e) => e).toList(),
      'rate_limits': rateLimits.map((e) => config.encodeMessage(e)).toList(),
      'rate_limit_transfers':
          rateLimitTransfers.map((e) => config.encodeMessage(e)).toList(),
      'mint_amounts': mintAmounts.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory GenesisState.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return GenesisState(
      params: json.valueTo<injective_peggy_v1_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => injective_peggy_v1_params.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastObservedNonce: json.valueAsBigInt<BigInt?>(
        'last_observed_nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      valsets:
          (json.valueEnsureAsList<dynamic>(
                'valsets',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<injective_peggy_v1_types.Valset, Object>(
                      value: e,
                      parse:
                          (v) => injective_peggy_v1_types.Valset.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      valsetConfirms:
          (json.valueEnsureAsList<dynamic>(
                'valset_confirms',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_msgs.MsgValsetConfirm,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_msgs.MsgValsetConfirm.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      batches:
          (json.valueEnsureAsList<dynamic>(
                'batches',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_batch.OutgoingTxBatch,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_batch.OutgoingTxBatch.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      batchConfirms:
          (json.valueEnsureAsList<dynamic>(
                'batch_confirms',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_msgs.MsgConfirmBatch,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_msgs.MsgConfirmBatch.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      attestations:
          (json.valueEnsureAsList<dynamic>(
                'attestations',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_attestation.Attestation,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_attestation.Attestation.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
      orchestratorAddresses:
          (json.valueEnsureAsList<dynamic>(
                'orchestrator_addresses',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_msgs.MsgSetOrchestratorAddresses,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_msgs
                          .MsgSetOrchestratorAddresses.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      erc20ToDenoms:
          (json.valueEnsureAsList<dynamic>(
                'erc20_to_denoms',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_types.ERC20ToDenom,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_types.ERC20ToDenom.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      unbatchedTransfers:
          (json.valueEnsureAsList<dynamic>(
                'unbatched_transfers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_batch.OutgoingTransferTx,
                  Object
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_batch.OutgoingTransferTx.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                ),
              )
              .toList(),
      lastObservedEthereumHeight: json.valueAsBigInt<BigInt?>(
        'last_observed_ethereum_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastOutgoingBatchId: json.valueAsBigInt<BigInt?>(
        'last_outgoing_batch_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastOutgoingPoolId: json.valueAsBigInt<BigInt?>(
        'last_outgoing_pool_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastObservedValset: json
          .valueTo<injective_peggy_v1_types.Valset?, Object>(
            key: 'last_observed_valset',
            parse:
                (v) => injective_peggy_v1_types.Valset.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      ethereumBlacklist:
          (json.valueEnsureAsList<dynamic>(
            'ethereum_blacklist',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      rateLimits:
          (json.valueEnsureAsList<dynamic>(
                'rate_limits',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_rate_limit.RateLimit,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_rate_limit.RateLimit.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      rateLimitTransfers:
          (json.valueEnsureAsList<dynamic>(
                'rate_limit_transfers',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_rate_limit.RateLimitTransfers,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_rate_limit
                          .RateLimitTransfers.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      mintAmounts:
          (json.valueEnsureAsList<dynamic>(
                'mint_amounts',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_rate_limit.MintAmount,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_rate_limit.MintAmount.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_peggy_v1_params.Params?>(
        1,
        (b) => injective_peggy_v1_params.Params.deserialize(b),
      ),
      lastObservedNonce: decode.getBigInt<BigInt?>(2),
      valsets:
          decode
              .getListOfBytes(3)
              .map((b) => injective_peggy_v1_types.Valset.deserialize(b))
              .toList(),
      valsetConfirms:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_peggy_v1_msgs.MsgValsetConfirm.deserialize(b),
              )
              .toList(),
      batches:
          decode
              .getListOfBytes(5)
              .map(
                (b) => injective_peggy_v1_batch.OutgoingTxBatch.deserialize(b),
              )
              .toList(),
      batchConfirms:
          decode
              .getListOfBytes(6)
              .map(
                (b) => injective_peggy_v1_msgs.MsgConfirmBatch.deserialize(b),
              )
              .toList(),
      attestations:
          decode
              .getListOfBytes(7)
              .map(
                (b) =>
                    injective_peggy_v1_attestation.Attestation.deserialize(b),
              )
              .toList(),
      orchestratorAddresses:
          decode
              .getListOfBytes(8)
              .map(
                (b) => injective_peggy_v1_msgs
                    .MsgSetOrchestratorAddresses.deserialize(b),
              )
              .toList(),
      erc20ToDenoms:
          decode
              .getListOfBytes(9)
              .map((b) => injective_peggy_v1_types.ERC20ToDenom.deserialize(b))
              .toList(),
      unbatchedTransfers:
          decode
              .getListOfBytes(10)
              .map(
                (b) =>
                    injective_peggy_v1_batch.OutgoingTransferTx.deserialize(b),
              )
              .toList(),
      lastObservedEthereumHeight: decode.getBigInt<BigInt?>(11),
      lastOutgoingBatchId: decode.getBigInt<BigInt?>(12),
      lastOutgoingPoolId: decode.getBigInt<BigInt?>(13),
      lastObservedValset: decode.messageTo<injective_peggy_v1_types.Valset?>(
        14,
        (b) => injective_peggy_v1_types.Valset.deserialize(b),
      ),
      ethereumBlacklist: decode.getListOrEmpty<String>(15),
      rateLimits:
          decode
              .getListOfBytes(16)
              .map(
                (b) => injective_peggy_v1_rate_limit.RateLimit.deserialize(b),
              )
              .toList(),
      rateLimitTransfers:
          decode
              .getListOfBytes(17)
              .map(
                (b) => injective_peggy_v1_rate_limit
                    .RateLimitTransfers.deserialize(b),
              )
              .toList(),
      mintAmounts:
          decode
              .getListOfBytes(18)
              .map(
                (b) => injective_peggy_v1_rate_limit.MintAmount.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1GenesisState;
}
