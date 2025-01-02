import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v2/messages/denom.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomResponse is the response type for the Query/Denom RPC
/// method.
class IbcTransferV2QueryDenomResponse extends CosmosMessage {
  /// denom returns the requested denomination.
  final IbcTransferV2Denom denom;

  IbcTransferV2QueryDenomResponse({required this.denom});
  factory IbcTransferV2QueryDenomResponse.fromRpc(Map<String, dynamic> json) {
    return IbcTransferV2QueryDenomResponse(
      denom: IbcTransferV2Denom.fromRpc(json["denom"]),
    );
  }
  factory IbcTransferV2QueryDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTransferV2QueryDenomResponse(
        denom: IbcTransferV2Denom.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryDenomRespone;

  @override
  List get values => [denom];
}
