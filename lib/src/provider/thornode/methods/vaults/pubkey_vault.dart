import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/vault_info.dart';

/// Returns the vault for the provided pubkey.
class ThorNodeRequestPubkeyVault
    extends ThorNodeRequestParam<ThorVaultInfoResponse, Map<String, dynamic>> {
  ThorNodeRequestPubkeyVault({this.height, required this.pubkey});

  /// optional block height, defaults to current tip
  final BigInt? height;
  final String pubkey;
  @override
  String get method => ThorNodeMethods.getPubkeyVault.url;

  @override
  List<String> get pathParameters => [pubkey];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
  @override
  ThorVaultInfoResponse onResonse(Map<String, dynamic> result) {
    return ThorVaultInfoResponse.fromJson(result);
  }
}
