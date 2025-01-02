import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class EthermintTypesV1Types extends TypeUrl {
  static const String basePath = "/ethermint.types.v1";

  const EthermintTypesV1Types._(super.typeUrl);
  static const EthermintTypesV1Types ethAccount =
      EthermintTypesV1Types._("/ethermint.types.v1.EthAccount");
  static const EthermintTypesV1Types extensionOptionDynamicFeeTx =
      EthermintTypesV1Types._(
          "/ethermint.types.v1.ExtensionOptionDynamicFeeTx");
  static const EthermintTypesV1Types extensionOptionsWeb3Tx =
      EthermintTypesV1Types._("/ethermint.types.v1.ExtensionOptionsWeb3Tx");
  static const EthermintTypesV1Types txResult =
      EthermintTypesV1Types._("/ethermint.types.v1.TxResult");

  @override
  String? get rpc => throw UnimplementedError();
  static const List<EthermintTypesV1Types> values = [
    ethAccount,
    extensionOptionDynamicFeeTx,
    extensionOptionsWeb3Tx,
    txResult
  ];
  static EthermintTypesV1Types fromValue(String? typeUrl) {
    return values.firstWhere(
      (e) => e.typeUrl == typeUrl,
      orElse: () => throw DartCosmosSdkPluginException(
          "No EthermintTypesV1 element found for the given value.",
          details: {"@type": typeUrl}),
    );
  }
}
