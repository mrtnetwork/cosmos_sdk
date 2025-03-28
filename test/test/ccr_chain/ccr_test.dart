import 'package:cosmos_sdk/src/provider/chain_registery/models/models/chain.dart';
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
