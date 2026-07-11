import 'package:blockchain_utils/cbor/cbor.dart';
import 'package:blockchain_utils/networks/types/network.dart';
import 'package:blockchain_utils/service/service.dart';
import 'package:cosmos_sdk/sdk/provider/types/types.dart';

abstract class ChainRegistryRequest<RESULT, RESPONSE>
    extends
        BaseServiceRequest<
          RESULT,
          RESPONSE,
          ChainRegistryRequestRequestDetails
        > {
  ChainRegistryRequest();

  List<String?> get pathParameters => [];

  Map<String, String?> get parameters => {};

  @override
  ChainRegistryRequestRequestDetails buildRequest(int requestID) {
    Uri params = Uri(
      pathSegments: pathParameters.where((e) => e != null).cast(),
    );
    final queryParameters = Map<String, String>.from(
      parameters..removeWhere((key, value) => value == null),
    );
    if (queryParameters.isNotEmpty) {
      params = params.replace(queryParameters: queryParameters);
    }
    return ChainRegistryRequestRequestDetails(
      requestID: requestID,
      path: params.normalizePath().toString(),
      responseEncoding: ServiceReponseEncoding.fromType<RESPONSE>(),
    );
  }

  @override
  RequestMethod get requestMethod => RequestMethod.get;
}

class ChainRegistryRequestRequestDetails extends CosmosServiceRequestParams {
  const ChainRegistryRequestRequestDetails({
    required super.requestID,
    required super.path,
    required super.responseEncoding,
    super.headers = const {},
  }) : super(
         api: CosmosProviderApi.chainRegistery,
         bodyString: null,
         bodyBytes: null,
         requestMethod: RequestMethod.get,
       );
  factory ChainRegistryRequestRequestDetails.deserialize({
    List<int>? bytes,
    CborObject? obj,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: BlockchainNetwork.cosmosAndRelated.identifier,
      cborBytes: bytes,
      cborObject: obj,
    );
    return ChainRegistryRequestRequestDetails(
      headers: values
          .mapAt<CborStringValue, CborStringValue>(1)
          .map((k, v) => MapEntry(k.value, v.value)),
      responseEncoding: ServiceReponseEncoding.fromValue(values.rawValueAt(2)),
      path: values.rawValueAt(3),
      requestID: values.rawValueAt(4),
    );
  }
  ChainRegistryRequestRequestDetails copyWith({
    int? requestID,
    String? path,
    Map<String, String>? headers,
    ServiceReponseEncoding? responseEncoding,
  }) {
    return ChainRegistryRequestRequestDetails(
      requestID: requestID ?? this.requestID,
      headers: headers ?? this.headers,
      path: path ?? this.path,
      responseEncoding: responseEncoding ?? this.responseEncoding,
    );
  }

  @override
  Uri encodeUrl(String uri) {
    if (!uri.endsWith("/")) {
      uri = "$uri/";
    }
    return Uri.parse("$uri${path ?? ''}");
  }

  @override
  Map<String, dynamic> toJson() {
    return {'path': path};
  }

  @override
  SerializationIdentifier get serializationIdentifier =>
      BlockchainNetwork.cosmosAndRelated.identifier;

  @override
  List<CborObject?> get serializationItems => [
    api.value.toCbor(),
    CborMapValue.definite(
      headers.map((k, v) => MapEntry(CborStringValue(k), CborStringValue(v))),
    ),
    responseEncoding.value.toCbor(),
    path?.toCbor(),
    requestID.toCbor(),
  ];
}
