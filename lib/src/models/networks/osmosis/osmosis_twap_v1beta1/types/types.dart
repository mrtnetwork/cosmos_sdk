import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisTwapV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisTwapV1beta1Types._(this.typeUrl, {this.rpc});
  static const OsmosisTwapV1beta1Types twapRecord =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.TwapRecord");
  static const OsmosisTwapV1beta1Types params =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.Params");

  static const OsmosisTwapV1beta1Types paramsRequest =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.ParamsRequest");
  static const OsmosisTwapV1beta1Types paramsResponse =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.ParamsResponse");

  static const OsmosisTwapV1beta1Types arithmeticTwapRequest =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.ArithmeticTwapRequest");
  static const OsmosisTwapV1beta1Types arithmeticTwapResponse =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.ArithmeticTwapResponse");

  static const OsmosisTwapV1beta1Types arithmeticTwapToNowRequest =
      OsmosisTwapV1beta1Types._(
          "/osmosis.twap.v1beta1.ArithmeticTwapToNowRequest");
  static const OsmosisTwapV1beta1Types arithmeticTwapToNowResponse =
      OsmosisTwapV1beta1Types._(
          "/osmosis.twap.v1beta1.ArithmeticTwapToNowResponse");

  /// query
  static const OsmosisTwapV1beta1Types arithmeticTwapToNow =
      OsmosisTwapV1beta1Types._(
          "/osmosis.twap.v1beta1.Query/ArithmeticTwapToNow",
          rpc: "/osmosis/twap/v1beta1/ArithmeticTwapToNow");
  static const OsmosisTwapV1beta1Types arithmeticTwap =
      OsmosisTwapV1beta1Types._("/osmosis.twap.v1beta1.Query/ArithmeticTwap",
          rpc: "/osmosis/twap/v1beta1/ArithmeticTwap");
  static const OsmosisTwapV1beta1Types queryParams = OsmosisTwapV1beta1Types._(
      "/osmosis.twap.v1beta1.Query/Params",
      rpc: "/osmosis/twap/v1beta1/Params");
}
