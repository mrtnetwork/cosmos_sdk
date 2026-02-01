import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ExtensionOptionsWeb3Tx is an extension option that specifies the typed chain id,
/// the fee payer as well as its signature data.
class EvmosEthermintTypesV1ExtensionOptionsWeb3Tx extends CosmosMessage {
  /// typed_data_chain_id is used only in EIP712 Domain and should match
  /// Ethereum network ID in a Web3 provider (e.g. Metamask).
  final BigInt typedDataChainId;

  /// fee_payer is an account address for the fee payer. It will be validated
  /// during EIP712 signature checking.
  final String feePayer;

  /// fee_payer_sig is a signature data from the fee paying account,
  /// allows to perform fee delegation when using EIP712 Domain.
  final String feePayerSig;
  const EvmosEthermintTypesV1ExtensionOptionsWeb3Tx({
    required this.typedDataChainId,
    required this.feePayer,
    required this.feePayerSig,
  });
  factory EvmosEthermintTypesV1ExtensionOptionsWeb3Tx.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintTypesV1ExtensionOptionsWeb3Tx(
      typedDataChainId: decode.getField(1),
      feePayer: decode.getField(2),
      feePayerSig: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "typed_data_chain_id": typedDataChainId.toString(),
      "fee_payer": feePayer,
      "fee_payer_sig": feePayerSig,
    };
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.extensionOptionsWeb3Tx;

  @override
  List get values => [typedDataChainId, feePayer, feePayerSig];
}
