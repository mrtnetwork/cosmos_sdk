class CCRChainOperatorInfo {
  final String? address;

  CCRChainOperatorInfo({this.address});

  factory CCRChainOperatorInfo.fromJson(Map<String, dynamic> json) {
    return CCRChainOperatorInfo(
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
    };
  }
}

class CCRChainInfo {
  final String chainName;
  final String clientId;
  final String connectionId;

  CCRChainInfo({
    required this.chainName,
    required this.clientId,
    required this.connectionId,
  });

  factory CCRChainInfo.fromJson(Map<String, dynamic> json) {
    return CCRChainInfo(
      chainName: json['chain_name'] as String,
      clientId: json['client_id'] as String,
      connectionId: json['connection_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chain_name': chainName,
      'client_id': clientId,
      'connection_id': connectionId,
    };
  }
}

class CCRChannelInfo {
  final String channelId;
  final String portId;
  final String? clientId;
  final String? connectionId;

  CCRChannelInfo({
    required this.channelId,
    required this.portId,
    this.clientId,
    this.connectionId,
  });

  factory CCRChannelInfo.fromJson(Map<String, dynamic> json) {
    return CCRChannelInfo(
      channelId: json['channel_id'] as String,
      portId: json['port_id'] as String,
      clientId: json['client_id'] as String?,
      connectionId: json['connection_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channel_id': channelId,
      'port_id': portId,
      'client_id': clientId,
      'connection_id': connectionId,
    };
  }
}

class CCRIBCData {
  final String? schema;
  final CCRChainInfo chain1;
  final CCRChainInfo chain2;
  final List<CCRChannelInfo> channels;
  final List<CCRChainOperatorInfo>? operators;

  CCRIBCData({
    this.schema,
    required this.chain1,
    required this.chain2,
    required this.channels,
    this.operators,
  });

  factory CCRIBCData.fromJson(Map<String, dynamic> json) {
    return CCRIBCData(
      schema: json['\$schema'] as String?,
      chain1: CCRChainInfo.fromJson(json['chain1'] as Map<String, dynamic>),
      chain2: CCRChainInfo.fromJson(json['chain2'] as Map<String, dynamic>),
      channels: (json['channels'] as List<dynamic>)
          .map((e) => CCRChannelInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      operators: json['operators'] != null
          ? (json['operators'] as List<dynamic>)
              .map((e) =>
                  CCRChainOperatorInfo.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '\$schema': schema,
      'chain1': chain1.toJson(),
      'chain2': chain2.toJson(),
      'channels': channels.map((e) => e.toJson()).toList(),
      'operators': operators?.map((e) => e.toJson()).toList(),
    };
  }
}
