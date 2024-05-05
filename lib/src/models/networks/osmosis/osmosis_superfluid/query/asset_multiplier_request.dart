import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'asset_multiplier_response.dart';

/// Params returns the total set of superfluid parameters.
class OsmosisSuperfluidAssetMultiplierRequest extends CosmosMessage
    with
        QueryMessage<OsmosisSuperfluidAssetMultiplierResponse>,
        RPCMessage<OsmosisSuperfluidAssetMultiplierResponse> {
  final String? denom;
  const OsmosisSuperfluidAssetMultiplierRequest({this.denom});
  factory OsmosisSuperfluidAssetMultiplierRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidAssetMultiplierRequest(denom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes.assetMultiplierRequest.typeUrl;

  @override
  List get values => [denom];

  @override
  Map<String, String?> get queryParameters => {"denom": denom};

  @override
  String get queryPath => OsmosisSuperfluidTypes.assetMultiplier.typeUrl;

  @override
  String get rpcPath => OsmosisSuperfluidTypes.assetMultiplier.rpcUrl();

  @override
  OsmosisSuperfluidAssetMultiplierResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidAssetMultiplierResponse.fromRpc(json);
  }

  @override
  OsmosisSuperfluidAssetMultiplierResponse onResponse(List<int> bytes) {
    return OsmosisSuperfluidAssetMultiplierResponse.deserialize(bytes);
  }
}
