import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisTwapV1beta1Types extends TypeUrl {
  const OsmosisTwapV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const OsmosisTwapV1beta1Types twapRecord = OsmosisTwapV1beta1Types._(
    "/osmosis.twap.v1beta1.TwapRecord",
  );
  static const OsmosisTwapV1beta1Types params = OsmosisTwapV1beta1Types._(
    "/osmosis.twap.v1beta1.Params",
  );

  static const OsmosisTwapV1beta1Types paramsRequest =
      OsmosisTwapV1beta1Types._(
        "/osmosis.twap.v1beta1.ParamsRequest",
        query: "/osmosis.twap.v1beta1.Query/Params",
        rpc: "/osmosis/twap/v1beta1/Params",
      );
  static const OsmosisTwapV1beta1Types paramsResponse =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.ParamsResponse");

  static const OsmosisTwapV1beta1Types arithmeticTwapRequest =
      OsmosisTwapV1beta1Types._(
        "/osmosis.twap.v1beta1.ArithmeticTwapRequest",
        query: "/osmosis.twap.v1beta1.Query/ArithmeticTwap",
        rpc: "/osmosis/twap/v1beta1/ArithmeticTwap",
      );
  static const OsmosisTwapV1beta1Types arithmeticTwapResponse =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.ArithmeticTwapResponse");

  static const OsmosisTwapV1beta1Types arithmeticTwapToNowRequest =
      OsmosisTwapV1beta1Types._(
        "/osmosis.twap.v1beta1.ArithmeticTwapToNowRequest",
        query: "/osmosis.twap.v1beta1.Query/ArithmeticTwapToNow",
        rpc: "/osmosis/twap/v1beta1/ArithmeticTwapToNow",
      );
  static const OsmosisTwapV1beta1Types arithmeticTwapToNowResponse =
      OsmosisTwapV1beta1Types._(
        "/osmosis.twap.v1beta1.ArithmeticTwapToNowResponse",
      );

  static const OsmosisTwapV1beta1Types arithmeticTwap =
      OsmosisTwapV1beta1Types._(
        "/osmosis.twap.v1beta1.Query/ArithmeticTwap",
        rpc: "/osmosis/twap/v1beta1/ArithmeticTwap",
      );
}
