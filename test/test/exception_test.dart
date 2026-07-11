import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:test/test.dart';

void main() {
  test('Exception serialization', () {
    {
      final error = DartCosmosSdkPluginException(
        "error",
        details: {"length": "32"},
      );
      final decode = BaseDartCosmosSdkPluginException.deserialize(
        bytes: error.toCbor().encode(),
      );
      expect(decode, error);
    }
    {
      final error = AminoJsonParserException(
        "error",
        details: {"length": "32"},
      );
      final decode = BaseDartCosmosSdkPluginException.deserialize(
        bytes: error.toCbor().encode(),
      );
      expect(decode, error);
    }
    {
      final error = ThorNodeApiException("error", details: {"length": "32"});
      final decode = BaseDartCosmosSdkPluginException.deserialize(
        bytes: error.toCbor().encode(),
      );
      expect(decode, error);
    }
  });
}
