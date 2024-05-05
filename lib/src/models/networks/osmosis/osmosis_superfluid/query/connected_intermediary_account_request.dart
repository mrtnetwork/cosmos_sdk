import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'connected_intermediary_account_response.dart';

class OsmosisSuperfluidConnectedIntermediaryAccountRequest extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidConnectedIntermediaryAccountResponse>,
        RPCMessage<OsmosisSuperfluidConnectedIntermediaryAccountResponse> {
  final BigInt? lockId;
  const OsmosisSuperfluidConnectedIntermediaryAccountRequest({this.lockId});
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
    return {"lock_id": lockId?.toString()};
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.connectedIntermediaryAccountRequest.typeUrl;

  @override
  List get values => [lockId];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisSuperfluidTypes.connectedIntermediaryAccount.typeUrl;

  @override
  String get rpcPath => OsmosisSuperfluidTypes.connectedIntermediaryAccount
      .rpcUrl(pathParameters: [lockId?.toString()]);

  @override
  OsmosisSuperfluidConnectedIntermediaryAccountResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidConnectedIntermediaryAccountResponse.fromRpc(json);
  }

  @override
  OsmosisSuperfluidConnectedIntermediaryAccountResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidConnectedIntermediaryAccountResponse.deserialize(
        bytes);
  }
}
