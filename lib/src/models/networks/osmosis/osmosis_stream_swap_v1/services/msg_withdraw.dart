import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class OsmosisStreamSwapMsgWithdraw extends OsmosisStreamSwapV1<ProtobufEmpty> {
  /// sender is an account address subscribed to the sale_id
  final String? sender;

  /// ID of a sale.
  final BigInt? saleId;

  /// amount of tokens_in to withdraw. Must be at most the amount of not spent
  /// tokens, unless set to null - then all remaining balance will be withdrawn.
  final BigInt amount;

  OsmosisStreamSwapMsgWithdraw(
      {this.sender, this.saleId, required this.amount});
  factory OsmosisStreamSwapMsgWithdraw.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgWithdraw(
        sender: decode.getField(1),
        saleId: decode.getField(2),
        amount: BigInt.parse(decode.getField(3)));
  }
  factory OsmosisStreamSwapMsgWithdraw.fromJson(Map<String, dynamic> json) {
    return OsmosisStreamSwapMsgWithdraw(
        sender: json.as("sender"),
        saleId: json.asBigInt("sale_id"),
        amount: json.asBigInt("amount"));
  }
  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "sale_id": saleId?.toString(),
      "amount": amount.toString()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisStreamSwapV1Types.msgSubscribe;

  @override
  List get values => [sender, saleId, amount.toString()];

  @override
  ProtobufEmpty onResponse(List<int> bytes) {
    return const ProtobufEmpty();
  }

  @override
  List<String?> get signers => [sender];
}
