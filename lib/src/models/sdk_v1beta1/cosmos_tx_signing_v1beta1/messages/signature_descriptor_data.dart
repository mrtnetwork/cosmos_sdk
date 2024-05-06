import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/messages/multi.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_signing_v1beta1/messages/single.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class BaseSignatureDescriptorData extends CosmosMessage {
  abstract final int id;
  const BaseSignatureDescriptorData();

  factory BaseSignatureDescriptorData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    if (decode.hasTag(1)) {
      return SignatureDescriptorDataSingle.desrialize(bytes);
    } else if (decode.hasTag(2)) {
      return SignatureDescriptorDataMulti.desrialize(bytes);
    }
    throw const MessageException("Invalid SignatureDescriptorData bytes.");
  }
}
