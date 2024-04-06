import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/counterparty.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/version.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// IdentifiedConnection defines a connection with additional connection identifier field.
class IbcConnectionIdentifiedConnection extends CosmosMessage {
  /// connection identifier.
  final String? id;

  /// client associated with this connection.
  final String? clientId;

  /// IBC version which can be utilised to determine encodings or protocols for
  /// channels or packets utilising this connection
  final List<IbcConnectionVersion>? versions;

  /// current state of the connection end.
  final IbcConnectionState? state;

  /// counterparty chain associated with this connection.
  final IbcConnectionCounterparty counterparty;

  /// delay period associated with this connection.
  final BigInt? delayPeriod;
  IbcConnectionIdentifiedConnection(
      {this.id,
      this.clientId,
      List<IbcConnectionVersion>? versions,
      this.state,
      required this.counterparty,
      this.delayPeriod})
      : versions = versions?.nullOnEmpy;
  factory IbcConnectionIdentifiedConnection.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionIdentifiedConnection(
      id: decode.getField(1),
      clientId: decode.getField(2),
      versions: decode
          .getFields(3)
          .map((e) => IbcConnectionVersion.deserialize(e))
          .toList(),
      delayPeriod: decode.getField(6),
      state: decode
          .getResult(4)
          ?.to<IbcConnectionState, int>((e) => IbcConnectionState.fromValue(e)),
      counterparty: IbcConnectionCounterparty.deserialize(decode.getField(5)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "client_id": clientId,
      "versions": versions?.map((e) => e.toJson()).toList(),
      "state": state?.value,
      "counterparty": counterparty.toJson(),
      "delay_period": delayPeriod?.toString()
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcConnectionIdentifiedConnection.typeUrl;

  @override
  List get values =>
      [id, clientId, versions, state?.value, counterparty, delayPeriod];
}
