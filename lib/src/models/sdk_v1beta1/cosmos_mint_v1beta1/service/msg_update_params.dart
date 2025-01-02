import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/messages/params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
/// Since: cosmos-sdk 0.47
class MsgUpdateMintParams extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final CosmosBaseAddress? authority;

  /// params defines the x/mint parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final MintParams params;

  const MsgUpdateMintParams({
    this.authority,
    required this.params,
  });
  factory MsgUpdateMintParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgUpdateMintParams(
        authority: decode
            .getResult(1)
            ?.to<CosmosBaseAddress?, String>((e) => CosmosBaseAddress(e)),
        params: MintParams.deserialize(decode.getField(2)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority?.address,
      'params': params.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get service => MintV1beta1Types.mintUpdateParams;

  @override
  TypeUrl get typeUrl => MintV1beta1Types.msgUpdateMintParams;

  @override
  List get values => [authority?.address, params];
  @override
  List<String?> get signers => [authority?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        MintV1beta1Types.msgUpdateMintParamsResponse);
  }
}
