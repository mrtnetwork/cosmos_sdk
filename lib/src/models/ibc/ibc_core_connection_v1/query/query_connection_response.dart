import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/messages/connection_end.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionResponse is the response type for the Query/Connection RPC method. Besides the connection end,
/// it includes a proof and the height from which the proof was retrieved.
class IbcConnectionQueryConnectionResponse extends CosmosMessage {
  /// connection associated with the request identifier
  final IbcConnectionConnectionEnd? connection;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  IbcConnectionQueryConnectionResponse(
      {this.connection, List<int>? proof, required this.proofHeight})
      : proof = BytesUtils.tryToBytes(proof);
  factory IbcConnectionQueryConnectionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcConnectionQueryConnectionResponse(
      connection: decode
          .getResult(1)
          ?.to<IbcConnectionConnectionEnd, List<int>>(
              (e) => IbcConnectionConnectionEnd.deserialize(e)),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "connection": connection?.toJson(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcConnectionQueryConnectionResponse.typeUrl;

  @override
  List get values => [connection, proof, proofHeight];
}
