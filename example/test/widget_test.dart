import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:example/provider.dart';

void main() async {
  final provider = TendermintProvider(
      TendermintHTTPProvider(url: "https://tendermint.mayachain.info/"));
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));
  print("latest $latestBlock");
}
