import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_fee_tokens_response.dart';

class OsmosisTxfeesQueryFeeTokensRequest extends CosmosMessage
    with
        QueryMessage<OsmosisTxfeesQueryFeeTokensResponse>,
        RPCMessage<OsmosisTxfeesQueryFeeTokensResponse> {
  const OsmosisTxfeesQueryFeeTokensRequest();
  factory OsmosisTxfeesQueryFeeTokensRequest.deserialize(List<int> bytes) {
    return const OsmosisTxfeesQueryFeeTokensRequest();
  }
  factory OsmosisTxfeesQueryFeeTokensRequest.fromRpc(
      Map<String, dynamic> json) {
    return const OsmosisTxfeesQueryFeeTokensRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisTxfeesV1beta1Types.queryFeeTokensRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisTxfeesQueryFeeTokensResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryFeeTokensResponse.fromRpc(json);
  }

  @override
  OsmosisTxfeesQueryFeeTokensResponse onResponse(List<int> bytes) {
    return OsmosisTxfeesQueryFeeTokensResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisTxfeesV1beta1Types.feeTokens.typeUrl;

  @override
  String get rpcPath => OsmosisTxfeesV1beta1Types.feeTokens.rpcUrl();
}
