import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'user_concentrated_super_fluid_positions_undelegating_response.dart';

class OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse>,
        RPCMessage<
            OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse> {
  final String? delegatorAddress;
  const OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingRequest(
      {this.delegatorAddress});
  factory OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingRequest(
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
      .userConcentratedSuperfluidPositionsUndelegatingRequest.typeUrl;

  @override
  List get values => [delegatorAddress];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisSuperfluidTypes
      .userConcentratedSuperfluidPositionsUndelegating.typeUrl;

  @override
  String get rpcPath =>
      OsmosisSuperfluidTypes.userConcentratedSuperfluidPositionsUndelegating
          .rpcUrl(pathParameters: [delegatorAddress]);

  @override
  OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse
      onJsonResponse(Map<String, dynamic> json) {
    return OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse
        .fromRpc(json);
  }

  @override
  OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse
      onResponse(List<int> bytes) {
    return OsmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse
        .deserialize(bytes);
  }
}
