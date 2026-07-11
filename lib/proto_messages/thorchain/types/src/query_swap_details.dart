import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/msg_swap.dart"
    as types_msg_swap;

class QuerySwapDetailsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySwapDetailsResponse> {
  final String? txId;

  final String? height;

  const QuerySwapDetailsRequest({this.txId, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/queue/swap/details/{tx_id}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [txId, height];

  @override
  Map<String, dynamic> toJson() {
    return {'tx_id': txId, 'height': height};
  }

  factory QuerySwapDetailsRequest.fromJson(Map<String, dynamic> json) {
    return QuerySwapDetailsRequest(
      txId: json.valueAsString<String?>('tx_id', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QuerySwapDetailsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapDetailsRequest(
      txId: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySwapDetailsRequest;
  @override
  QuerySwapDetailsResponse onQueryResponse(List<int> bytes) {
    return QuerySwapDetailsResponse.deserialize(bytes);
  }

  @override
  QuerySwapDetailsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySwapDetailsResponse.fromJson(json);
  }
}

class QuerySwapDetailsResponse extends CosmosProtoMessage {
  final types_msg_swap.MsgSwap? swap;

  final String? status;

  final String? queueType;

  const QuerySwapDetailsResponse({this.swap, this.status, this.queueType});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [swap, status, queueType];

  @override
  Map<String, dynamic> toJson() {
    return {'swap': swap?.toJson(), 'status': status, 'queue_type': queueType};
  }

  factory QuerySwapDetailsResponse.fromJson(Map<String, dynamic> json) {
    return QuerySwapDetailsResponse(
      swap: json.valueTo<types_msg_swap.MsgSwap?, Map<String, dynamic>>(
        key: 'swap',
        parse: (v) => types_msg_swap.MsgSwap.fromJson(v),
        acceptCamelCase: true,
      ),
      status: json.valueAsString<String?>('status', acceptCamelCase: true),
      queueType: json.valueAsString<String?>(
        'queue_type',
        acceptCamelCase: true,
      ),
    );
  }

  factory QuerySwapDetailsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySwapDetailsResponse(
      swap: decode.messageTo<types_msg_swap.MsgSwap?>(
        1,
        (b) => types_msg_swap.MsgSwap.deserialize(b),
      ),
      status: decode.getString<String?>(2),
      queueType: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQuerySwapDetailsResponse;
}
