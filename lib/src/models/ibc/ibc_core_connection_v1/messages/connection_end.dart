import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/counterparty.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/version.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// ConnectionEnd defines a stateful object on a chain connected to another separate one. NOTE:
/// there must only be 2 defined ConnectionEnds to establish a connection between two chains.
class IbcConnectionConnectionEnd extends CosmosMessage {
  /// client associated with this connection.
  final String? clientId;

  /// IBC version which can be utilised to determine encodings or protocols for
  /// channels or packets utilising this connection.
  final List<IbcConnectionVersion>? versions;

  /// current state of the connection end.
  final IbcConnectionState? state;

  /// counterparty chain associated with this connection.
  final IbcConnectionCounterparty counterparty;

  /// delay period that must pass before a consensus state can be used for
  /// packet-verification NOTE: delay period logic is only implemented by some
  /// clients.
  final BigInt? delayPeriod;
  IbcConnectionConnectionEnd(
      {this.clientId,
      List<IbcConnectionVersion>? versions,
      this.state,
      required this.counterparty,
      this.delayPeriod})
      : versions = versions?.immutable;
  factory IbcConnectionConnectionEnd.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionConnectionEnd(
        clientId: decode.getField(1),
        versions: decode
            .getFields(2)
            .map((e) => IbcConnectionVersion.deserialize(e))
            .toList(),
        state: decode.getResult(3)?.to<IbcConnectionState, int>(
            (e) => IbcConnectionState.fromValue(e)),
        counterparty: IbcConnectionCounterparty.deserialize(decode.getField(4)),
        delayPeriod: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "versions": versions?.map((e) => e.toJson()).toList(),
      "state": state?.value,
      "counterparty": counterparty.toJson(),
      "delay_period": delayPeriod?.toString()
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcConnectionConnectionEnd.typeUrl;

  @override
  List get values =>
      [clientId, versions, state?.value, counterparty, delayPeriod];
}
