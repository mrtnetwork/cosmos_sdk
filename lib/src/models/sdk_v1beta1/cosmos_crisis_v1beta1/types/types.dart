import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class CrisisV1beta1 extends TypeUrl {
  const CrisisV1beta1._(super.typeUrl);
  static const CrisisV1beta1 msgVerifyInvariant =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.MsgVerifyInvariant");
  static const CrisisV1beta1 msgVerifyInvariantResponse =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.MsgVerifyInvariantResponse");
  static const CrisisV1beta1 crisisMsgUpdateParams =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.MsgUpdateParams");
  static const CrisisV1beta1 crisisMsgUpdateParamsResponse =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.MsgUpdateParamsResponse");
  static const CrisisV1beta1 crisisGenesisState =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.GenesisState");

  /// services
  static const CrisisV1beta1 verifyInvariant =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.Msg/VerifyInvariant");
  static const CrisisV1beta1 crisisUpdateParams =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.Msg/UpdateParams");
}
