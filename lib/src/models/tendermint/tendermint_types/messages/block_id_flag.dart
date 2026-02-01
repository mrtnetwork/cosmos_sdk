import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// BlockIdFlag indicates which BlockID the signature is for
class BlockIDFlag implements CosmosEnum {
  static const BlockIDFlag unknown = BlockIDFlag._(0, "BLOCK_ID_FLAG_UNKNOWN");
  static const BlockIDFlag absent = BlockIDFlag._(1, "BLOCK_ID_FLAG_ABSENT");
  static const BlockIDFlag commit = BlockIDFlag._(2, "BLOCK_ID_FLAG_COMMIT");
  static const BlockIDFlag nil = BlockIDFlag._(3, "BLOCK_ID_FLAG_NIL");

  @override
  final int value;
  @override
  final String name;

  const BlockIDFlag._(this.value, this.name);
  static const List<BlockIDFlag> values = [unknown, absent, commit, nil];

  static BlockIDFlag fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No BlockIDFlag element found for the given value.",
                details: {"value": value},
              ),
    );
  }

  static BlockIDFlag fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No BlockIDFlag element found for the given name.",
                details: {"value": name},
              ),
    );
  }
}
