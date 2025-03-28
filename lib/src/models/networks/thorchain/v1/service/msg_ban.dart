import 'package:cosmos_sdk/src/address/address/address.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/core/service.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class ThorchainMsgBan extends ThorchainV1Service<EmptyServiceRequestResponse> {
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
  factory ThorchainMsgBan.fromJson(Map<String, dynamic> json) {
    return ThorchainMsgBan(
        nodeAddress: json.maybeAs<CosmosBaseAddress, String>(
          key: "node_address",
          onValue: (e) {
            return CosmosBaseAddress.fromBytes(CosmosUtils.toBytes(e));
          },
        ),
        signer: json.maybeAs<CosmosBaseAddress, String>(
          key: "signer",
          onValue: (e) {
            return CosmosBaseAddress.fromBytes(CosmosUtils.toBytes(e));
          },
        ));
  }
  @override
  List<int> get fieldIds => [2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"node_address": nodeAddress?.address, "signer": signer?.address};
  }

  @override
  ThorchainV1Types get typeUrl => ThorchainV1Types.msgBan;

  @override
  List get values => [nodeAddress?.toBytes(), signer?.toBytes()];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  List<String?> get signers => [signer?.address];
}
