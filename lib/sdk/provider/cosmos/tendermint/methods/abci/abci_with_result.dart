import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/tendermint/types/tendermint.dart';
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/tendermint.dart';

/// Query the application for some information.
/// https://docs.tendermint.com/v0.34/rpc/#/ABCI/abci_query
class TendermintRequestAbciQuery<Response extends CosmosProtoMessage>
    extends TendermintRequest<Response, Map<String, dynamic>> {
  TendermintRequestAbciQuery({required this.request, this.height, this.prove});

  final ICosmosProtoQueryMessage<Response> request;

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
    "path": '''"${request.declarationId.getServiceUrl()}"''',
    "data": BytesUtils.toHexString(request.toBuffer(), prefix: "0x"),
    "height": height?.toString(),
    "prove": prove?.toString(),
  };
  @override
  Response onResponse(Map<String, dynamic> result) {
    final response = TendermintABCIQueryResponseResult.fromJson(result);
    final data = response.response.value;

    if (data == null || response.response.code != 0) {
      throw RPCError(
        errorCode: IntUtils.tryParse(response.response.code),
        message: response.response.log,
        relatedNetwork: BlockchainNetwork.cosmosAndRelated,
      );
    }
    // return ;

    return request.onQueryResponse(
      StringUtils.encode(data, encoding: StringEncoding.base64),
    );
  }
}
