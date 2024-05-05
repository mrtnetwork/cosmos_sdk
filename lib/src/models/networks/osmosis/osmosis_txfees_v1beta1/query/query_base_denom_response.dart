import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisTxfeesQueryBaseDenomResponse extends CosmosMessage {
  final String? baseDenom;
  const OsmosisTxfeesQueryBaseDenomResponse({this.baseDenom});
  factory OsmosisTxfeesQueryBaseDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesQueryBaseDenomResponse(baseDenom: decode.getField(1));
  }
  factory OsmosisTxfeesQueryBaseDenomResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryBaseDenomResponse(baseDenom: json["base_denom"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"base_denom": baseDenom};
  }

  @override
  String get typeUrl =>
      OsmosisTxfeesV1beta1Types.queryBaseDenomResponse.typeUrl;

  @override
  List get values => [baseDenom];
}
