import 'package:cosmos_sdk/sdk/provider/chain_registery/models/models/chain.dart';
import 'package:test/test.dart';

import 'chain_vector.dart';
import '../utils.dart';

void main() {
  CosmosTestApi.runTest(ccrTest, 'Ccr');
}

void ccrTest() {
  test('should pars chain.json', () {
    CCRChain.fromJson(chainjs);
  });
  test('should pars assetlist.json', () {
    CCRChain.fromJson(chainjs);
  });
}
