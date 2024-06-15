import 'package:blockchain_utils/exception/exceptions.dart';

class ThorNodeApiException extends BlockchainUtilsException {
  @override
  final Map<String, dynamic>? details;
  @override
  final String message;

  const ThorNodeApiException(this.message, {this.details});
}
