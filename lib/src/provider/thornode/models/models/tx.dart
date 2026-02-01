import 'package:cosmos_sdk/src/provider/thornode/models/models/thor_coin_response.dart';

class ThorObservedTx {
  final ThorTxDetailsResponse tx;
  final String observedPubKey;
  final int externalObservedHeight;
  final int externalConfirmationDelayHeight;
  final List<String> signers;
  final List<String> outHashes;
  final String status;

  const ThorObservedTx({
    required this.tx,
    required this.observedPubKey,
    required this.externalObservedHeight,
    required this.externalConfirmationDelayHeight,
    required this.signers,
    required this.outHashes,
    required this.status,
  });

  factory ThorObservedTx.fromJson(Map<String, dynamic> json) {
    return ThorObservedTx(
      tx: ThorTxDetailsResponse.fromJson(json['tx']),
      observedPubKey: json['observed_pub_key'],
      externalObservedHeight: json['external_observed_height'],
      externalConfirmationDelayHeight:
          json['external_confirmation_delay_height'],
      signers: List<String>.from(json['signers']),
      outHashes: List<String>.from(json['out_hashes']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'observed_tx': tx.toJson(),
      'observed_pub_key': observedPubKey,
      'external_observed_height': externalObservedHeight,
      'external_confirmation_delay_height': externalConfirmationDelayHeight,
      'signers': signers,
      'out_hashes': outHashes,
      'status': status,
    };
  }
}

class ThorTxDetailsResponse {
  final String id;
  final String chain;
  final String fromAddress;
  final String toAddress;
  final List<ThorCoinResponse> coins;
  final List<ThorCoinResponse> gas;
  final String memo;

  const ThorTxDetailsResponse({
    required this.id,
    required this.chain,
    required this.fromAddress,
    required this.toAddress,
    required this.coins,
    required this.gas,
    required this.memo,
  });

  factory ThorTxDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ThorTxDetailsResponse(
      id: json['id'],
      chain: json['chain'],
      fromAddress: json['from_address'],
      toAddress: json['to_address'],
      coins: List<ThorCoinResponse>.from(
        json['coins'].map((x) => ThorCoinResponse.fromJson(x)),
      ),
      gas: List<ThorCoinResponse>.from(
        json['gas'].map((x) => ThorCoinResponse.fromJson(x)),
      ),
      memo: json['memo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chain': chain,
      'from_address': fromAddress,
      'to_address': toAddress,
      'coins': coins.map((x) => x.toJson()).toList(),
      'gas': gas.map((x) => x.toJson()).toList(),
      'memo': memo,
    };
  }
}

class ThorKeysignMetric {
  final String txId;
  final dynamic nodeTssTimes;

  const ThorKeysignMetric({required this.txId, required this.nodeTssTimes});

  factory ThorKeysignMetric.fromJson(Map<String, dynamic> json) {
    return ThorKeysignMetric(
      txId: json['tx_id'],
      nodeTssTimes: json['node_tss_times'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'tx_id': txId, 'node_tss_times': nodeTssTimes};
  }
}

class ThorTxResponse {
  final ThorObservedTx observedTx;
  final int consensusHeight;
  final int finalisedHeight;
  final int outboundHeight;
  final ThorKeysignMetric keysignMetric;

  const ThorTxResponse({
    required this.observedTx,
    required this.consensusHeight,
    required this.finalisedHeight,
    required this.outboundHeight,
    required this.keysignMetric,
  });

  factory ThorTxResponse.fromJson(Map<String, dynamic> json) {
    return ThorTxResponse(
      observedTx: ThorObservedTx.fromJson(json["observed_tx"]),
      consensusHeight: json['consensus_height'],
      finalisedHeight: json['finalised_height'],
      outboundHeight: json['outbound_height'],
      keysignMetric: ThorKeysignMetric.fromJson(json['keysign_metric']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'observed_tx': observedTx.toJson(),
      'consensus_height': consensusHeight,
      'finalised_height': finalisedHeight,
      'outbound_height': outboundHeight,
      'keysign_metric': keysignMetric.toJson(),
    };
  }
}
