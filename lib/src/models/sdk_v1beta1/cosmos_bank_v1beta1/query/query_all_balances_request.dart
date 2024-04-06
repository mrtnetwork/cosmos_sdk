import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'query_all_balances_response.dart';

/// AllBalances queries the balance of all coins for a single account.
/// When called from another module, this query might consume a high amount of gas if the pagination field is incorrectly set.
class QueryAllBalancesRequest extends CosmosMessage
    with
        QueryMessage<QueryAllBalancesResponse>,
        RPCMessage<QueryAllBalancesResponse> {
  /// address is the address to query balances for.
  final BaseAddress address;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;

  /// resolve_denom is the flag to resolve the denom into a human-readable form from the metadata.
  ///
  /// Since: cosmos-sdk 0.50
  final bool? resolveDenom;
  const QueryAllBalancesRequest(
      {required this.address, this.pagination, this.resolveDenom});

  factory QueryAllBalancesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllBalancesRequest(
        address: BaseAddress(decode.getField(1)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
        resolveDenom: decode.getResult(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get queryPath => BankV1beta1Types.allBalances.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address.address,
      "pagination": pagination?.toJson(),
      "resolve_denom": resolveDenom
    };
  }

  @override
  String get typeUrl => BankV1beta1Types.allBalancesRequest.typeUrl;

  @override
  List get values => [address.address, pagination, resolveDenom];

  @override
  QueryAllBalancesResponse onResponse(List<int> bytes) {
    return QueryAllBalancesResponse.deserialize(bytes);
  }

  @override
  QueryAllBalancesResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAllBalancesResponse.fromRpc(json);
  }

  @override
  String get rpcPath =>
      BankV1beta1Types.allBalances.rpcUrl(pathParameters: [address.address]);

  @override
  Map<String, String> get queryParameters => {};
}
