import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// BlockIdFlag indicates which BlockID the signature is for
class BlockIDFlag implements CosmosEnum {
  static const BlockIDFlag unknown = BlockIDFlag._(0, "unknown");
  static const BlockIDFlag absent = BlockIDFlag._(1, "absent");
  static const BlockIDFlag commit = BlockIDFlag._(2, "commit");
  static const BlockIDFlag nil = BlockIDFlag._(3, "nil");

  @override
  final int value;
  @override
  final String name;

  const BlockIDFlag._(this.value, this.name);
  static const List<BlockIDFlag> values = [unknown, absent, commit, nil];

  static BlockIDFlag fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No BlockIDFlag element found for the given value.",
          details: {"value": value}),
    );
  }
}
