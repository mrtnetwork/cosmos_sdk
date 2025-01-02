import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryEpochProvisionsResponse is the response type for the Query/EpochProvisions RPC method.
class OsmosisMintQueryEpochProvisionsResponse extends CosmosMessage {
  /// epoch_provisions is the current minting per epoch provisions value.
  final List<int> epochProvisions;
  OsmosisMintQueryEpochProvisionsResponse(List<int> epochProvisions)
      : epochProvisions =
            BytesUtils.toBytes(epochProvisions, unmodifiable: true);
  factory OsmosisMintQueryEpochProvisionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisMintQueryEpochProvisionsResponse(decode.getField(1));
  }
  factory OsmosisMintQueryEpochProvisionsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisMintQueryEpochProvisionsResponse(StringUtils.encode(
        json["epoch_provisions"],
        type: StringEncoding.base64));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"epoch_provisions": BytesUtils.toHexString(epochProvisions)};
  }

  @override
  TypeUrl get typeUrl => OsmosisMintV1beta1Types.queryEpochProvisionsResponse;

  @override
  List get values => [epochProvisions];
}
