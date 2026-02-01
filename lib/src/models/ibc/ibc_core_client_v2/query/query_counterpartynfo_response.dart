import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v2/messages/counterparty_info.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryCounterpartyInfoResponse is the response type for the
/// Query/CounterpartyInfo RPC method.
class IbcClientV2QueryCounterpartyInfoResponse extends CosmosMessage {
  final IbcClientV2CounterpartyInfo? counterpartyInfo;
  IbcClientV2QueryCounterpartyInfoResponse({this.counterpartyInfo});
  factory IbcClientV2QueryCounterpartyInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcClientV2QueryCounterpartyInfoResponse(
      counterpartyInfo: json
          .maybeAs<IbcClientV2CounterpartyInfo, Map<String, dynamic>>(
            key: "counterparty_info",
            onValue: IbcClientV2CounterpartyInfo.fromJson,
          ),
    );
  }
  factory IbcClientV2QueryCounterpartyInfoResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientV2QueryCounterpartyInfoResponse(
      counterpartyInfo: decode
          .getResult(1)
          ?.to<IbcClientV2CounterpartyInfo, List<int>>(
            IbcClientV2CounterpartyInfo.deserialize,
          ),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"counterparty_info": counterpartyInfo?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibClientV2QueryCounterpartyInfoResponse;

  @override
  List get values => [counterpartyInfo];
}
