import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisSuperfluidV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisSuperfluidV1beta1Types._(this.typeUrl);
  static const OsmosisSuperfluidV1beta1Types removeSuperfluidAssetsProposal =
      OsmosisSuperfluidV1beta1Types._(
          "/osmosis.superfluid.v1beta1.RemoveSuperfluidAssetsProposal");

  static const OsmosisSuperfluidV1beta1Types setSuperfluidAssetsProposal =
      OsmosisSuperfluidV1beta1Types._(
          "/osmosis.superfluid.v1beta1.SetSuperfluidAssetsProposal");
}
