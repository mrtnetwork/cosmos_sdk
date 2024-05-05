import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'asset_type_response.dart';

/// Params returns the total set of superfluid parameters.
class OsmosisSuperfluidAssetTypeRequest extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidAssetTypeResponse>,
        RPCMessage<OsmosisSuperfluidAssetTypeResponse> {
  final String? denom;
  const OsmosisSuperfluidAssetTypeRequest({this.denom});
  factory OsmosisSuperfluidAssetTypeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidAssetTypeRequest(denom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes.assetTypeRequest.typeUrl;

  @override
  List get values => [denom];

  @override
  Map<String, String?> get queryParameters => {"denom": denom};

  @override
  String get queryPath => OsmosisSuperfluidTypes.assetType.typeUrl;

  @override
  String get rpcPath => OsmosisSuperfluidTypes.assetType.rpcUrl();

  @override
  OsmosisSuperfluidAssetTypeResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisSuperfluidAssetTypeResponse.fromRpc(json);
  }

  @override
  OsmosisSuperfluidAssetTypeResponse onResponse(List<int> bytes) {
    return OsmosisSuperfluidAssetTypeResponse.deserialize(bytes);
  }
}
