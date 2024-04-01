import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// App includes the protocol and software version for the application.
/// This information is included in ResponseInfo. The App.Protocol can be updated in ResponseEndBlock.
class App extends CosmosMessage {
  final BigInt? protocol;
  final String? software;
  const App({this.protocol, this.software});
  factory App.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return App(
      protocol: decode.getField(1),
      software: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"protocol": protocol?.toString(), "software": software};
  }

  @override
  String get typeUrl => TendermintTypes.app.typeUrl;

  @override
  List get values => [protocol, software];
}
