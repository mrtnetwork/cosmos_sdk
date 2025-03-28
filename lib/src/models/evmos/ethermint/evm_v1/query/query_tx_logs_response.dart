import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/messages/log.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

/// QueryTraceTxResponse defines TraceTx response
class EvmosEthermintEVMV1QueryTxLogsResponse extends CosmosMessage {
  /// logs represents the ethereum logs generated from the given transaction.
  final List<EvmosEthermintEVMV1Log> logs;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  EvmosEthermintEVMV1QueryTxLogsResponse(
      {required List<EvmosEthermintEVMV1Log> logs, this.pagination})
      : logs = logs.immutable;
  factory EvmosEthermintEVMV1QueryTxLogsResponse.fromJson(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1QueryTxLogsResponse(
      logs: (json["logs"] as List?)
              ?.map((e) => EvmosEthermintEVMV1Log.fromJson(e))
              .toList() ??
          [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromJson(json["pagination"]),
    );
  }
  factory EvmosEthermintEVMV1QueryTxLogsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryTxLogsResponse(
        logs: decode
            .getFields<List<int>>(1)
            .map((e) => EvmosEthermintEVMV1Log.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "logs": logs.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.txLogsResponse;

  @override
  List get values => [logs, pagination];
}
