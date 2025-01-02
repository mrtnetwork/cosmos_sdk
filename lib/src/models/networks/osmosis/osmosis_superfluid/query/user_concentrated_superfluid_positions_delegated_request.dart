import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'user_concentrated_super_fluid_positions_delegated_response.dart';

class OsmosisSuperfluidTotalSuperfluidDelegationsRequest extends CosmosMessage
    with
        QueryMessage<
            OsmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse> {
  final String delegatorAddress;
  const OsmosisSuperfluidTotalSuperfluidDelegationsRequest(
      {required this.delegatorAddress});
  factory OsmosisSuperfluidTotalSuperfluidDelegationsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidTotalSuperfluidDelegationsRequest(
        delegatorAddress: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes
      .userConcentratedSuperfluidPositionsDelegatedRequest;

  @override
  List get values => [delegatorAddress];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  OsmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse
      onJsonResponse(Map<String, dynamic> json) {
    return OsmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse
        .fromRpc(json);
  }

  @override
  OsmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse
      onResponse(List<int> bytes) {
    return OsmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse
        .deserialize(bytes);
  }

  @override
  List<String> get pathParameters => [delegatorAddress];
}
