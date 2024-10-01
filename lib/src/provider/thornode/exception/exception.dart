import 'package:blockchain_utils/exception/exceptions.dart';

class ThorNodeApiException extends BlockchainUtilsException {
  const ThorNodeApiException(String message, {Map<String, dynamic>? details})
      : super(message, details: details);
}
