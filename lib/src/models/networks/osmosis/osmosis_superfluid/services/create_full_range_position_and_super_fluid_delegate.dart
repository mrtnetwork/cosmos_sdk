import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'create_full_range_position_and_super_fluid_delegate_response.dart';

/// MsgCreateFullRangePositionAndSuperfluidDelegate creates a full range position
/// in a concentrated liquidity pool, then superfluid delegates.
class OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate
    extends CosmosMessage
    with
        ServiceMessage<
            OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse> {
  final String? sender;
  final List<Coin> coins;
  final String? valAddr;
  final BigInt? poolId;

  OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate(
      {this.sender, required List<Coin> coins, this.valAddr, this.poolId})
      : coins = coins.immutable;
  factory OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate(
        coins: decode.getFields(2).map((e) => Coin.deserialize(e)).toList(),
        sender: decode.getField(1),
        valAddr: decode.getField(3),
        poolId: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "coins": coins.map((e) => e.toJson()).toList(),
      "val_addr": valAddr,
      "pool_id": poolId?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisSuperfluidTypes
      .msgCreateFullRangePositionAndSuperfluidDelegate.typeUrl;

  @override
  List get values => [sender, coins, valAddr, poolId];

  @override
  String get service => OsmosisSuperfluidTypes
      .createFullRangePositionAndSuperfluidDelegate.typeUrl;

  @override
  List<String?> get signers => [sender];
  @override
  OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse
      onResponse(List<int> bytes) {
    return OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse
        .deserialize(bytes);
  }
}
