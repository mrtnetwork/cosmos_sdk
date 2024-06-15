import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgSetIPAddress extends CosmosMessage {
  final String? ipAddress;
  final List<int>? signer;
  ThorchainMsgSetIPAddress({this.ipAddress, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgSetIPAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSetIPAddress(
        ipAddress: decode.getField(1), signer: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "ip_address": ipAddress,
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgSetIPAddress.typeUrl;

  @override
  List get values => [ipAddress, signer];
}
