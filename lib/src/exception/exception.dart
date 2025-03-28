import 'package:blockchain_utils/blockchain_utils.dart';

class DartCosmosSdkPluginException extends BlockchainUtilsException {
  const DartCosmosSdkPluginException(super.message, {super.details});
}

class AminoJsonParserException extends DartCosmosSdkPluginException {
  const AminoJsonParserException(super.message, {super.details});
}
