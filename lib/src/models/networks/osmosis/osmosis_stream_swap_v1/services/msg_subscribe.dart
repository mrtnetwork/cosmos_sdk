import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisStreamSwapMsgSubscribe extends CosmosMessage
    with ServiceMessage<ProtobufEmpty> {
  /// sender is an account address adding a deposit
  final String? sender;

  /// ID of an existing sale.
  final BigInt? saleId;

  /// number of sale.token_in staked by a user.
  final BigInt amount;

  OsmosisStreamSwapMsgSubscribe(
      {this.sender, this.saleId, required this.amount});
  factory OsmosisStreamSwapMsgSubscribe.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgSubscribe(
        sender: decode.getField(1),
        saleId: decode.getField(2),
        amount: BigInt.parse(decode.getField(3)));
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
  String get typeUrl => OsmosisStreamSwapV1Types.msgSubscribe.typeUrl;

  @override
  List get values => [sender, saleId, amount.toString()];

  @override
  ProtobufEmpty onResponse(List<int> bytes) {
    return const ProtobufEmpty();
  }

  @override
  String get service => OsmosisStreamSwapV1Types.subscribe.typeUrl;

  @override
  List<String?> get signers => [sender];
}
