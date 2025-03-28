import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// CounterpartyInfo defines the key that the counterparty will use to message our client
class IbcClientV2CounterpartyInfo extends CosmosMessage {
  /// merkle prefix key is the prefix that ics provable keys are stored under
  final List<List<int>>? merklePrefix;

  /// client identifier is the identifier used to send packet messages to our client
  final String? clientId;
  IbcClientV2CounterpartyInfo(
      {required List<List<int>>? merklePrefix, required this.clientId})
      : merklePrefix =
            merklePrefix?.map((e) => e.asImmutableBytes).toImutableList;
  factory IbcClientV2CounterpartyInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientV2CounterpartyInfo(
        merklePrefix: decode.getFields<List<int>>(1),
        clientId: decode.getField(2));
  }
  factory IbcClientV2CounterpartyInfo.fromJson(Map<String, dynamic> json) {
    return IbcClientV2CounterpartyInfo(
      merklePrefix: json
          .asListOfString("merkle_prefix")
          ?.map((e) => CosmosUtils.toBytes(e))
          .toList(),
      clientId: json.as("client_id"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "merkle_prefix":
          merklePrefix?.map((e) => CosmosUtils.tryToBase64(e)).toList(),
      "client_id": clientId
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibClientV2CounterpartyInfo;

  @override
  List get values => [merklePrefix, clientId];
}
