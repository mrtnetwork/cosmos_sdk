import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_total_delegation_by_delegator_response.dart';

class OsmosisSuperfluidQueryTotalDelegationByDelegatorRequest
    extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse>,
        RPCMessage<OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse> {
  final String? delegatorAddress;
  const OsmosisSuperfluidQueryTotalDelegationByDelegatorRequest(
      {this.delegatorAddress});
  factory OsmosisSuperfluidQueryTotalDelegationByDelegatorRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidQueryTotalDelegationByDelegatorRequest(
        delegatorAddress: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress};
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.queryTotalDelegationByDelegatorRequest.typeUrl;

  @override
  List get values => [delegatorAddress];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisSuperfluidTypes.totalDelegationByDelegator.typeUrl;

  @override
  String get rpcPath => OsmosisSuperfluidTypes.totalDelegationByDelegator
      .rpcUrl(pathParameters: [delegatorAddress]);

  @override
  OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse.fromRpc(
        json);
  }

  @override
  OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidQueryTotalDelegationByDelegatorResponse.deserialize(
        bytes);
  }
}
