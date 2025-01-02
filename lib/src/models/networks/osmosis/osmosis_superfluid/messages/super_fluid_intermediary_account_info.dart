import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo
    extends CosmosMessage {
  final String? denom;
  final String? valAddr;
  final BigInt? gaugeId;
  final String? address;
  const OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo(
      {this.denom, this.valAddr, this.gaugeId, this.address});
  factory OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo(
        denom: decode.getField(1),
        valAddr: decode.getField(2),
        gaugeId: decode.getField(3),
        address: decode.getField(4));
  }
  factory OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo(
        denom: json["denom"],
        valAddr: json["val_addr"],
        gaugeId: BigintUtils.tryParse(json["gauge_id"]),
        address: json["address"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "denom": denom,
      "val_addr": valAddr,
      "gauge_id": gaugeId?.toString(),
      "address": address
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.superfluidIntermediaryAccountInfo;

  @override
  List get values => [denom, valAddr, gaugeId, address];
}
