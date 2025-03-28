import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class StrideTypes extends TypeUrl {
  const StrideTypes._(super.typeUrl);
  static const StrideTypes baseVestingAccount =
      StrideTypes._("/stride.vesting.BaseVestingAccount");
  static const StrideTypes stridePeriodicVestingAccount =
      StrideTypes._("/stride.vesting.StridePeriodicVestingAccount");
  static const StrideTypes period = StrideTypes._("/stride.vesting.Period");
}
