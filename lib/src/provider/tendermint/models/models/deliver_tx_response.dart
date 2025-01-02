import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/provider/tendermint/models/models/event_response.dart';

class DeliverTxResponse {
  final int code;
  final List<int>? data;
  final String? log;
  final String? info;
  final BigInt? gasWanted;
  final BigInt? gasUsed;
  final List<CheckTxEventResponse>? events;
  final String? codespace;
  DeliverTxResponse(
      {required this.code,
      List<int>? data,
      this.log,
      this.info,
      this.gasWanted,
      this.gasUsed,
      List<CheckTxEventResponse>? events,
      this.codespace})
      : data = BytesUtils.tryToBytes(data, unmodifiable: true),
        events = events?.immutable;
  factory DeliverTxResponse.fromJson(Map<String, dynamic> json) {
    final String log = json["log"] ?? '';
    return DeliverTxResponse(
        code: json["code"],
        data: StringUtils.tryEncode(json["data"], type: StringEncoding.base64),
        log: log.trim().isEmpty ? null : log,
        info: json["info"],
        gasWanted: BigintUtils.tryParse(json["gas_wanted"]),
        gasUsed: BigintUtils.tryParse(json["gas_used"]),
        events: (json["events"] as List?)
            ?.map((e) => CheckTxEventResponse.fromJson(e))
            .toList(),
        codespace: json["codespace"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': StringUtils.tryDecode(data, type: StringEncoding.base64),
      'log': log,
      'info': info,
      'gas_wanted': gasWanted?.toString(),
      'gas_used': gasUsed?.toString(),
      'events': events?.map((event) => event.toJson()).toList(),
      'codespace': codespace,
    };
  }
}
