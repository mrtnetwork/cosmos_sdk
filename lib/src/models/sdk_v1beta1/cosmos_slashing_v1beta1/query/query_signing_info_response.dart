import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/messages/validator_signing_info.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_slashing_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySigningInfoResponse is the response type for the Query/SigningInfo RPC method
class SlashingQuerySigningInfoResponse extends CosmosMessage {
  /// val_signing_info is the signing info of requested val cons address
  final SlashingValidatorSigningInfo valSigningInfo;
  const SlashingQuerySigningInfoResponse(this.valSigningInfo);
  factory SlashingQuerySigningInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SlashingQuerySigningInfoResponse(
        SlashingValidatorSigningInfo.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"val_signing_info": valSigningInfo.toJson()};
  }

  @override
  String get typeUrl =>
      SlashingV1beta1Types.slashingQuerySigningInfoResponse.typeUrl;

  @override
  List get values => [valSigningInfo];
}
