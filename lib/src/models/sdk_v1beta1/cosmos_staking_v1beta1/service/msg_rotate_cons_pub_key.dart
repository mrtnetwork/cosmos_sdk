import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

class MsgRotateConsPubKey extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress? validatorAddress;
  final Any? newPubkey;

  const MsgRotateConsPubKey({
    required this.validatorAddress,
    required this.newPubkey,
  });

  factory MsgRotateConsPubKey.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRotateConsPubKey(
        validatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        newPubkey:
            decode.getResult(2)?.to<Any, List<int>>((e) => Any.deserialize(e)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'validator_address': validatorAddress?.address,
      'new_pubkey': newPubkey?.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get service => StakingV1beta1Types.rotateConsPubKey.typeUrl;

  @override
  String get typeUrl => StakingV1beta1Types.msgRotateConsPubKey.typeUrl;

  @override
  List get values => [validatorAddress?.address, newPubkey];
  @override
  List<String?> get signers => [validatorAddress?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        StakingV1beta1Types.msgRotateConsPubKeyResponse.typeUrl);
  }
}
