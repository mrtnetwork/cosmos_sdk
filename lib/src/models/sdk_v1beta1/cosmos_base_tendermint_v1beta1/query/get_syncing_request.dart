import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/query/get_syncing_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetSyncingRequest is the request type for the Query/GetSyncing RPC method.
class GetSyncingRequest extends CosmosMessage
    with QueryMessage<GetSyncingResponse> {
  ///  This message has no fields.
  const GetSyncingRequest();
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => BaseTendermintV1beta1Types.getSyncingRequest;

  @override
  List get values => [];

  @override
  GetSyncingResponse onResponse(List<int> bytes) {
    return GetSyncingResponse.deserialize(bytes);
  }

  @override
  GetSyncingResponse onJsonResponse(Map<String, dynamic> json) {
    return GetSyncingResponse.fromJson(json);
  }
}
