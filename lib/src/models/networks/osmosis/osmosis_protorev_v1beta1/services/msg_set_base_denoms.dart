import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/base_denom.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// SetBaseDenoms sets the base denoms that will be used to create cyclic arbitrage routes.
/// Can only be called by the admin account.
class OsmosisProtorevMsgSetBaseDenoms
    extends OsmosisProtorevV1Beta1<EmptyServiceRequestResponse> {
  /// [admin] is the account that is authorized to set the base denoms.
  final String? admin;

  /// [baseDenoms] is the list of base denoms to set.
  final List<OsmosisProtorevBaseDenom> baseDenoms;

  OsmosisProtorevMsgSetBaseDenoms(
      {this.admin, required List<OsmosisProtorevBaseDenom> baseDenoms})
      : baseDenoms = baseDenoms.immutable;
  factory OsmosisProtorevMsgSetBaseDenoms.fromJson(Map<String, dynamic> json) {
    return OsmosisProtorevMsgSetBaseDenoms(
        admin: json.as("admin"),
        baseDenoms: json
                .asListOfMap("base_denoms")
                ?.map((e) => OsmosisProtorevBaseDenom.fromJson(e))
                .toList() ??
            []);
  }

  factory OsmosisProtorevMsgSetBaseDenoms.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevMsgSetBaseDenoms(
        admin: decode.getField(1),
        baseDenoms: decode
            .getFields<List<int>>(2)
            .map((e) => OsmosisProtorevBaseDenom.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "admin": admin,
      "base_denoms": baseDenoms.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.msgSetBaseDenoms;

  @override
  List get values => [admin, baseDenoms];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisProtorevV1beta1Types.msgSetBaseDenomsResponse);
  }

  @override
  List<String?> get signers => [admin];
}
