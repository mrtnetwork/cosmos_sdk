import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryClientConnectionsResponse is the response type for the Query/ClientConnections RPC method
class IbcConnectionQueryClientConnectionsResponse extends CosmosMessage {
  /// slice of all the connection paths associated with a client.
  final List<String>? connectionPaths;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was generated
  final IbcClientHeight proofHeight;

  factory IbcConnectionQueryClientConnectionsResponse.fromRpc(
      Map<String, dynamic> json) {
    return IbcConnectionQueryClientConnectionsResponse(
        proofHeight: IbcClientHeight.fromRpc(json["proof_height"]),
        connectionPaths: (json["connection_paths"] as List?)?.cast(),
        proof: CosmosUtils.tryToBytes(json["proof"]));
  }
  IbcConnectionQueryClientConnectionsResponse(
      {List<String>? connectionPaths,
      List<int>? proof,
      required this.proofHeight})
      : connectionPaths = connectionPaths?.emptyAsNull?.immutable,
        proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory IbcConnectionQueryClientConnectionsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryClientConnectionsResponse(
      connectionPaths: decode.getFields<String>(1),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "connection_paths": connectionPaths,
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcConnectionQueryClientConnectionsResponse;

  @override
  List get values => [connectionPaths, proof, proofHeight];
}
