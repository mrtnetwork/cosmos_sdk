import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_unpool_whitelist_response.dart';

/// Params returns the total set of superfluid parameters.
class OsmosisSuperfluidQueryUnpoolWhitelistRequest extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidQueryUnpoolWhitelistResponse>,
        RPCMessage<OsmosisSuperfluidQueryUnpoolWhitelistResponse> {
  const OsmosisSuperfluidQueryUnpoolWhitelistRequest();
  factory OsmosisSuperfluidQueryUnpoolWhitelistRequest.deserialize(
      List<int> bytes) {
    return const OsmosisSuperfluidQueryUnpoolWhitelistRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.queryUnpoolWhitelistRequest.typeUrl;

  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisSuperfluidTypes.unpoolWhitelist.typeUrl;

  @override
  String get rpcPath => OsmosisSuperfluidTypes.unpoolWhitelist.rpcUrl();

  @override
  OsmosisSuperfluidQueryUnpoolWhitelistResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidQueryUnpoolWhitelistResponse.fromRpc(json);
  }

  @override
  OsmosisSuperfluidQueryUnpoolWhitelistResponse onResponse(List<int> bytes) {
    return OsmosisSuperfluidQueryUnpoolWhitelistResponse.deserialize(bytes);
  }
}
