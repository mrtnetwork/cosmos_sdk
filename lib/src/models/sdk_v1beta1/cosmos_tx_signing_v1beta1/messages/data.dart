import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/messages/signature_descriptor_data.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Data represents signature data
class SignatureDescriptorData extends CosmosMessage {
  final BaseSignatureDescriptorData? sum;
  const SignatureDescriptorData({this.sum});
  factory SignatureDescriptorData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignatureDescriptorData(
        sum: decode.isEmpty
            ? null
            : BaseSignatureDescriptorData.deserialize(bytes));
  }

  @override
  List<int> get fieldIds => [sum?.id ?? 1];

  @override
  Map<String, dynamic> toJson() {
    return {"sum": sum?.toJson()};
  }

  @override
  TypeUrl get typeUrl => TxSigningV1beta1Types.data;

  @override
  List get values => [sum];
}
