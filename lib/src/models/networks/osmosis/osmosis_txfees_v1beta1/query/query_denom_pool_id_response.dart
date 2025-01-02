import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisTxfeesQueryDenomPoolIdResponse extends CosmosMessage {
  final BigInt? poolID;
  const OsmosisTxfeesQueryDenomPoolIdResponse({this.poolID});
  factory OsmosisTxfeesQueryDenomPoolIdResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesQueryDenomPoolIdResponse(poolID: decode.getField(1));
  }
  factory OsmosisTxfeesQueryDenomPoolIdResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTxfeesQueryDenomPoolIdResponse(
        poolID: BigintUtils.tryParse(json["poolID"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"poolID": poolID};
  }

  @override
  TypeUrl get typeUrl => OsmosisTxfeesV1beta1Types.queryDenomPoolIdResponse;

  @override
  List get values => [poolID];
}
