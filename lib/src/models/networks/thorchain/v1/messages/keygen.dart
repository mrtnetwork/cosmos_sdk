import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainKeygen extends CosmosMessage {
  final String? id;
  final ThorchainKeygenType? type;
  final List<String>? members;
  ThorchainKeygen({this.id, this.type, List<String>? members})
      : members = members?.emptyAsNull?.immutable;
  factory ThorchainKeygen.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainKeygen(
        id: decode.getField(1),
        type: decode.getResult(2)?.to<ThorchainKeygenType, int>(
            (e) => ThorchainKeygenType.fromValue(e)),
        members: decode.getFields<String>(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "type": type?.value, "members": members};
  }

  @override
  String get typeUrl => ThorchainV1Types.keygen.typeUrl;

  @override
  List get values => [id, type, members];
}
