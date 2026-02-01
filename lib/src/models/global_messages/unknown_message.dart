import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class AnyMessage extends CosmosMessage {
  const AnyMessage();
  factory AnyMessage.deserialize(List<int> bytes) {
    return AnyBytesMessage.deserialize(bytes);
  }
  factory AnyMessage.fromJson(Map<String, dynamic> json) {
    return AnyJsonMessage(json);
  }
}

class AnyBytesMessage extends AnyMessage {
  final Any _any;
  List<int> get value => _any.value;
  const AnyBytesMessage(this._any);
  factory AnyBytesMessage.deserialize(List<int> bytes) {
    return AnyBytesMessage(Any.deserialize(bytes));
  }

  @override
  Any toAny() {
    return _any;
  }

  @override
  List<int> toBuffer() {
    return _any.toBuffer();
  }

  @override
  List<int> get fieldIds => _any.fieldIds;

  @override
  Map<String, dynamic> toJson() {
    return _any.toJson();
  }

  @override
  TypeUrl get typeUrl => UnknownTypeUrl(_any.typeUrl);

  @override
  List get values => _any.values;
}

class AnyJsonMessage extends AnyMessage {
  final Map<String, dynamic> message;
  const AnyJsonMessage._(this.message, this.typeUrl);
  factory AnyJsonMessage(Map<String, dynamic> json) {
    return AnyJsonMessage._(json, UnknownTypeUrl(json["@type"]));
  }
  @override
  List<int> get fieldIds =>
      throw DartCosmosSdkPluginException(
        "Failed to convert unknown message to Protobuf.",
      );

  @override
  Map<String, dynamic> toJson() {
    return message;
  }

  @override
  final TypeUrl typeUrl;

  @override
  List get values =>
      throw DartCosmosSdkPluginException(
        "Failed to convert unknown message to Protobuf.",
      );
}
