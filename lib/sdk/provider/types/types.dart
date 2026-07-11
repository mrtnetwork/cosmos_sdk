import 'package:blockchain_utils/cbor/cbor.dart';
import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:blockchain_utils/networks/types/network.dart';
import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/sdk/provider/chain_registery/chain_regisery.dart';
import 'package:cosmos_sdk/sdk/provider/cosmos/core/core.dart';
import 'package:cosmos_sdk/sdk/provider/thornode/thornode.dart';

enum CosmosProviderApi {
  chainRegistery(0),
  tendermint(1),
  thorNode(2),
  rest(3),
  grpc(4);

  final int value;
  const CosmosProviderApi(this.value);
  bool get isCosmosApi =>
      this == tendermint || this == rest || tendermint == grpc;

  static List<CosmosProviderApi> get cosmosApis =>
      values.where((e) => e.isCosmosApi).toList();
  static CosmosProviderApi fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "CosmosProviderApi"),
    );
  }

  static CosmosProviderApi fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw ItemNotFoundException(name: "CosmosProviderApi"),
    );
  }
}

abstract class BaseCosmosServiceRequestParams implements IServiceRequestParams {
  final CosmosProviderApi api;
  const BaseCosmosServiceRequestParams(this.api);
  factory BaseCosmosServiceRequestParams.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final CborTagValue tag = CborTagSerializable.decode(
      cborBytes: bytes,
      cborObject: obj,
    );
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: BlockchainNetwork.cosmosAndRelated.identifier,
      cborObject: tag,
    );
    final type = CosmosProviderApi.fromValue(values.rawValueAt(0));
    return switch (type) {
      CosmosProviderApi.chainRegistery =>
        ChainRegistryRequestRequestDetails.deserialize(obj: tag),
      CosmosProviderApi.rest => CosmosRestRequestDetails.deserialize(obj: tag),
      CosmosProviderApi.tendermint => TendermintRequestDetails.deserialize(
        obj: tag,
      ),
      CosmosProviderApi.thorNode => ThorNodeRequestDetails.deserialize(
        obj: tag,
      ),
      CosmosProviderApi.grpc => CosmosGrpcRequestDetails.deserialize(obj: tag),
    };
  }
}

abstract class CosmosServiceRequestParams extends BaseServiceRequestParams
    implements BaseCosmosServiceRequestParams {
  @override
  final CosmosProviderApi api;
  const CosmosServiceRequestParams({
    required super.headers,
    required super.requestMethod,
    required super.requestID,
    required super.responseEncoding,
    required super.bodyBytes,
    required super.bodyString,
    required this.api,
    super.errorStatusCodes,
    super.path,
    super.successStatusCodes,
  }) : super(network: BlockchainNetwork.cosmosAndRelated);

  @override
  List<int>? encodeBody({ServiceProtocol protocol = ServiceProtocol.http}) {
    assert(protocol.isHttp, "Unsupported protocol.");
    return super.encodeBody(protocol: protocol);
  }
}
