import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'connected_intermediary_account_response.dart';

class OsmosisSuperfluidConnectedIntermediaryAccountRequest extends CosmosMessage
    with QueryMessage<OsmosisSuperfluidConnectedIntermediaryAccountResponse> {
  final BigInt lockId;
  const OsmosisSuperfluidConnectedIntermediaryAccountRequest(
      {required this.lockId});
  factory OsmosisSuperfluidConnectedIntermediaryAccountRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidConnectedIntermediaryAccountRequest(
        lockId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"lock_id": lockId.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.connectedIntermediaryAccountRequest;

  @override
  List get values => [lockId];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  OsmosisSuperfluidConnectedIntermediaryAccountResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidConnectedIntermediaryAccountResponse.fromJson(json);
  }

  @override
  OsmosisSuperfluidConnectedIntermediaryAccountResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidConnectedIntermediaryAccountResponse.deserialize(
        bytes);
  }

  @override
  List<String> get pathParameters => [lockId.toString()];
}
