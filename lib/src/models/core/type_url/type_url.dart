import 'package:blockchain_utils/exception/exceptions.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

abstract class TypeUrl {
  const TypeUrl();
  abstract final String typeUrl;
  abstract final String? rpc;
  String rpcUrl({List<dynamic> pathParameters = const []}) {
    if (rpc == null) {
      throw MessageException("RPC not supported", details: {"type": typeUrl});
    }
    final paths = CosmosUtils.extractParams(rpc!);
    String params = rpc!;
    for (int i = 0; i < pathParameters.length; i++) {
      params = params.replaceFirst(paths[i], pathParameters[i].toString());
    }
    return params;
  }

  @override
  String toString() {
    return "@type: $typeUrl";
  }
}
