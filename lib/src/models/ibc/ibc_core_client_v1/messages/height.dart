import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Height is a monotonically increasing data type that can be compared against another
/// Height for the purposes of updating and freezing clients

/// Normally the RevisionHeight is incremented at each height while keeping RevisionNumber the same.
/// However some consensus algorithms may choose to reset the height in certain conditions e.g.
/// hard forks, state-machine breaking changes In these cases, the RevisionNumber is incremented so that height continues to be monitonically increasing even as the RevisionHeight gets reset
class IbcClientHeight extends CosmosMessage {
  /// the revision that the client is currently on
  final BigInt? revisionNumber;

  /// the height within the given revision
  final BigInt? revisionHeight;

  factory IbcClientHeight.fromJson(Map<String, dynamic> json) {
    return IbcClientHeight(
      revisionHeight: BigintUtils.tryParse(json["revision_height"]),
      revisionNumber: BigintUtils.tryParse(json["revision_number"]),
    );
  }
  const IbcClientHeight({this.revisionHeight, this.revisionNumber});
  factory IbcClientHeight.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcClientHeight(
      revisionNumber: decode.getField(1),
      revisionHeight: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "revision_number": revisionNumber?.toString(),
      "revision_height": revisionHeight?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.height;

  @override
  List get values => [revisionNumber, revisionHeight];
}
