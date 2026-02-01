import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'counterparty_info.dart';

/// GenesisCounterpartyInfo defines the state associating a client with a counterparty.
class IbcClientV2GenesisCounterpartyInfo extends CosmosMessage {
  /// CounterpartyInfo is the counterparty info of the given client.
  final IbcClientV2CounterpartyInfo? counterpartyInfo;

  /// ClientId is the ID of the given client.
  final String? clientId;
  IbcClientV2GenesisCounterpartyInfo({
    required this.counterpartyInfo,
    required this.clientId,
  });
  factory IbcClientV2GenesisCounterpartyInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientV2GenesisCounterpartyInfo(
      counterpartyInfo: decode
          .getResult(2)
          ?.to<IbcClientV2CounterpartyInfo, List<int>>(
            IbcClientV2CounterpartyInfo.deserialize,
          ),
      clientId: decode.getField(1),
    );
  }
  factory IbcClientV2GenesisCounterpartyInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcClientV2GenesisCounterpartyInfo(
      counterpartyInfo: json
          .maybeAs<IbcClientV2CounterpartyInfo, Map<String, dynamic>>(
            key: "counterparty_info",
            onValue: IbcClientV2CounterpartyInfo.fromJson,
          ),
      clientId: json.as("client_id"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "counterparty_info": counterpartyInfo?.toJson(),
      "client_id": clientId,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibClientV2GenesisCounterpartyInfo;

  @override
  List get values => [clientId, counterpartyInfo];
}
