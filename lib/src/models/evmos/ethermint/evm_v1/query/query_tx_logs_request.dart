import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_tx_logs_response.dart';

/// QueryTxLogsRequest is the request type for the Query/TxLogs RPC method.
class EvmosEthermintEVMV1QueryTxLogsRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryTxLogsResponse> {
  /// hash is the ethereum transaction hex hash to query the logs for.
  final String hash;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;

  EvmosEthermintEVMV1QueryTxLogsRequest({
    required this.hash,
    required this.pagination,
  });
  factory EvmosEthermintEVMV1QueryTxLogsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryTxLogsRequest(
      hash: decode.getField(1),
      pagination: decode
          .getResult(2)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"hash": hash, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.txLogsRequest;

  @override
  List get values => [hash, pagination];

  @override
  Map<String, String?> get queryParameters =>
      throw DartCosmosSdkPluginException(
        "Unsuported method. use grpc method instead rpc.",
      );
  @override
  EvmosEthermintEVMV1QueryTxLogsResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryTxLogsResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryTxLogsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    throw UnimplementedError();
  }
}
