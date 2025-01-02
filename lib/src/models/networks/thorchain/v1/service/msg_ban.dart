import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgBan extends CosmosMessage with ServiceMessage {
  final CosmosBaseAddress? nodeAddress;
  final CosmosBaseAddress? signer;
  ThorchainMsgBan({this.nodeAddress, this.signer});
  factory ThorchainMsgBan.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgBan(
        nodeAddress: decode.getResult(2)?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e)),
        signer: decode.getResult(3)?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e)));
  }

  @override
  List<int> get fieldIds => [2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"node_address": nodeAddress?.address, "signer": signer?.address};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgBan;

  @override
  List get values => [nodeAddress?.toBytes(), signer?.toBytes()];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  TypeUrl get service => typeUrl;

  @override
  List<String?> get signers => [signer?.address];
}
