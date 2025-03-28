import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryUnreceivedAcksResponse is the response type for the
/// Query/UnreceivedAcks RPC method
class IbcChannelV2QueryUnreceivedAcksResponse extends CosmosMessage {
  /// list of unreceived acknowledgement sequences
  final List<BigInt>? sequences;

  /// query block height
  final IbcClientHeight height;
  factory IbcChannelV2QueryUnreceivedAcksResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryUnreceivedAcksResponse(
      sequences: json
          .as<List?>("sequences")
          ?.map((e) => BigintUtils.parse(e))
          .toList(),
      height: IbcClientHeight.fromJson(json.asMap("height")),
    );
  }
  IbcChannelV2QueryUnreceivedAcksResponse(
      {List<BigInt>? sequences, required this.height})
      : sequences = sequences?.immutable;
  factory IbcChannelV2QueryUnreceivedAcksResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2QueryUnreceivedAcksResponse(
        sequences: decode.getFields<BigInt>(1),
        height: IbcClientHeight.deserialize(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequences": sequences?.map((e) => e.toString()).toList(),
      "height": height.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryUnreceivedAcksResponse;

  @override
  List get values => [sequences, height];
}
