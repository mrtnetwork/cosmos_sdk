import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/denom_pair_taker_fee.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'msg_set_denom_pair_taker_fee_response.dart';

class OsmosisPoolManagerMsgSetDenomPairTakerFee extends CosmosMessage
    with ServiceMessage<OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse> {
  final String? sender;
  final List<OsmosisPoolManagerDenomPairTakerFee> denomPairTakerFee;

  OsmosisPoolManagerMsgSetDenomPairTakerFee({
    this.sender,
    required List<OsmosisPoolManagerDenomPairTakerFee> denomPairTakerFee,
  }) : denomPairTakerFee = denomPairTakerFee.immutable;
  factory OsmosisPoolManagerMsgSetDenomPairTakerFee.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerMsgSetDenomPairTakerFee(
        sender: decode.getField(1),
        denomPairTakerFee: decode
            .getFields(2)
            .map((e) => OsmosisPoolManagerDenomPairTakerFee.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "denom_pair_taker_fee": denomPairTakerFee.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.msgSetDenomPairTakerFee.typeUrl;

  @override
  List get values => [sender, denomPairTakerFee];

  @override
  String get service =>
      OsmosisPoolManagerV1beta1Types.setDenomPairTakerFee.typeUrl;

  @override
  List<String?> get signers => [sender];

  @override
  OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse onResponse(
      List<int> bytes) {
    return OsmosisPoolManagerMsgSetDenomPairTakerFeeResponse.deserialize(bytes);
  }
}
