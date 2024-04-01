import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class AnyMessage extends CosmosMessage {
  final Any _any;
  const AnyMessage(this._any);
  @override
  List<int> get fieldIds => _any.fieldIds;

  @override
  Map<String, dynamic> toJson() {
    return _any.toJson();
  }

  @override
  String get typeUrl => _any.typeUrl;

  @override
  List get values => _any.values;
}
