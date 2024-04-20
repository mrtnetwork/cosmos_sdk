import 'package:blockchain_utils/binary/utils.dart';
import 'package:blockchain_utils/numbers/bigint_utils.dart';
import 'package:blockchain_utils/numbers/int_utils.dart';
import 'package:blockchain_utils/string/string.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'event_response.dart';

class CheckTxResponse {
  final int? code;
  final List<int>? data;
  final String? log;
  final String? info;
  final BigInt gasWanted;
  final BigInt gasUsed;
  final String? codespace;
  final String? sender;
  final BigInt? priority;
  final String? mempoolError;
  final List<EventResponse> events;

  CheckTxResponse({
    this.codespace,
    this.code,
    List<int>? data,
    this.log,
    required List<EventResponse> events,
    this.info,
    required this.gasWanted,
    required this.gasUsed,
    this.mempoolError,
    this.priority,
    this.sender,
  })  : events = events.mutable,
        data = BytesUtils.tryToBytes(data, unmodifiable: true);

  factory CheckTxResponse.fromJson(Map<String, dynamic> json) {
    return CheckTxResponse(
        events: (json["events"] as List?)
                ?.map((e) => EventResponse.fromJson(e))
                .toList() ??
            <EventResponse>[],
        gasWanted: BigintUtils.parse(json["gas_wanted"]),
        gasUsed: BigintUtils.parse(json["gas_used"]),
        code: IntUtils.tryParse(json["code"]),
        data: StringUtils.tryEncode(json["data"], StringEncoding.base64),
        log: json["log"],
        info: json["info"],
        codespace: json["codespace"],
        sender: json["sender"],
        priority: BigintUtils.tryParse(json["priority"]),
        mempoolError: json["mempool_error"]);
  }
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': StringUtils.tryDecode(data, StringEncoding.base64),
      'log': log,
      'info': info,
      'gas_wanted': gasWanted.toString(),
      'gas_used': gasUsed.toString(),
      'codespace': codespace,
      'sender': sender,
      'priority': priority?.toString(),
      'mempool_error': mempoolError,
      'events': events.map((event) => event.toJson()).toList(),
    };
  }
}
