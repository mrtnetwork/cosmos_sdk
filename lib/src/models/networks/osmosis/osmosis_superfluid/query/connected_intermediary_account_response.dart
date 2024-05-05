import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_intermediary_account.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisSuperfluidConnectedIntermediaryAccountResponse
    extends CosmosMessage {
  final OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount? account;
  const OsmosisSuperfluidConnectedIntermediaryAccountResponse({this.account});
  factory OsmosisSuperfluidConnectedIntermediaryAccountResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidConnectedIntermediaryAccountResponse(
        account: decode.getResult(1)?.to<
                OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount,
                List<int>>(
            (e) => OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount
                .deserialize(e)));
  }
  factory OsmosisSuperfluidConnectedIntermediaryAccountResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidConnectedIntermediaryAccountResponse(
        account: json["account"] == null
            ? null
            : OsmosisSuperfluidUnpoolSuperfluidIntermediaryAccount.fromRpc(
                json["account"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"account": account?.toJson()};
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.connectedIntermediaryAccountResponse.typeUrl;

  @override
  List get values => [account];
}
