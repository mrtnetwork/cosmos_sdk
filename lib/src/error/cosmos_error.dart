import 'package:blockchain_utils/blockchain_utils.dart';

/// Cosmos-SDK-specific error types. Phase 2: taxonomy only, no serialization.
enum CosmosErrorType implements BuErrorType {
  plugin(17000),
  aminoJsonParser(17001),
  thorNode(17002);

  @override
  String get domain => 'cosmos';

  @override
  String get errName => name;

  @override
  final int id;
  const CosmosErrorType(this.id);

  @override
  bool isValid(int? tag) {
    return id == tag;
  }
}
