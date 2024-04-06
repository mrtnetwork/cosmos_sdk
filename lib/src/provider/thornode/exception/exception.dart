import 'package:blockchain_utils/exception/exceptions.dart';

class ThorNodeApiException extends BlockchainUtilsException {
  ThorNodeApiException(this.message);
  @override
  final String message;
}
