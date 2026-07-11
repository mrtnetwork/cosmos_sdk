import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/tendermint/v1beta1/src/query.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/src/service.dart';
import 'package:test/test.dart';

void main() {
  test('encodable provider params', () {
    final param = TendermintRequestAbciQuery(
      request: TxDecodeAminoRequest(aminoBinary: [1, 2, 3]),
    );
    final request = param.buildRequest(0);
    final decode = BaseCosmosServiceRequestParams.deserialize(
      bytes: request.toCbor().encode(),
    );
    final serviceRequest = decode as CosmosServiceRequestParams;
    expect(serviceRequest.requestMethod, RequestMethod.get);
    expect(serviceRequest.path, request.path);
    expect(serviceRequest.encodeBody(), request.encodeBody());
    expect(serviceRequest.successStatusCodes, request.successStatusCodes);
    expect(serviceRequest.errorStatusCodes, request.errorStatusCodes);
    expect(serviceRequest.network, BlockchainNetwork.cosmosAndRelated);
    expect(serviceRequest.responseEncoding, request.responseEncoding);
    expect(serviceRequest.api, CosmosProviderApi.tendermint);
  });

  test('encodable provider params', () {
    final param = ChainRegistryRequestCosmosDirectoryChain(chainName: 'cosmos');
    final request = param.buildRequest(0);
    final decode = BaseCosmosServiceRequestParams.deserialize(
      bytes: request.toCbor().encode(),
    );
    final serviceRequest = decode as CosmosServiceRequestParams;
    expect(serviceRequest.path, request.path);
    expect(serviceRequest.encodeBody(), request.encodeBody());
    expect(serviceRequest.successStatusCodes, request.successStatusCodes);
    expect(serviceRequest.errorStatusCodes, request.errorStatusCodes);
    expect(serviceRequest.network, BlockchainNetwork.cosmosAndRelated);
    expect(serviceRequest.responseEncoding, request.responseEncoding);
    expect(serviceRequest.requestMethod, request.requestMethod);
    expect(serviceRequest.api, CosmosProviderApi.chainRegistery);
  });
  test('encodable provider params', () {
    final param = TendermintRequestBroadcastTxAsync('tx');
    final request = param.buildRequest(0);
    final decode = BaseCosmosServiceRequestParams.deserialize(
      bytes: request.toCbor().encode(),
    );
    final serviceRequest = decode as CosmosServiceRequestParams;
    expect(serviceRequest.path, request.path);
    expect(serviceRequest.encodeBody(), request.encodeBody());
    expect(serviceRequest.successStatusCodes, request.successStatusCodes);
    expect(serviceRequest.errorStatusCodes, request.errorStatusCodes);
    expect(serviceRequest.network, BlockchainNetwork.cosmosAndRelated);
    expect(serviceRequest.responseEncoding, request.responseEncoding);
    expect(serviceRequest.requestMethod, request.requestMethod);
    expect(serviceRequest.api, CosmosProviderApi.tendermint);
  });
  test('encodable provider params', () {
    final param = CosmosRestRequestMessage(
      request: const GetLatestBlockRequest(),
    );
    final request = param.buildRequest(0);
    final decode = BaseCosmosServiceRequestParams.deserialize(
      bytes: request.toCbor().encode(),
    );
    final serviceRequest = decode as CosmosServiceRequestParams;
    expect(serviceRequest.path, request.path);
    expect(serviceRequest.encodeBody(), request.encodeBody());
    expect(serviceRequest.successStatusCodes, request.successStatusCodes);
    expect(serviceRequest.errorStatusCodes, request.errorStatusCodes);
    expect(serviceRequest.network, BlockchainNetwork.cosmosAndRelated);
    expect(serviceRequest.responseEncoding, request.responseEncoding);
    expect(serviceRequest.requestMethod, request.requestMethod);
    expect(serviceRequest.api, CosmosProviderApi.rest);
  });
  test('encodable provider params', () {
    final param = CosmosGrpcRequestMessage(
      request: const GetLatestBlockRequest(),
    );
    final request = param.buildRequest(0);
    final decode = BaseCosmosServiceRequestParams.deserialize(
      bytes: request.toCbor().encode(),
    );
    final serviceRequest = decode as CosmosGrpcRequestDetails;
    expect(serviceRequest.api, CosmosProviderApi.grpc);
  });
  test('encodable provider params', () {
    final param = ThorNodeRequestAddressCloutScore(
      height: BigInt.one,
      address: "address",
    );
    final request = param.buildRequest(0);
    final decode = BaseCosmosServiceRequestParams.deserialize(
      bytes: request.toCbor().encode(),
    );
    final serviceRequest = decode as CosmosServiceRequestParams;
    expect(serviceRequest.path != null, true);
    expect(serviceRequest.path, request.path);
    expect(serviceRequest.encodeBody(), request.encodeBody());
    expect(serviceRequest.successStatusCodes, request.successStatusCodes);
    expect(serviceRequest.errorStatusCodes, request.errorStatusCodes);
    expect(serviceRequest.network, BlockchainNetwork.cosmosAndRelated);
    expect(serviceRequest.responseEncoding, request.responseEncoding);
    expect(serviceRequest.requestMethod, request.requestMethod);
    expect(serviceRequest.api, CosmosProviderApi.thorNode);
  });
}
