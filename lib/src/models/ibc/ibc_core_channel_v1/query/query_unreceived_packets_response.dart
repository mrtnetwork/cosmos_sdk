import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryUnreceivedPacketsResponse is the response type for the Query/UnreceivedPacketCommitments RPC method
class QueryUnreceivedPacketsResponse extends CosmosMessage {
  /// list of unreceived packet sequences
  final List<BigInt>? sequences;

  /// query block height
  final IbcClientHeight height;
  factory QueryUnreceivedPacketsResponse.fromRpc(Map<String, dynamic> json) {
    return QueryUnreceivedPacketsResponse(
      sequences: (json["sequences"] as List?)
          ?.map((e) => BigintUtils.parse(e))
          .toList(),
      height: IbcClientHeight.fromRpc(json["height"]),
    );
  }
  QueryUnreceivedPacketsResponse(
      {List<BigInt>? sequences, required this.height})
      : sequences = sequences?.emptyAsNull?.immutable;
  factory QueryUnreceivedPacketsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUnreceivedPacketsResponse(
        sequences: decode
                .getResult<ProtocolBufferDecoderResult?>(1)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[],
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
  TypeUrl get typeUrl => IbcTypes.queryUnreceivedPacketsResponse;

  @override
  List get values => [sequences, height];
}
