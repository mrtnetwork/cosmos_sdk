import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/query/query_signing_info_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySigningInfoRequest is the request type for the Query/SigningInfo RPC method
class SlashingQuerySigningInfoRequest extends CosmosMessage
    with QueryMessage<SlashingQuerySigningInfoResponse> {
  /// cons_address is the address to query signing info of
  final BaseAddress consAddress;
  const SlashingQuerySigningInfoRequest(this.consAddress);

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => SlashingV1beta1Types.slashingSigningInfo.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"cons_address": consAddress.address};
  }

  @override
  String get typeUrl =>
      SlashingV1beta1Types.slashingQuerySigningInfoRequest.typeUrl;

  @override
  List get values => [consAddress.address];
  @override
  SlashingQuerySigningInfoResponse onResponse(List<int> bytes) {
    return SlashingQuerySigningInfoResponse.deserialize(bytes);
  }
}
