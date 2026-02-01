import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/denom_pair_taker_fee.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'msg_set_denom_pair_taker_fee_response.dart';

class OsmosisPoolManagerMsgSetDenomPairTakerFee
    extends
        OsmosisPoolManagerV1Beta1<
          OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse
        > {
  final String? sender;
  final List<OsmosisPoolManagerDenomPairTakerFee> denomPairTakerFee;

  OsmosisPoolManagerMsgSetDenomPairTakerFee({
    this.sender,
    required List<OsmosisPoolManagerDenomPairTakerFee> denomPairTakerFee,
  }) : denomPairTakerFee = denomPairTakerFee.immutable;
  factory OsmosisPoolManagerMsgSetDenomPairTakerFee.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSetDenomPairTakerFee(
      sender: decode.getField(1),
      denomPairTakerFee:
          decode
              .getFields<List<int>>(2)
              .map((e) => OsmosisPoolManagerDenomPairTakerFee.deserialize(e))
              .toList(),
    );
  }
  factory OsmosisPoolManagerMsgSetDenomPairTakerFee.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerMsgSetDenomPairTakerFee(
      sender: json.as("sender"),
      denomPairTakerFee:
          json
              .asListOfMap("denom_pair_taker_fee")
              ?.map((e) => OsmosisPoolManagerDenomPairTakerFee.fromJson(e))
              .toList() ??
          [],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "denom_pair_taker_fee": denomPairTakerFee.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.msgSetDenomPairTakerFee;

  @override
  List get values => [sender, denomPairTakerFee];

  @override
  List<String?> get signers => [sender];

  @override
  OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse.deserialize(bytes);
  }
}
