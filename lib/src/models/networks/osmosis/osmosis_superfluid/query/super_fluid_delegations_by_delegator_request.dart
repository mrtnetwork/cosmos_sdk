import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'super_fluid_delegations_by_delegator_response.dart';

class OsmosisSuperfluidSuperfluidDelegationsByDelegatorRequest
    extends CosmosMessage
    with
        QueryMessage<
          OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse
        > {
  final String delegatorAddress;
  const OsmosisSuperfluidSuperfluidDelegationsByDelegatorRequest({
    required this.delegatorAddress,
  });
  factory OsmosisSuperfluidSuperfluidDelegationsByDelegatorRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidDelegationsByDelegatorRequest(
      delegatorAddress: decode.getField(1),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.superfluidDelegationsByDelegatorRequest;

  @override
  List get values => [delegatorAddress];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse.fromJson(
      json,
    );
  }

  @override
  OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisSuperfluidSuperfluidDelegationsByDelegatorResponse.deserialize(
      bytes,
    );
  }

  @override
  List<String> get pathParameters => [delegatorAddress];
}
