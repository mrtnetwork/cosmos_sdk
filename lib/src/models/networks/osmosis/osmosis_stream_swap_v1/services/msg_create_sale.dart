import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_stream_swap_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'msg_create_sale_response.dart';

class OsmosisStreamSwapMsgCreateSale extends CosmosMessage
    with ServiceMessage<OsmosisStreamSwapMsgCreateSaleResponse> {
  // Sale creator and the account which provides token (token_out) to the sale.
  /// When processing this message, token_out
  final String? creator;

  /// token_in is a denom used to buy `token_out`. May be referred as a
  /// "quote currency"
  final String? tokenIn;

  /// token_out is a coin supply (denom + amount) to sell. May be referred as
  /// "base currency". The whole supply will be transferred from the creator
  /// to the module and will be sold during the sale.
  final Coin tokenOut;

  /// Maximum fee the creator is going to pay for creating a sale. The creator
  /// will be charged params.SaleCreationFee. Transaction will fail if
  /// max_fee is smaller than params.SaleCreationFee. If empty, the creator
  /// doesn't accept any fee.
  final List<Coin> maxFee;

  /// start time when the token sale starts.
  final ProtobufTimestamp startTime;

  /// duration time that the sale takes place over
  final ProtobufDuration duration;

  /// Recipient is the account which receives earned `token_in` from when the
  /// sale is finalized. If not defined (empty) the creator
  /// account will be used.
  final String? recipient;

  /// Name for the sale, max 40 characters, min 4. Required.
  final String? name;

  /// URL with sale and project details. Can be a link a link to IPFS,
  /// hackmd, project page, blog post... Max 120 characters. Must be
  /// valid agains Go url.ParseRequestURI. Required.
  final String? url;

  OsmosisStreamSwapMsgCreateSale(
      {this.creator,
      this.tokenIn,
      required this.tokenOut,
      required List<Coin> maxFee,
      required this.startTime,
      required this.duration,
      this.recipient,
      this.name,
      this.url})
      : maxFee = maxFee.immutable;
  factory OsmosisStreamSwapMsgCreateSale.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisStreamSwapMsgCreateSale(
        creator: decode.getField(1),
        tokenIn: decode.getField(2),
        tokenOut: Coin.deserialize(decode.getField(3)),
        maxFee: decode
            .getFields<List<int>>(4)
            .map((e) => Coin.deserialize(e))
            .toList(),
        startTime: ProtobufTimestamp.deserialize(decode.getField(5)),
        duration: ProtobufDuration.deserialize(decode.getField(6)),
        recipient: decode.getField(7),
        name: decode.getField(8),
        url: decode.getField(9));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "creator": creator,
      "token_in": tokenIn,
      "token_out": tokenOut.toJson(),
      "max_fee": maxFee.map((e) => e.toJson()).toList(),
      "start_time": startTime.toJson(),
      "duration": duration.toJson(),
      "recipient": recipient,
      "name": name,
      "url": url
    };
  }

  @override
  String get typeUrl => OsmosisStreamSwapV1Types.msgCreateSale.typeUrl;

  @override
  List get values => [
        creator,
        tokenIn,
        tokenOut,
        maxFee,
        startTime,
        duration,
        recipient,
        name,
        url
      ];

  @override
  OsmosisStreamSwapMsgCreateSaleResponse onResponse(List<int> bytes) {
    return OsmosisStreamSwapMsgCreateSaleResponse.deserialize(bytes);
  }

  @override
  String get service => OsmosisStreamSwapV1Types.createSale.typeUrl;

  @override
  List<String?> get signers => [creator];
}
