import 'package:cosmos_sdk/src/provider/thornode/core/core.dart';
import 'package:cosmos_sdk/src/provider/thornode/core/thorenode.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/vault_pubkeys_info.dart';

/// Returns all pubkeys for current vaults.
class ThorNodeRequestVaultsPubkeys
    extends
        ThorNodeRequestParam<
          List<ThorVaultPubkeysInfoResponse>,
          List<Map<String, dynamic>>
        > {
  ThorNodeRequestVaultsPubkeys({this.height});

  /// optional block height, defaults to current tip
  final BigInt? height;
  @override
  String get method => ThorNodeMethods.getPubkeysVault.url;

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get parameters => {"height": height?.toString()};
  @override
  List<ThorVaultPubkeysInfoResponse> onResonse(
    List<Map<String, dynamic>> result,
  ) {
    return result.map((e) => ThorVaultPubkeysInfoResponse.fromJson(e)).toList();
  }
}
