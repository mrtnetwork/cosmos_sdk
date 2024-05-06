import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'user_concentrated_super_fluid_positions_delegated_response.dart';

class OsmosisSuperfluidTotalSuperfluidDelegationsRequest extends CosmosMessage
    with
        QueryMessage<
            OsmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse>,
        RPCMessage<
            OsmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse> {
  final String? delegatorAddress;
  const OsmosisSuperfluidTotalSuperfluidDelegationsRequest(
      {this.delegatorAddress});
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
    return {"delegator_address": delegatorAddress?.toString()};
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes
      .userConcentratedSuperfluidPositionsDelegatedRequest.typeUrl;

  @override
  List get values => [delegatorAddress];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisSuperfluidTypes
      .userConcentratedSuperfluidPositionsDelegated.typeUrl;

  @override
  String get rpcPath =>
      OsmosisSuperfluidTypes.userConcentratedSuperfluidPositionsDelegated
          .rpcUrl(pathParameters: [delegatorAddress]);

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
}
