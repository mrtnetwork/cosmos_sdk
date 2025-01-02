import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Owner defines a single capability owner. An owner is defined by the name of capability and the module name.
class Owner extends CosmosMessage {
  final String? module;
  final String? name;
  const Owner({this.module, this.name});
  factory Owner.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Owner(module: decode.getField(1), name: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"module": module, "name": name};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.owner;

  @override
  List get values => [module, name];
}
