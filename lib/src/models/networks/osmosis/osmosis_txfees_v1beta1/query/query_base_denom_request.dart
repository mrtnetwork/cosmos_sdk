import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_base_denom_response.dart';

class OsmosisTxfeesQueryBaseDenomRequest extends CosmosMessage
    with
        QueryMessage<OsmosisTxfeesQueryBaseDenomResponse>,
        RPCMessage<OsmosisTxfeesQueryBaseDenomResponse> {
  const OsmosisTxfeesQueryBaseDenomRequest();
  factory OsmosisTxfeesQueryBaseDenomRequest.deserialize(List<int> bytes) {
    return const OsmosisTxfeesQueryBaseDenomRequest();
  }
  factory OsmosisTxfeesQueryBaseDenomRequest.fromRpc(
      Map<String, dynamic> json) {
    return const OsmosisTxfeesQueryBaseDenomRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisTxfeesV1beta1Types.queryBaseDenomRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisTxfeesQueryBaseDenomResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryBaseDenomResponse.fromRpc(json);
  }

  @override
  OsmosisTxfeesQueryBaseDenomResponse onResponse(List<int> bytes) {
    return OsmosisTxfeesQueryBaseDenomResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisTxfeesV1beta1Types.baseDenom.typeUrl;

  @override
  String get rpcPath => OsmosisTxfeesV1beta1Types.baseDenom.rpcUrl();
}
