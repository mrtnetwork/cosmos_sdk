import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'total_super_fluid_delegations_response.dart';

class OsmosisSuperfluidTotalSuperfluidDelegationsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidTotalSuperfluidDelegationsResponse>,
        RPCMessage<OsmosisSuperfluidTotalSuperfluidDelegationsResponse> {
  const OsmosisSuperfluidTotalSuperfluidDelegationsRequest();
  factory OsmosisSuperfluidTotalSuperfluidDelegationsRequest.deserialize(
      List<int> bytes) {
    return const OsmosisSuperfluidTotalSuperfluidDelegationsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.totalSuperfluidDelegationsRequest.typeUrl;

  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisSuperfluidTypes.totalSuperfluidDelegations.typeUrl;

  @override
  String get rpcPath =>
      OsmosisSuperfluidTypes.totalSuperfluidDelegations.rpcUrl();

  @override
  OsmosisSuperfluidTotalSuperfluidDelegationsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidTotalSuperfluidDelegationsResponse.fromRpc(json);
  }

  @override
  OsmosisSuperfluidTotalSuperfluidDelegationsResponse onResponse(
      List<int> bytes) {
    return OsmosisSuperfluidTotalSuperfluidDelegationsResponse.deserialize(
        bytes);
  }
}
