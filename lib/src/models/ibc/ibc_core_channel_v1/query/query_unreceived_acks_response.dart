import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryUnreceivedAcksResponse is the response type for the Query/UnreceivedAcks RPC method
class QueryUnreceivedAcksResponse extends CosmosMessage {
  /// list of unreceived acknowledgement sequences
  final List<BigInt>? sequences;

  /// query block height
  final IbcClientHeight height;
  factory QueryUnreceivedAcksResponse.fromJson(Map<String, dynamic> json) {
    return QueryUnreceivedAcksResponse(
      sequences:
          (json["sequences"] as List?)
              ?.map((e) => BigintUtils.parse(e))
              .toList(),
      height: IbcClientHeight.fromJson(json["height"]),
    );
  }
  QueryUnreceivedAcksResponse({List<BigInt>? sequences, required this.height})
    : sequences = sequences?.emptyAsNull?.immutable;
  factory QueryUnreceivedAcksResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUnreceivedAcksResponse(
      sequences:
          decode
              .getResult<ProtocolBufferDecoderResult?>(1)
              ?.to<List<BigInt>, List<int>>(
                (e) => e.map((e) => BigintUtils.parse(e)).toList(),
              ) ??
          <BigInt>[],
      height: IbcClientHeight.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequences": sequences?.map((e) => e.toString()),
      "height": height.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryUnreceivedAcksResponse;

  @override
  List get values => [sequences, height];
}
