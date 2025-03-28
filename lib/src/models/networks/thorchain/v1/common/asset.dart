import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class ThorchainAsset extends CosmosMessage {
  final String? chain;
  final String? symbol;
  final String? ticker;
  final bool? synth;
  final bool? trade;
  const ThorchainAsset(
      {this.chain, this.symbol, this.ticker, this.synth, this.trade});
  factory ThorchainAsset.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainAsset(
        chain: decode.getField(1),
        symbol: decode.getField(2),
        ticker: decode.getField(3),
        synth: decode.getField(4),
        trade: decode.getField(5));
  }
  factory ThorchainAsset.fromJson(Map<String, dynamic> json) {
    return ThorchainAsset(
        chain: json.as("chain"),
        symbol: json.as("symbol"),
        ticker: json.as("ticker"),
        synth: json.as("synth"),
        trade: json.as("trade"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "chain": chain,
      "symbol": symbol,
      "ticker": ticker,
      "synth": synth,
      "trade": trade
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.asset;

  @override
  List get values => [chain, symbol, ticker, synth, trade];
}
