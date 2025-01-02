import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:test/test.dart';

import 'chain_vector.dart';

void main() {
  test('should pars chain.json', () {
    CCRChain.fromJson(chainjs);
  });
  test('should pars assetlist.json', () {
    CCRChain.fromJson(chainjs);
  });
}
