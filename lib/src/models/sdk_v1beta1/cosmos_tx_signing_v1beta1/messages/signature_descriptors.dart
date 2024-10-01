import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'signature_descriptor.dart';

/// SignatureDescriptors wraps multiple SignatureDescriptor's.
class SignatureDescriptors extends CosmosMessage {
  /// signatures are the signature descriptors
  final List<SignatureDescriptor>? signatures;
  SignatureDescriptors({List<SignatureDescriptor>? signatures})
      : signatures = signatures?.emptyAsNull?.immutable;
  factory SignatureDescriptors.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignatureDescriptors(
        signatures: decode
            .getFields(1)
            .map((e) => SignatureDescriptor.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"signatures": signatures?.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => TxSigningV1beta1Types.signatureDescriptors.typeUrl;

  @override
  List get values => [1];
}
