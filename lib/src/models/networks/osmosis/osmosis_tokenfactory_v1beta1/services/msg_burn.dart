import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgBurn is the sdk.Msg type for allowing an admin account to burn a token.
/// For now, we only support burning from the sender account.
class OsmosisTokenFactoryMsgBurn
    extends OsmosisTokenFactoryV1Beta1<EmptyServiceRequestResponse> {
  final String? sender;

  final Coin amount;
  OsmosisTokenFactoryMsgBurn({this.sender, required this.amount});
  factory OsmosisTokenFactoryMsgBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryMsgBurn(
        sender: decode.getField(1),
        amount: Coin.deserialize(decode.getField(2)));
  }
  factory OsmosisTokenFactoryMsgBurn.fromJson(Map<String, dynamic> json) {
    return OsmosisTokenFactoryMsgBurn(
        sender: json.as("sender"), amount: Coin.fromJson(json.asMap("amount")));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "amount": amount.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.msgBurn;

  @override
  List get values => [sender, amount];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisTokenFactoryV1beta1Types.msgBurnResponse);
  }

  @override
  List<String?> get signers => [sender];
}
