import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_denom_pool_id_response.dart';

class OsmosisTxfeesQueryDenomPoolIdRequest extends CosmosMessage
    with
        QueryMessage<OsmosisTxfeesQueryDenomPoolIdResponse>,
        RPCMessage<OsmosisTxfeesQueryDenomPoolIdResponse> {
  final String? denom;
  const OsmosisTxfeesQueryDenomPoolIdRequest({this.denom});
  factory OsmosisTxfeesQueryDenomPoolIdRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesQueryDenomPoolIdRequest(denom: decode.getField(1));
  }
  factory OsmosisTxfeesQueryDenomPoolIdRequest.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryDenomPoolIdRequest(denom: json["denom"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  String get typeUrl =>
      OsmosisTxfeesV1beta1Types.queryDenomPoolIdRequest.typeUrl;

  @override
  List get values => [denom];

  @override
  OsmosisTxfeesQueryDenomPoolIdResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryDenomPoolIdResponse.fromRpc(json);
  }

  @override
  OsmosisTxfeesQueryDenomPoolIdResponse onResponse(List<int> bytes) {
    return OsmosisTxfeesQueryDenomPoolIdResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisTxfeesV1beta1Types.denomPoolId.typeUrl;

  @override
  String get rpcPath =>
      OsmosisTxfeesV1beta1Types.denomPoolId.rpcUrl(pathParameters: [denom]);
}
