import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';

class OsmosisLockupLockedDenomResponse extends CosmosMessage {
  final BigInt? amount;

  const OsmosisLockupLockedDenomResponse({this.amount});
  factory OsmosisLockupLockedDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupLockedDenomResponse(
        amount: BigInt.tryParse(decode.getField(1)));
  }
  factory OsmosisLockupLockedDenomResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisLockupLockedDenomResponse(
        amount: BigintUtils.tryParse(json["amount"]));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount?.toString()};
  }

  @override
  String get typeUrl => OsmosisLockupTypes.lockedDenomResponse.typeUrl;

  @override
  List get values => [amount];
}
