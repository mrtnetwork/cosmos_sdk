import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'super_fluid_delegations_by_delegator_response.dart';

class OsmosisSuperfluidSuperfluidDelegationsByDelegatorRequest
    extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse>,
        RPCMessage<OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse> {
  final String? delegatorAddress;
  const OsmosisSuperfluidSuperfluidDelegationsByDelegatorRequest(
      {this.delegatorAddress});
  factory OsmosisSuperfluidSuperfluidDelegationsByDelegatorRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidDelegationsByDelegatorRequest(
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
      OsmosisSuperfluidTypes.superfluidDelegationsByDelegatorRequest.typeUrl;

  @override
  List get values => [delegatorAddress];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisSuperfluidTypes.superfluidDelegationsByDelegator.typeUrl;

  @override
  String get rpcPath => OsmosisSuperfluidTypes.superfluidDelegationsByDelegator
      .rpcUrl(pathParameters: [delegatorAddress]);

  @override
  OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse.fromRpc(
        json);
  }

  @override
  OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse
        .deserialize(bytes);
  }
}
