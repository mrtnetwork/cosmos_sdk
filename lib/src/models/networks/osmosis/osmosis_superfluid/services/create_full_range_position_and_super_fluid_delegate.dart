import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'create_full_range_position_and_super_fluid_delegate_response.dart';

/// MsgCreateFullRangePositionAndSuperfluidDelegate creates a full range position
/// in a concentrated liquidity pool, then superfluid delegates.
class OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate
    extends OsmosisSuperfluid<
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
        coins: decode
            .getFields<List<int>>(2)
            .map((e) => Coin.deserialize(e))
            .toList(),
        sender: decode.getField(1),
        valAddr: decode.getField(3),
        poolId: decode.getField(4));
  }
  factory OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate.fromJson(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate(
        coins:
            json.asListOfMap("coins")?.map((e) => Coin.fromJson(e)).toList() ??
                [],
        sender: json.as("sender"),
        valAddr: json.as("val_addr"),
        poolId: json.asBigInt("pool_id"));
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
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.msgCreateFullRangePositionAndSuperfluidDelegate;

  @override
  List get values => [sender, coins, valAddr, poolId];

  @override
  List<String?> get signers => [sender];
  @override
  OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse
      onResponse(List<int> bytes) {
    return OsmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse
        .deserialize(bytes);
  }
}
