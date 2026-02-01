import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMinJoinLast extends CosmosMessage {
  final BigInt? lastChangedHeight;
  final String? version;
  const ThorchainMinJoinLast({this.lastChangedHeight, this.version});
  factory ThorchainMinJoinLast.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMinJoinLast(
      lastChangedHeight: decode.getField(1),
      version: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "last_changed_height": lastChangedHeight?.toString(),
      "version": version,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.minJoinLast;

  @override
  List get values => [lastChangedHeight, version];
}
