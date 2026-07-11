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
  Map<String, dynamic> toJson() {
    return {
      'params': params?.toJson(),
      'last_observed_nonce': lastObservedNonce?.toString(),
      'valsets': valsets.map((e) => e.toJson()).toList(),
      'valset_confirms': valsetConfirms.map((e) => e.toJson()).toList(),
      'batches': batches.map((e) => e.toJson()).toList(),
      'batch_confirms': batchConfirms.map((e) => e.toJson()).toList(),
      'attestations': attestations.map((e) => e.toJson()).toList(),
      'orchestrator_addresses':
          orchestratorAddresses.map((e) => e.toJson()).toList(),
      'erc20_to_denoms': erc20ToDenoms.map((e) => e.toJson()).toList(),
      'unbatched_transfers': unbatchedTransfers.map((e) => e.toJson()).toList(),
      'last_observed_ethereum_height': lastObservedEthereumHeight?.toString(),
      'last_outgoing_batch_id': lastOutgoingBatchId?.toString(),
      'last_outgoing_pool_id': lastOutgoingPoolId?.toString(),
      'last_observed_valset': lastObservedValset?.toJson(),
      'ethereum_blacklist': ethereumBlacklist.map((e) => e).toList(),
      'rate_limits': rateLimits.map((e) => e.toJson()).toList(),
      'rate_limit_transfers':
          rateLimitTransfers.map((e) => e.toJson()).toList(),
      'mint_amounts': mintAmounts.map((e) => e.toJson()).toList(),
    };
  }

  factory GenesisState.fromJson(Map<String, dynamic> json) {
    return GenesisState(
      params: json
          .valueTo<injective_peggy_v1_params.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => injective_peggy_v1_params.Params.fromJson(v),
            acceptCamelCase: true,
          ),
      lastObservedNonce: json.valueAsBigInt<BigInt?>(
        'last_observed_nonce',
        acceptCamelCase: true,
      ),
      valsets:
          (json.valueEnsureAsList<dynamic>('valsets', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_types.Valset,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => injective_peggy_v1_types.Valset.fromJson(v),
                ),
              )
              .toList(),
      valsetConfirms:
          (json.valueEnsureAsList<dynamic>(
                'valset_confirms',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_msgs.MsgValsetConfirm,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_msgs.MsgValsetConfirm.fromJson(v),
                ),
              )
              .toList(),
      batches:
          (json.valueEnsureAsList<dynamic>('batches', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_batch.OutgoingTxBatch,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_batch.OutgoingTxBatch.fromJson(v),
                ),
              )
              .toList(),
      batchConfirms:
          (json.valueEnsureAsList<dynamic>(
                'batch_confirms',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_msgs.MsgConfirmBatch,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_msgs.MsgConfirmBatch.fromJson(v),
                ),
              )
              .toList(),
      attestations:
          (json.valueEnsureAsList<dynamic>(
                'attestations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_attestation.Attestation,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_attestation
                          .Attestation.fromJson(v),
                ),
              )
              .toList(),
      orchestratorAddresses:
          (json.valueEnsureAsList<dynamic>(
                'orchestrator_addresses',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_msgs.MsgSetOrchestratorAddresses,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_msgs
                          .MsgSetOrchestratorAddresses.fromJson(v),
                ),
              )
              .toList(),
      erc20ToDenoms:
          (json.valueEnsureAsList<dynamic>(
                'erc20_to_denoms',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_types.ERC20ToDenom,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_types.ERC20ToDenom.fromJson(v),
                ),
              )
              .toList(),
      unbatchedTransfers:
          (json.valueEnsureAsList<dynamic>(
                'unbatched_transfers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_batch.OutgoingTransferTx,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_batch
                          .OutgoingTransferTx.fromJson(v),
                ),
              )
              .toList(),
      lastObservedEthereumHeight: json.valueAsBigInt<BigInt?>(
        'last_observed_ethereum_height',
        acceptCamelCase: true,
      ),
      lastOutgoingBatchId: json.valueAsBigInt<BigInt?>(
        'last_outgoing_batch_id',
        acceptCamelCase: true,
      ),
      lastOutgoingPoolId: json.valueAsBigInt<BigInt?>(
        'last_outgoing_pool_id',
        acceptCamelCase: true,
      ),
      lastObservedValset: json
          .valueTo<injective_peggy_v1_types.Valset?, Map<String, dynamic>>(
            key: 'last_observed_valset',
            parse: (v) => injective_peggy_v1_types.Valset.fromJson(v),
            acceptCamelCase: true,
          ),
      ethereumBlacklist:
          (json.valueEnsureAsList<dynamic>(
            'ethereum_blacklist',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      rateLimits:
          (json.valueEnsureAsList<dynamic>(
                'rate_limits',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_rate_limit.RateLimit,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_rate_limit.RateLimit.fromJson(v),
                ),
              )
              .toList(),
      rateLimitTransfers:
          (json.valueEnsureAsList<dynamic>(
                'rate_limit_transfers',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_rate_limit.RateLimitTransfers,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_peggy_v1_rate_limit
                          .RateLimitTransfers.fromJson(v),
                ),
              )
              .toList(),
      mintAmounts:
          (json.valueEnsureAsList<dynamic>(
                'mint_amounts',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_rate_limit.MintAmount,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_rate_limit.MintAmount.fromJson(v),
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
