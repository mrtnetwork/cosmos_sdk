import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class CFEvestingTypes extends TypeUrl {
  const CFEvestingTypes._(super.typeUrl);
  static const String root = "/cosmos.vesting.v1beta1";
  static const CFEvestingTypes baseVestingAccount = CFEvestingTypes._(
    "/chain4energy.c4echain.cfevesting.PeriodicContinuousVestingAccount",
  );
  static const CFEvestingTypes continuousVestingPeriod = CFEvestingTypes._(
    "/chain4energy.c4echain.cfevesting.ContinuousVestingPeriod",
  );
}
