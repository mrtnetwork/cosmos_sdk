import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryUnreceivedAcksResponse is the response type for the Query/UnreceivedAcks RPC method
class QueryUnreceivedAcksResponse extends CosmosMessage {
  /// list of unreceived acknowledgement sequences
  final List<BigInt>? sequences;

  /// query block height
  final IbcClientHeight height;
  QueryUnreceivedAcksResponse({List<BigInt>? sequences, required this.height})
      : sequences = sequences?.nullOnEmpy;
  factory QueryUnreceivedAcksResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUnreceivedAcksResponse(
        sequences: decode.getFields<BigInt>(1),
        height: IbcClientHeight.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequences": sequences?.map((e) => e.toString()),
      "height": height.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryUnreceivedAcksResponse.typeUrl;

  @override
  List get values => [sequences, height];
}
