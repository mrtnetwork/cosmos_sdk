import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidSuperfluidDelegationAmountResponse
    extends CosmosMessage {
  final List<Coin> amount;
  OsmosisSuperfluidSuperfluidDelegationAmountResponse(List<Coin> amount)
      : amount = amount.immutable;
  factory OsmosisSuperfluidSuperfluidDelegationAmountResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidDelegationAmountResponse(decode
        .getFields<List<int>>(1)
        .map((e) => Coin.deserialize(e))
        .toList());
  }
  factory OsmosisSuperfluidSuperfluidDelegationAmountResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidDelegationAmountResponse(
        (json["amount"] as List?)?.map((e) => Coin.fromJson(e)).toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.superfluidDelegationAmountResponse;

  @override
  List get values => [amount];
}
