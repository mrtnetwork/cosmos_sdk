import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Params defines the set of on-chain interchain accounts parameters.
/// The following parameters may be used to disable the host submodule.
class InterchainAccountsHostParams extends CosmosMessage {
  /// host_enabled enables or disables the host submodule.
  final bool? hostEnabled;

  /// allow_messages defines a list of sdk message typeURLs allowed to be executed on a host chain
  final List<String>? allowMessages;
  InterchainAccountsHostParams({this.hostEnabled, List<String>? allowMessages})
      : allowMessages = allowMessages?.nullOnEmpy;
  factory InterchainAccountsHostParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountsHostParams(
        hostEnabled: decode.getField(1),
        allowMessages: decode.getFileds<String>(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"host_enabled": hostEnabled, "allow_messages": allowMessages};
  }

  @override
  String get typeUrl => IbcTypes.interchainAccountsHostParams.typeUrl;

  @override
  List get values => [hostEnabled, allowMessages];
}
