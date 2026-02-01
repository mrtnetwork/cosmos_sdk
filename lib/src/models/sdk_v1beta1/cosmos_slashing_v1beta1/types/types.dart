import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class SlashingV1beta1Types extends TypeUrl {
  const SlashingV1beta1Types._(
    super.typeUrl, {
    super.query,
    super.rpc,
    super.aminoType,
  });

  static const String root = "/cosmos.slashing.v1beta1";
  static const SlashingV1beta1Types slashingMsgUnjail = SlashingV1beta1Types._(
    "/cosmos.slashing.v1beta1.MsgUnjail",
    aminoType: "cosmos-sdk/MsgUnjail",
  );
  static const SlashingV1beta1Types slashingMsgUnjailResponse =
      SlashingV1beta1Types._("/cosmos.slashing.v1beta1.MsgUnjailResponse");
  static const SlashingV1beta1Types slashingParams = SlashingV1beta1Types._(
    "/cosmos.slashing.v1beta1.Params",
  );
  static const SlashingV1beta1Types slashingMsgUpdateParams =
      SlashingV1beta1Types._("/cosmos.slashing.v1beta1.MsgUpdateParams");
  static const SlashingV1beta1Types slashingMsgUpdateParamsResponse =
      SlashingV1beta1Types._(
        "/cosmos.slashing.v1beta1.MsgUpdateParamsResponse",
      );
  static const SlashingV1beta1Types slashingValidatorSigningInfo =
      SlashingV1beta1Types._("/cosmos.slashing.v1beta1.ValidatorSigningInfo");
  static const SlashingV1beta1Types slashingQueryParamsRequest =
      SlashingV1beta1Types._(
        "/cosmos.slashing.v1beta1.QueryParamsRequest",
        query: "/cosmos.slashing.v1beta1.Query/Params",
        rpc: "/cosmos/slashing/v1beta1/params",
      );
  static const SlashingV1beta1Types slashingQueryParamsResponse =
      SlashingV1beta1Types._("/cosmos.slashing.v1beta1.QueryParamsResponse");
  static const SlashingV1beta1Types slashingQuerySigningInfoRequest =
      SlashingV1beta1Types._(
        "/cosmos.slashing.v1beta1.QuerySigningInfoRequest",
        query: "/cosmos.slashing.v1beta1.Query/SigningInfo",
        rpc: "/cosmos/slashing/v1beta1/signing_infos/:cons_address",
      );
  static const SlashingV1beta1Types slashingQuerySigningInfoResponse =
      SlashingV1beta1Types._(
        "/cosmos.slashing.v1beta1.QuerySigningInfoResponse",
      );
  static const SlashingV1beta1Types slashingQuerySigningInfosRequest =
      SlashingV1beta1Types._(
        "/cosmos.slashing.v1beta1.QuerySigningInfosRequest",
        query: "/cosmos.slashing.v1beta1.Query/SigningInfos",
        rpc: "/cosmos/slashing/v1beta1/signing_infos",
      );
  static const SlashingV1beta1Types slashingQuerySigningInfosResponse =
      SlashingV1beta1Types._(
        "/cosmos.slashing.v1beta1.QuerySigningInfosResponse",
      );

  static const List<TypeUrl> services = [
    slashingMsgUnjail,
    slashingMsgUpdateParams,
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
