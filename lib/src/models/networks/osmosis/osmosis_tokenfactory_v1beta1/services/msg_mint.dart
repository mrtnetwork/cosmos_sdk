import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class OsmosisTokenFactoryMsgMint
    extends OsmosisTokenFactoryV1Beta1<EmptyServiceRequestResponse> {
  final String? sender;

  final Coin amount;
  OsmosisTokenFactoryMsgMint({this.sender, required this.amount});
  factory OsmosisTokenFactoryMsgMint.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryMsgMint(
        sender: decode.getField(1),
        amount: Coin.deserialize(decode.getField(2)));
  }
  factory OsmosisTokenFactoryMsgMint.fromJson(Map<String, dynamic> json) {
    return OsmosisTokenFactoryMsgMint(
        sender: json.as("sender"), amount: Coin.fromJson(json.asMap("amount")));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "amount": amount.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.msgMint;

  @override
  List get values => [sender, amount];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisTokenFactoryV1beta1Types.msgMintResponse);
  }

  @override
  List<String?> get signers => [sender];
}
