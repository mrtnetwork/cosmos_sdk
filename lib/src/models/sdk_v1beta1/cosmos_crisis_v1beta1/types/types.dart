import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class CrisisV1beta1 extends TypeUrl {
  const CrisisV1beta1._(super.typeUrl, {super.aminoType});
  static const String root = "/cosmos.crisis.v1beta1";
  static const CrisisV1beta1 msgVerifyInvariant = CrisisV1beta1._(
    "/cosmos.crisis.v1beta1.MsgVerifyInvariant",
  );
  static const CrisisV1beta1 msgVerifyInvariantResponse = CrisisV1beta1._(
      "/cosmos.crisis.v1beta1.MsgVerifyInvariantResponse",
      aminoType: "cosmos-sdk/MsgVerifyInvariant");
  static const CrisisV1beta1 crisisMsgUpdateParams =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.MsgUpdateParams");
  static const CrisisV1beta1 crisisMsgUpdateParamsResponse =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.MsgUpdateParamsResponse");
  static const CrisisV1beta1 crisisGenesisState =
      CrisisV1beta1._("/cosmos.crisis.v1beta1.GenesisState");

  static const List<TypeUrl> services = [
    crisisMsgUpdateParams,
    msgVerifyInvariant
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
