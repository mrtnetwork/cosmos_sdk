import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_base_denom_response.dart';

class OsmosisTxfeesQueryBaseDenomRequest extends CosmosMessage
    with QueryMessage<OsmosisTxfeesQueryBaseDenomResponse> {
  const OsmosisTxfeesQueryBaseDenomRequest();
  factory OsmosisTxfeesQueryBaseDenomRequest.deserialize(List<int> bytes) {
    return const OsmosisTxfeesQueryBaseDenomRequest();
  }
  factory OsmosisTxfeesQueryBaseDenomRequest.fromJson(
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
  TypeUrl get typeUrl => OsmosisTxfeesV1beta1Types.queryBaseDenomRequest;

  @override
  List get values => [];

  @override
  OsmosisTxfeesQueryBaseDenomResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryBaseDenomResponse.fromJson(json);
  }

  @override
  OsmosisTxfeesQueryBaseDenomResponse onResponse(List<int> bytes) {
    return OsmosisTxfeesQueryBaseDenomResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};
}
