import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgSetVersion extends CosmosMessage {
  final String? version;
  final List<int>? signer;
  ThorchainMsgSetVersion({this.version, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgSetVersion.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSetVersion(
        version: decode.getField(1), signer: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"version": version, "signer": BytesUtils.tryToHexString(signer)};
  }

  @override
  String get typeUrl => ThorchainV1Types.msgSetVersion.typeUrl;

  @override
  List get values => [version, signer];
}
