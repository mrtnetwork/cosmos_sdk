import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryGetProtoRevDeveloperAccountResponse is response type for the Query/GetProtoRevDeveloperAccount RPC method.
class OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse
    extends CosmosMessage {
  /// [developerAccount] is the developer account of the module
  final String? developerAccount;
  const OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse(
      {this.developerAccount});
  factory OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse(
        developerAccount: decode.getField(1));
  }
  factory OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevDeveloperAccountResponse(
        developerAccount: json["developer_account"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"developer_account": developerAccount};
  }

  @override
  List get values => [developerAccount];

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types
      .queryGetProtoRevDeveloperAccountResponse.typeUrl;
}
