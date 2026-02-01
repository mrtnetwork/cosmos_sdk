import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_crisis_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams is the Msg/UpdateParams request type.
///
/// Since: cosmos-sdk 0.47
class CrisisMsgUpdateParams
    extends CrisisV1Beta1Service<EmptyServiceRequestResponse> {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final CosmosBaseAddress? authority;

  /// constant_fee defines the x/crisis parameter.
  final Coin constantFee;
  const CrisisMsgUpdateParams({this.authority, required this.constantFee});
  factory CrisisMsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CrisisMsgUpdateParams(
      authority: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      constantFee: Coin.deserialize(decode.getField(2)),
    );
  }
  factory CrisisMsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return CrisisMsgUpdateParams(
      authority: json.maybeAs<CosmosBaseAddress, String>(
        key: "authority",
        onValue: (e) => CosmosBaseAddress(e),
      ),
      constantFee: Coin.fromJson(json.asMap("authority")),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority?.address,
      "constant_fee": constantFee.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => CrisisV1beta1.crisisMsgUpdateParams;

  @override
  List get values => [authority?.address, constantFee];
  @override
  List<String?> get signers => [authority?.address];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      CrisisV1beta1.crisisMsgUpdateParamsResponse,
    );
  }
}
