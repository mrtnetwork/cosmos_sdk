import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_lock_and_super_fluid_delegate_response.dart';

/// Execute superfluid delegation for a lockup
class OsmosisSuperfluidMsgLockAndSuperfluidDelegate
    extends
        OsmosisSuperfluid<
          OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse
        > {
  final String? sender;
  final List<Coin> coins;
  final String? valAddr;

  OsmosisSuperfluidMsgLockAndSuperfluidDelegate({
    this.sender,
    required List<Coin> coins,
    this.valAddr,
  }) : coins = coins.immutable;
  factory OsmosisSuperfluidMsgLockAndSuperfluidDelegate.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgLockAndSuperfluidDelegate(
      coins:
          decode
              .getFields<List<int>>(2)
              .map((e) => Coin.deserialize(e))
              .toList(),
      sender: decode.getField(1),
      valAddr: decode.getField(3),
    );
  }
  factory OsmosisSuperfluidMsgLockAndSuperfluidDelegate.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidMsgLockAndSuperfluidDelegate(
      coins:
          json.asListOfMap("coins")?.map((e) => Coin.fromJson(e)).toList() ??
          [],
      sender: json.as("sender"),
      valAddr: json.as("val_addr"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "coins": coins.map((e) => e.toJson()).toList(),
      "val_addr": valAddr,
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.msgLockAndSuperfluidDelegate;

  @override
  List get values => [sender, coins, valAddr];

  @override
  List<String?> get signers => [sender];
  @override
  OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisSuperfluidMsgLockAndSuperfluidDelegateResponse.deserialize(
      bytes,
    );
  }
}
