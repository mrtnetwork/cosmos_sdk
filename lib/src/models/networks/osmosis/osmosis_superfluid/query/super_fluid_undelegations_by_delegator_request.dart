import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'super_fluid_undelegations_by_delegator_response.dart';

class OsmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest
    extends CosmosMessage
    with
        QueryMessage<
          OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse
        > {
  final String delegatorAddress;
  final String? denom;
  const OsmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest({
    required this.delegatorAddress,
    this.denom,
  });
  factory OsmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest(
      delegatorAddress: decode.getField(1),
      denom: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress, "denom": denom};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.superfluidUndelegationsByDelegatorRequest;

  @override
  List get values => [delegatorAddress, denom];

  @override
  Map<String, String?> get queryParameters => {"denom": denom};

  @override
  OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse.fromJson(
      json,
    );
  }

  @override
  OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse.deserialize(
      bytes,
    );
  }

  @override
  List<String> get pathParameters => [delegatorAddress];
}
