import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/chain_contract.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/thor_coin_response.dart';

class ThorVaultInfoResponse {
  final int blockHeight;
  final String pubKey;
  final List<ThorCoinResponse> coins;
  final String type;
  final String status;
  final int statusSince;
  final List<String> membership;
  final List<String> chains;
  final int inboundTxCount;
  final int outboundTxCount;
  final List<int> pendingTxBlockHeights;
  final List<ThorChainContractResponse> routers;
  final List<ThorVaultAddressInfoResponse> addresses;
  final List<String> frozen;

  ThorVaultInfoResponse({
    required this.blockHeight,
    required this.pubKey,
    required List<ThorCoinResponse> coins,
    required this.type,
    required this.status,
    required this.statusSince,
    required List<String> membership,
    required List<String> chains,
    required this.inboundTxCount,
    required this.outboundTxCount,
    required List<int> pendingTxBlockHeights,
    required List<ThorChainContractResponse> routers,
    required List<ThorVaultAddressInfoResponse> addresses,
    required List<String> frozen,
  })  : coins = coins.mutable,
        membership = membership.mutable,
        chains = chains.mutable,
        routers = routers.mutable,
        addresses = addresses.mutable,
        frozen = frozen.mutable,
        pendingTxBlockHeights = pendingTxBlockHeights.mutable;

  factory ThorVaultInfoResponse.fromJson(Map<String, dynamic> json) {
    return ThorVaultInfoResponse(
      blockHeight: json['block_height'],
      pubKey: json['pub_key'],
      coins: (json['coins'] as List<dynamic>)
          .map((coinJson) => ThorCoinResponse.fromJson(coinJson))
          .toList(),
      type: json['type'],
      status: json['status'],
      statusSince: json['status_since'],
      membership: List<String>.from(json['membership']),
      chains: List<String>.from(json['chains']),
      inboundTxCount: json['inbound_tx_count'],
      outboundTxCount: json['outbound_tx_count'],
      pendingTxBlockHeights: List<int>.from(json['pending_tx_block_heights']),
      routers: (json['routers'] as List<dynamic>)
          .map((routerJson) => ThorChainContractResponse.fromJson(routerJson))
          .toList(),
      addresses: (json['addresses'] as List<dynamic>)
          .map((addressJson) =>
              ThorVaultAddressInfoResponse.fromJson(addressJson))
          .toList(),
      frozen: List<String>.from(json['frozen']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'block_height': blockHeight,
      'pub_key': pubKey,
      'coins': coins.map((coin) => coin.toJson()).toList(),
      'type': type,
      'status': status,
      'status_since': statusSince,
      'membership': membership,
      'chains': chains,
      'inbound_tx_count': inboundTxCount,
      'outbound_tx_count': outboundTxCount,
      'pending_tx_block_heights': pendingTxBlockHeights,
      'routers': routers.map((router) => router.toJson()).toList(),
      'addresses': addresses.map((address) => address.toJson()).toList(),
      'frozen': frozen,
    };
  }
}

class ThorVaultAddressInfoResponse {
  final String chain;
  final String address;

  const ThorVaultAddressInfoResponse({
    required this.chain,
    required this.address,
  });

  factory ThorVaultAddressInfoResponse.fromJson(Map<String, dynamic> json) {
    return ThorVaultAddressInfoResponse(
      chain: json['chain'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chain': chain,
      'address': address,
    };
  }
}
