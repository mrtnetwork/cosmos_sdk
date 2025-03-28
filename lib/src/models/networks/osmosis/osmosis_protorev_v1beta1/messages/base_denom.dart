import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// BaseDenom represents a single base denom that the module uses for its arbitrage trades.
/// It contains the denom name alongside the step size of the binary search
/// that is used to find the optimal swap amount
class OsmosisProtorevBaseDenom extends CosmosMessage {
  /// The denom i.e. name of the base denom (ex. uosmo)
  final String? denom;

  /// The step size of the binary search that is used to find the optimal swap
  /// amount
  final String? stepSize;

  const OsmosisProtorevBaseDenom({this.denom, this.stepSize});

  factory OsmosisProtorevBaseDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevBaseDenom(
        denom: decode.getField(1), stepSize: decode.getField(2));
  }
  factory OsmosisProtorevBaseDenom.fromJson(Map<String, dynamic> json) {
    return OsmosisProtorevBaseDenom(
        denom: json["denom"], stepSize: json["step_size"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "step_size": stepSize};
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.baseDenom;

  @override
  List get values => [denom, stepSize];
}
