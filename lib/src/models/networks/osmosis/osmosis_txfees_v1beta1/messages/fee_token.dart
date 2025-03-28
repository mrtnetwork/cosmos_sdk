import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_txfees_v1beta1/type/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// FeeToken is a struct that specifies a coin denom, and pool ID pair.
/// This marks the token as eligible for use as a tx fee asset in Osmosis.
/// Its price in osmo is derived through looking at the provided pool ID.
/// The pool ID must have osmo as one of its assets.
class OsmosisTxfeesFeeToken extends CosmosMessage {
  final String? denom;
  final BigInt? poolID;
  const OsmosisTxfeesFeeToken({required this.denom, required this.poolID});
  factory OsmosisTxfeesFeeToken.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTxfeesFeeToken(
      denom: decode.getField(1),
      poolID: decode.getField(2),
    );
  }
  factory OsmosisTxfeesFeeToken.fromJson(Map<String, dynamic> json) {
    return OsmosisTxfeesFeeToken(denom: json["denom"], poolID: json["poolID"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "poolID": poolID?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisTxfeesV1beta1Types.feeToken;

  @override
  List get values => [denom, poolID];
}
