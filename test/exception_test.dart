import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:test/test.dart' show test, expect, equals;
import 'utils.dart';

void main() {
  CosmosTestApi.runTest(exceptionTest, 'Exception');
}

void exceptionTest() {
  test('Exception serialization', () {
    BuErrorCodec.registerTypes(CosmosErrorType.values);
    {
      final error = BuError(
        CosmosErrorType.plugin,
        "error",
        details: {"length": '32'},
      );
      final decode = BuErrorCodec.decode(bytes: error.toCborBytes());
      expect(decode.type, CosmosErrorType.plugin);
      expect(decode.message, "error");
      expect(decode.details, {"length": '32'});
    }
    {
      final error = BuError(
        CosmosErrorType.aminoJsonParser,
        "error",
        details: {"length": '32'},
      );
      final decode = BuErrorCodec.decode(bytes: error.toCborBytes());
      expect(decode.type, CosmosErrorType.aminoJsonParser);
      expect(decode.message, "error");
    }
    {
      final error = BuError(
        CosmosErrorType.thorNode,
        "error",
        details: {"length": '32'},
      );
      final decode = BuErrorCodec.decode(bytes: error.toCborBytes());
      expect(decode.type, CosmosErrorType.thorNode);
      expect(decode.message, "error");
    }
    {
      final ids = CosmosErrorType.values.map((e) => e.id);
      expect(ids.toSet().length, CosmosErrorType.values.length);
      for (final id in ids) {
        expect(id > 258, equals(true));
      }
    }
  });
}
