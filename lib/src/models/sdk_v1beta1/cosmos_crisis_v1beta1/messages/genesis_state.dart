import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GenesisState defines the crisis module's genesis state.
class CrisisGenesisState extends CosmosMessage {
  /// constant_fee is the fee used to verify the invariant in the crisis
  /// module.
  final Coin constantFee;
  const CrisisGenesisState(this.constantFee);
  factory CrisisGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CrisisGenesisState(Coin.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [3];

  @override
  Map<String, dynamic> toJson() {
    return {"constant_fee": constantFee.toJson()};
  }

  @override
  TypeUrl get typeUrl => CrisisV1beta1.crisisGenesisState;

  @override
  List get values => [constantFee];
}
