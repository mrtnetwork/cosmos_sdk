import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/core.dart';
import 'package:cosmos_sdk/src/provider/tendermint/core/tendermint.dart';
import 'package:cosmos_sdk/src/provider/tendermint/models/models/abci_response.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

/// Query the application for some information.
/// https://docs.tendermint.com/v0.34/rpc/#/ABCI/abci_query
class TendermintRequestAbciQuery<Response>
    extends TendermintRequestParam<Response, Map<String, dynamic>> {
  TendermintRequestAbciQuery({required this.request, this.height, this.prove});

  final QueryMessage<Response> request;

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
        "path": '''"${request.queryPath}"''',
        "data": BytesUtils.toHexString(request.toBuffer(), prefix: "0x"),
        "height": height?.toString(),
        "prove": prove?.toString()
      };
  @override
  Response onResonse(Map<String, dynamic> result) {
    final response = ABCIResponse.fromJson(result["response"]);
    return request.onResponse(response.valueBytes());
  }
}
