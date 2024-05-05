import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'super_fluid_undelegations_by_delegator_response.dart';

class OsmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse>,
        RPCMessage<
            OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse> {
  final String? delegatorAddress;
  final String? denom;
  const OsmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest(
      {this.delegatorAddress, this.denom});
  factory OsmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest(
        delegatorAddress: decode.getField(1), denom: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress, "denom": denom};
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.superfluidUndelegationsByDelegatorRequest.typeUrl;

  @override
  List get values => [delegatorAddress, denom];

  @override
  Map<String, String?> get queryParameters => {"denom": denom};

  @override
  String get queryPath =>
      OsmosisSuperfluidTypes.superfluidUndelegationsByDelegator.typeUrl;

  @override
  String get rpcPath =>
      OsmosisSuperfluidTypes.superfluidUndelegationsByDelegator
          .rpcUrl(pathParameters: [delegatorAddress]);

  @override
  OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse.fromRpc(
        json);
  }

  @override
  OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse
        .deserialize(bytes);
  }
}
