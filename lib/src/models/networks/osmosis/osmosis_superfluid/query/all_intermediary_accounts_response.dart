import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_intermediary_account_info.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidAllIntermediaryAccountsResponse extends CosmosMessage {
  final List<OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo> accounts;
  final PageResponse? pagination;
  OsmosisSuperfluidAllIntermediaryAccountsResponse({
    required List<OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo>
    accounts,
    this.pagination,
  }) : accounts = accounts.immutable;
  factory OsmosisSuperfluidAllIntermediaryAccountsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidAllIntermediaryAccountsResponse(
      accounts:
          decode
              .getFields<List<int>>(1)
              .map(
                (e) =>
                    OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo.deserialize(
                      e,
                    ),
              )
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }
  factory OsmosisSuperfluidAllIntermediaryAccountsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisSuperfluidAllIntermediaryAccountsResponse(
      pagination: PageResponse.fromJson(json["pagination"]),
      accounts:
          (json["accounts"] as List?)
              ?.map(
                (e) =>
                    OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo.fromJson(
                      e,
                    ),
              )
              .toList() ??
          <OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccountInfo>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "accounts": accounts.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisSuperfluidTypes.allIntermediaryAccountsResponse;

  @override
  List get values => [accounts, pagination];
}
