import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetSyncingResponse is the response type for the Query/GetSyncing RPC method.
class GetSyncingResponse extends CosmosMessage {
  final bool? syncing;
  const GetSyncingResponse({this.syncing});
  factory GetSyncingResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GetSyncingResponse(syncing: decode.getField(1));
  }
  factory GetSyncingResponse.fromJson(Map<String, dynamic> json) {
    return GetSyncingResponse(syncing: json["syncing"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"syncing": syncing};
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.getSyncingResponse;

  @override
  List get values => [syncing];
}
