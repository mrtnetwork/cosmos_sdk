import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'add_to_concentrated_liquidity_super_fluid_position_response.dart';

class OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition
    extends
        OsmosisSuperfluid<
          OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse
        > {
  final BigInt? positionId;
  final String? sender;
  final Coin tokenDesired0;
  final Coin tokenDesired1;

  OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition({
    this.positionId,
    this.sender,
    required this.tokenDesired0,
    required this.tokenDesired1,
  });
  factory OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition(
      positionId: decode.getField(1),
      sender: decode.getField(2),
      tokenDesired0: Coin.deserialize(decode.getField(3)),
      tokenDesired1: Coin.deserialize(decode.getField(4)),
    );
  }
  factory OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition(
      positionId: json.asBigInt("position_id"),
      sender: json.as("sender"),
      tokenDesired0: Coin.fromJson(json.asMap("token_desired0")),
      tokenDesired1: Coin.fromJson(json.asMap("token_desired1")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId?.toString(),
      "sender": sender,
      "token_desired0": tokenDesired0.toJson(),
      "token_desired1": tokenDesired1.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisSuperfluidTypes.msgAddToConcentratedLiquiditySuperfluidPosition;

  @override
  List get values => [positionId, sender, tokenDesired0, tokenDesired1];

  @override
  List<String?> get signers => [sender];
  @override
  OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse
  onResponse(List<int> bytes) {
    return OsmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse.deserialize(
      bytes,
    );
  }
}
