import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
///
/// Since: cosmos-sdk 0.47
class DistributionMsgUpdateParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final CosmosBaseAddress? authority;

  /// params defines the x/distribution parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final DistributionParams params;
  const DistributionMsgUpdateParams({this.authority, required this.params});
  factory DistributionMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionMsgUpdateParams(
      authority: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      params: DistributionParams.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get service =>
      DistributionV1beta1Types.distributionUpdateParams.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority?.address, "params": params.toJson()};
  }

  @override
  String get typeUrl =>
      DistributionV1beta1Types.distributionMsgUpdateParams.typeUrl;

  @override
  List get values => [authority, params];

  @override
  List<String?> get signers => [authority?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        DistributionV1beta1Types.distributionMsgUpdateParamsResponse.typeUrl);
  }
}
