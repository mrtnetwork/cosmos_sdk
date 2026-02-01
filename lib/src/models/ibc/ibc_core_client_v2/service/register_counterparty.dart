import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgRegisterCounterparty defines a message to register a counterparty on a client
class IbcClientV2MsgRegisterCounterparty
    extends IbcService<EmptyServiceRequestResponse> {
  /// client identifier
  final String? clientId;

  /// counterparty merkle prefix
  final List<List<int>>? counterpartyMerklePrefix;

  /// counterparty client identifier
  final String? counterpartyClientId;

  /// signer address
  final String? signer;
  IbcClientV2MsgRegisterCounterparty({
    this.clientId,
    this.counterpartyClientId,
    List<List<int>>? counterpartyMerklePrefix,
    this.signer,
  }) : counterpartyMerklePrefix =
           counterpartyMerklePrefix
               ?.map((e) => e.asImmutableBytes)
               .toImutableList;
  factory IbcClientV2MsgRegisterCounterparty.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientV2MsgRegisterCounterparty(
      clientId: decode.getField(1),
      counterpartyMerklePrefix: decode.getFields<List<int>>(2),
      counterpartyClientId: decode.getField(3),
      signer: decode.getField(4),
    );
  }
  factory IbcClientV2MsgRegisterCounterparty.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcClientV2MsgRegisterCounterparty(
      clientId: json.as("client_id"),
      counterpartyMerklePrefix:
          json
              .asListOfString("counterparty_merkle_prefix")
              ?.map((e) => CosmosUtils.toBytes(e))
              .toList(),
      counterpartyClientId: json.as("counterparty_client_id"),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "counterparty_merkle_prefix":
          counterpartyMerklePrefix
              ?.map((e) => CosmosUtils.toBase64(e))
              .toList(),
      "counterparty_client_id": counterpartyClientId,
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibClientV2MsgRegisterCounterparty;

  @override
  List get values => [
    clientId,
    counterpartyMerklePrefix,
    counterpartyClientId,
    signer,
  ];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      IbcTypes.ibClientV2MsgRegisterCounterpartyResponse,
    );
  }
}
