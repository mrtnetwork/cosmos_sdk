import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'all_intermediary_accounts_response.dart';

/// Params returns the total set of superfluid parameters.
class OsmosisSuperfluidAllIntermediaryAccountsRequest extends CosmosMessage
    with QueryMessage<OsmosisSuperfluidAllIntermediaryAccountsResponse> {
  final PageRequest? pagination;
  const OsmosisSuperfluidAllIntermediaryAccountsRequest({this.pagination});
  factory OsmosisSuperfluidAllIntermediaryAccountsRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidAllIntermediaryAccountsRequest(
      pagination: decode
          .getResult(1)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.allIntermediaryAccountsRequest;

  @override
  List get values => [pagination];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};

  @override
  OsmosisSuperfluidAllIntermediaryAccountsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidAllIntermediaryAccountsResponse.fromJson(json);
  }

  @override
  OsmosisSuperfluidAllIntermediaryAccountsResponse onResponse(List<int> bytes) {
    return OsmosisSuperfluidAllIntermediaryAccountsResponse.deserialize(bytes);
  }
}
