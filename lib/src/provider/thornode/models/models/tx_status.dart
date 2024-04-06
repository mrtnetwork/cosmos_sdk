import 'package:cosmos_sdk/src/provider/thornode/models/models/thor_coin_response.dart';
import 'package:cosmos_sdk/src/provider/thornode/models/models/tx.dart';

class PlannedOutTxResponse {
  final String chain;
  final String toAddress;
  final ThorCoinResponse coin;
  final bool refund;

  const PlannedOutTxResponse({
    required this.chain,
    required this.toAddress,
    required this.coin,
    required this.refund,
  });

  factory PlannedOutTxResponse.fromJson(Map<String, dynamic> json) {
    return PlannedOutTxResponse(
      chain: json['chain'],
      toAddress: json['to_address'],
      coin: ThorCoinResponse.fromJson(json['coin']),
      refund: json['refund'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chain': chain,
      'to_address': toAddress,
      'coin': coin.toJson(),
      'refund': refund,
    };
  }
}

class OutTx {
  final String id;
  final String chain;
  final String fromAddress;
  final String toAddress;
  final List<ThorCoinResponse> coins;
  final List<ThorCoinResponse> gas;
  final String memo;

  const OutTx({
    required this.id,
    required this.chain,
    required this.fromAddress,
    required this.toAddress,
    required this.coins,
    required this.gas,
    required this.memo,
  });

  factory OutTx.fromJson(Map<String, dynamic> json) {
    return OutTx(
      id: json['id'],
      chain: json['chain'],
      fromAddress: json['from_address'],
      toAddress: json['to_address'],
      coins: List<ThorCoinResponse>.from(
          json['coins'].map((x) => ThorCoinResponse.fromJson(x))),
      gas: List<ThorCoinResponse>.from(
          json['gas'].map((x) => ThorCoinResponse.fromJson(x))),
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

class Stages {
  final InboundObserved inboundObserved;
  final InboundConfirmationCounted inboundConfirmationCounted;
  final InboundFinalised inboundFinalised;
  final SwapStatus swapStatus;
  final OutboundDelay outboundDelay;
  final OutboundSigned outboundSigned;

  const Stages({
    required this.inboundObserved,
    required this.inboundConfirmationCounted,
    required this.inboundFinalised,
    required this.swapStatus,
    required this.outboundDelay,
    required this.outboundSigned,
  });

  factory Stages.fromJson(Map<String, dynamic> json) {
    return Stages(
      inboundObserved: InboundObserved.fromJson(json['inbound_observed']),
      inboundConfirmationCounted: InboundConfirmationCounted.fromJson(
          json['inbound_confirmation_counted']),
      inboundFinalised: InboundFinalised.fromJson(json['inbound_finalised']),
      swapStatus: SwapStatus.fromJson(json['swap_status']),
      outboundDelay: OutboundDelay.fromJson(json['outbound_delay']),
      outboundSigned: OutboundSigned.fromJson(json['outbound_signed']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inbound_observed': inboundObserved.toJson(),
      'inbound_confirmation_counted': inboundConfirmationCounted.toJson(),
      'inbound_finalised': inboundFinalised.toJson(),
      'swap_status': swapStatus.toJson(),
      'outbound_delay': outboundDelay.toJson(),
      'outbound_signed': outboundSigned.toJson(),
    };
  }
}

class InboundObserved {
  final int finalCount;
  final bool completed;

  const InboundObserved({
    required this.finalCount,
    required this.completed,
  });

  factory InboundObserved.fromJson(Map<String, dynamic> json) {
    return InboundObserved(
      finalCount: json['final_count'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'final_count': finalCount,
      'completed': completed,
    };
  }
}

class InboundConfirmationCounted {
  final bool completed;

  const InboundConfirmationCounted({
    required this.completed,
  });

  factory InboundConfirmationCounted.fromJson(Map<String, dynamic> json) {
    return InboundConfirmationCounted(
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'completed': completed,
    };
  }
}

class InboundFinalised {
  final bool completed;

  const InboundFinalised({
    required this.completed,
  });

  factory InboundFinalised.fromJson(Map<String, dynamic> json) {
    return InboundFinalised(
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'completed': completed,
    };
  }
}

class SwapStatus {
  final bool pending;

  const SwapStatus({
    required this.pending,
  });

  factory SwapStatus.fromJson(Map<String, dynamic> json) {
    return SwapStatus(
      pending: json['pending'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pending': pending,
    };
  }
}

class OutboundDelay {
  final bool completed;

  const OutboundDelay({
    required this.completed,
  });

  factory OutboundDelay.fromJson(Map<String, dynamic> json) {
    return OutboundDelay(
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'completed': completed,
    };
  }
}

class OutboundSigned {
  final bool completed;

  const OutboundSigned({
    required this.completed,
  });

  factory OutboundSigned.fromJson(Map<String, dynamic> json) {
    return OutboundSigned(
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'completed': completed,
    };
  }
}

class TxStatusResponse {
  final ThorTxDetailsResponse tx;
  final List<PlannedOutTxResponse> plannedOutTxs;
  final List<OutTx> outTxs;
  final Stages stages;

  const TxStatusResponse({
    required this.tx,
    required this.plannedOutTxs,
    required this.outTxs,
    required this.stages,
  });

  factory TxStatusResponse.fromJson(Map<String, dynamic> json) {
    return TxStatusResponse(
      tx: ThorTxDetailsResponse.fromJson(json['tx']),
      plannedOutTxs: List<PlannedOutTxResponse>.from(
          json['planned_out_txs'].map((x) => PlannedOutTxResponse.fromJson(x))),
      outTxs: List<OutTx>.from(json['out_txs'].map((x) => OutTx.fromJson(x))),
      stages: Stages.fromJson(json['stages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tx': tx.toJson(),
      'planned_out_txs': plannedOutTxs.map((x) => x.toJson()).toList(),
      'out_txs': outTxs.map((x) => x.toJson()).toList(),
      'stages': stages.toJson(),
    };
  }
}
