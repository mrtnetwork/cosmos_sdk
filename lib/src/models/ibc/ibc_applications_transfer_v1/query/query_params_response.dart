import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class IbcTransferQueryParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module.
  final IbcTransaferParams? params;
  const IbcTransferQueryParamsResponse({this.params});
  factory IbcTransferQueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return IbcTransferQueryParamsResponse(
      params:
          json["params"] == null
              ? null
              : IbcTransaferParams.fromJson(json["params"]),
    );
  }
  factory IbcTransferQueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTransferQueryParamsResponse(
      params: decode
          .getResult(1)
          ?.to<IbcTransaferParams, List<int>>(
            (e) => IbcTransaferParams.deserialize(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryParamsRequest;

  @override
  List get values => [params];
}
