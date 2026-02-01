import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_tendermint_v1/messages/header.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Misbehaviour is a wrapper over two conflicting Headers that implements Misbehaviour interface expected by ICS-02
class IbcTendermintMisbehaviour extends CosmosMessage {
  /// ClientID is deprecated
  final String? clientId;
  final IbcTendermintHeader? header1;
  final IbcTendermintHeader? header2;
  const IbcTendermintMisbehaviour({this.clientId, this.header1, this.header2});
  factory IbcTendermintMisbehaviour.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTendermintMisbehaviour(
      clientId: decode.getField(1),
      header1: decode
          .getResult(2)
          ?.to<IbcTendermintHeader, List<int>>(
            (e) => IbcTendermintHeader.deserialize(e),
          ),
      header2: decode
          .getResult(3)
          ?.to<IbcTendermintHeader, List<int>>(
            (e) => IbcTendermintHeader.deserialize(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "header_1": header1?.toJson(),
      "header_2": header2?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcTendermintV1Misbehaviour;

  @override
  List get values => [clientId, header1, header2];
}
