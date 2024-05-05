import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// SuperfluidAssetType indicates whether the superfluid asset is a native token itself or the lp share of a pool.
class OsmosisSuperfluidSuperfluidAssetType implements CosmosEnum {
  static const OsmosisSuperfluidSuperfluidAssetType superfluidAssetTypeNative =
      OsmosisSuperfluidSuperfluidAssetType._(0, "SuperfluidAssetTypeNative");
  static const OsmosisSuperfluidSuperfluidAssetType superfluidAssetTypeLPShare =
      OsmosisSuperfluidSuperfluidAssetType._(1, "SuperfluidAssetTypeLPShare");

  @override
  final int value;
  @override
  final String name;

  const OsmosisSuperfluidSuperfluidAssetType._(this.value, this.name);
  static const List<OsmosisSuperfluidSuperfluidAssetType> values = [
    superfluidAssetTypeNative,
    superfluidAssetTypeLPShare
  ];

  static OsmosisSuperfluidSuperfluidAssetType fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No OsmosisSuperfluidSuperfluidAssetType element found for the given value.",
          details: {"value": value}),
    );
  }

  static OsmosisSuperfluidSuperfluidAssetType fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw MessageException(
          "No OsmosisSuperfluidSuperfluidAssetType element found for the given name.",
          details: {"value": name}),
    );
  }
}
