import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Type defines a classification of message
/// issued from a controller chain to its associated interchain accounts host
class InterchainAccountType implements CosmosEnum {
  @override
  final int value;
  @override
  final String name;
  const InterchainAccountType._(this.value, this.name);

  /// Default zero value enumeration
  static const InterchainAccountType unspecified =
      InterchainAccountType._(0, "UNSPECIFIED");

  /// Execute a transaction on an interchain accounts host chain
  static const InterchainAccountType executeTx =
      InterchainAccountType._(0, "EXECUTE_TX");
  static const List<InterchainAccountType> values = [unspecified, executeTx];
  static InterchainAccountType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No InterchainAccountType element found for the given value.",
          details: {"value": value}),
    );
  }
}
