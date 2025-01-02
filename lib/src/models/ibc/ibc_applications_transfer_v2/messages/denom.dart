import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/messages/hop.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Denom holds the base denom of a Token and a trace of the chains it was sent through.
class IbcTransferV2Denom extends CosmosMessage {
  /// the base token denomination
  final String base;

  /// the trace of the token
  final List<IbcTransferV1Hop> trace;

  IbcTransferV2Denom(
      {required this.base, required List<IbcTransferV1Hop> trace})
      : trace = trace.immutable;
  factory IbcTransferV2Denom.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTransferV2Denom(
      base: decode.getField(1),
      trace: decode
          .getFields<List<int>>(3)
          .map((e) => IbcTransferV1Hop.deserialize(e))
          .toList(),
    );
  }
  factory IbcTransferV2Denom.fromRpc(Map<String, dynamic> json) {
    return IbcTransferV2Denom(
        base: json["base"],
        trace: (json["trace"] as List?)
                ?.map((e) => IbcTransferV1Hop.fromRpc(e))
                .toList() ??
            []);
  }

  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "base": base,
      "trace": trace.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.denom;

  @override
  List get values => [base, trace];
}
