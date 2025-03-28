import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'asset_type_response.dart';

/// Params returns the total set of superfluid parameters.
class OsmosisSuperfluidAssetTypeRequest extends CosmosMessage
    with QueryMessage<OsmosisSuperfluidAssetTypeResponse> {
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
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.assetTypeRequest;

  @override
  List get values => [denom];

  @override
  Map<String, String?> get queryParameters => {"denom": denom};

  @override
  OsmosisSuperfluidAssetTypeResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisSuperfluidAssetTypeResponse.fromJson(json);
  }

  @override
  OsmosisSuperfluidAssetTypeResponse onResponse(List<int> bytes) {
    return OsmosisSuperfluidAssetTypeResponse.deserialize(bytes);
  }
}
