import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';
import 'package:cosmos_sdk/src/provider/tendermint/models/models/abci_response.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

/// Query the application for some information.
/// https://docs.tendermint.com/v0.34/rpc/#/ABCI/abci_query
class TendermintRequestBroadcastAbciQuery
    extends TendermintRequest<ABCIResponse, Map<String, dynamic>> {
  TendermintRequestBroadcastAbciQuery({
    required this.path,
    required this.data,
    this.height,
    this.prove,
  });
  factory TendermintRequestBroadcastAbciQuery.fromQueryRequest({
    required QueryMessage request,
    int? height,
    bool? prove,
  }) {
    return TendermintRequestBroadcastAbciQuery(
      path: request.typeUrl.query!,
      data: BytesUtils.toHexString(request.toBuffer(), prefix: "0x"),
      height: height,
      prove: prove,
    );
  }

  /// Path to the data ("/a/b/c")
  final String path;

  /// Data
  final String data;

  /// Height (0 means latest)
  /// Default value : 0
  final int? height;

  /// Include proofs of the transactions inclusion in the block
  /// Default value : false
  final bool? prove;

  /// Query the application for some information.
  @override
  String get method => TendermintMethods.abciQuery.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {
    "path": '''"$path"''',
    "data": data,
    "height": height?.toString(),
    "prove": prove?.toString(),
  };
  @override
  ABCIResponse onResonse(Map<String, dynamic> result) {
    return ABCIResponse.fromJson(result["response"]);
  }
}
