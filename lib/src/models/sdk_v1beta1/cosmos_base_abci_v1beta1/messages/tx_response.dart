import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_abci/messages/event.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'abci_message_log.dart';

/// TxResponse defines a structure containing relevant tx data and metadata. The tags are stringified and the log is JSON decoded.
class TxResponse extends CosmosMessage {
  /// The block height.
  final BigInt height;

  /// The transaction hash.
  final String txHash;

  /// Namespace for the Code.
  final String? codespace;

  /// Response code.
  final int? code;

  /// Result bytes, if any.
  final String data;

  /// The output of the application's logger (raw string). May be non-deterministic.
  final String rawLog;

  /// The output of the application's logger (typed). May be non-deterministic.
  final List<ABCIMessageLog> logs;

  /// Additional information. May be non-deterministic.
  final String? info;

  /// Amount of gas requested for the transaction.
  final BigInt gasWanted;

  /// Amount of gas consumed by the transaction.
  final BigInt gasUsed;

  /// The request transaction bytes.
  final Any tx;

  /// Time of the previous block. For heights > 1, it's the weighted median of
  /// the timestamps of the valid votes in the block.LastCommit. For height == 1,
  /// it's genesis time.
  final String timestamp;

  /// Events emitted by processing a transaction.
  final List<Event> events;

  TxResponse({
    required this.height,
    required this.txHash,
    this.codespace,
    this.code,
    required this.data,
    required this.rawLog,
    required List<ABCIMessageLog> logs,
    this.info,
    required this.gasWanted,
    required this.gasUsed,
    required this.tx,
    required this.timestamp,
    required List<Event> events,
  })  : logs = logs.immutable,
        events = events.immutable;

  factory TxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxResponse(
        height: decode.getField(1),
        txHash: decode.getField(2),
        codespace: decode.getField(3),
        code: decode.getField(4),
        data: decode.getField(5),
        rawLog: decode.getField(6),
        logs: decode
            .getFields<List<int>>(7)
            .map((e) => ABCIMessageLog.deserialize(e))
            .toList(),
        info: decode.getField(8),
        gasWanted: decode.getField(9),
        gasUsed: decode.getField(10),
        tx: Any.deserialize(decode.getField(11)),
        timestamp: decode.getField(12),
        events: decode
            .getFields<List<int>>(13)
            .map((e) => Event.deserialize(e))
            .toList());
  }

  /// Converts the transaction response to a JSON-serializable map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height.toString(),
      'txHash': txHash,
      'codespace': codespace,
      'code': code.toString(),
      'data': data,
      'raw_log': rawLog,
      'logs': logs.map((log) => log.toJson()).toList(),
      'info': info,
      'gas_wanted': gasWanted.toString(),
      'gas_used': gasUsed.toString(),
      'tx': tx.toJson(),
      'timestamp': timestamp,
      'events': events.map((event) => event.toJson()).toList(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  @override
  String get typeUrl => BaseAbciV1beta1.txResponse.typeUrl;

  @override
  List get values => [
        height,
        txHash,
        codespace,
        code,
        data,
        rawLog,
        logs,
        info,
        gasWanted,
        gasUsed,
        tx,
        timestamp,
        events
      ];
}
