class ThorQueueStatisticsResponse {
  final int swap;
  final int outbound;
  final int internal;
  final String scheduledOutboundValue;
  final String scheduledOutboundClout;

  const ThorQueueStatisticsResponse({
    required this.swap,
    required this.outbound,
    required this.internal,
    required this.scheduledOutboundValue,
    required this.scheduledOutboundClout,
  });

  factory ThorQueueStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return ThorQueueStatisticsResponse(
      swap: json['swap'],
      outbound: json['outbound'],
      internal: json['internal'],
      scheduledOutboundValue: json['scheduled_outbound_value'],
      scheduledOutboundClout: json['scheduled_outbound_clout'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'swap': swap,
      'outbound': outbound,
      'internal': internal,
      'scheduled_outbound_value': scheduledOutboundValue,
      'scheduled_outbound_clout': scheduledOutboundClout,
    };
  }
}
