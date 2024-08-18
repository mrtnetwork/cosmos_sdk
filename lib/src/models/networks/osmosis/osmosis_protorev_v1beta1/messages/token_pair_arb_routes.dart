import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'route.dart';

/// TokenPairArbRoutes tracks all of the hot routes for a given pair of tokens
class OsmosisProtorevTokenPairArbRoutes extends CosmosMessage {
  /// Stores all of the possible hot paths for a given pair of tokens
  final List<OsmosisProtorevRoute> arbRsoutes;

  /// Token denomination of the first asset
  final String? tokenIn;

  /// Token denomination of the second asset
  final String? tokenOut;

  OsmosisProtorevTokenPairArbRoutes(
      {required List<OsmosisProtorevRoute> arbRsoutes,
      this.tokenIn,
      this.tokenOut})
      : arbRsoutes = arbRsoutes.immutable;

  factory OsmosisProtorevTokenPairArbRoutes.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevTokenPairArbRoutes(
        arbRsoutes: decode
            .getFields(1)
            .map((e) => OsmosisProtorevRoute.deserialize(e))
            .toList(),
        tokenIn: decode.getField(2),
        tokenOut: decode.getField(3));
  }
  factory OsmosisProtorevTokenPairArbRoutes.fromRpc(Map<String, dynamic> json) {
    return OsmosisProtorevTokenPairArbRoutes(
        arbRsoutes: (json["arb_routes"] as List?)
                ?.map((e) => OsmosisProtorevRoute.fromRpc(e))
                .toList() ??
            <OsmosisProtorevRoute>[],
        tokenIn: json["token_in"],
        tokenOut: json["token_out"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "arb_routes": arbRsoutes.map((e) => e.toJson()).toList(),
      "token_in": tokenIn,
      "token_out": tokenOut
    };
  }

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types.tokenPairArbRoutes.typeUrl;

  @override
  List get values => [arbRsoutes, tokenIn, tokenOut];
}
