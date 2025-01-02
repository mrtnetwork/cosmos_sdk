import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class NetAddress extends CosmosMessage {
  final String? id;
  final String? ip;
  final int? port;
  NetAddress({this.id, this.ip, this.port});
  factory NetAddress.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return NetAddress(
        id: decode.getField(1),
        ip: decode.getField(2),
        port: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "ip": ip, "port": port};
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.netAddress;

  @override
  List get values => [id, ip, port];
}
