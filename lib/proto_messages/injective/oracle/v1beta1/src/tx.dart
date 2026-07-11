import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;

/// MsgRelayProviderPrice defines a SDK message for setting a price through the
/// provider oracle.
class MsgRelayProviderPrices extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRelayProviderPricesResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? provider;

  final List<String> symbols;

  final List<String> prices;

  const MsgRelayProviderPrices({
    this.sender,
    this.provider,
    this.symbols = const [],
    this.prices = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "oracle/MsgRelayProviderPrices",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, provider, symbols, prices];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'provider': provider,
      'symbols': symbols.map((e) => e).toList(),
      'prices': prices.map((e) => e).toList(),
    };
  }

  factory MsgRelayProviderPrices.fromJson(Map<String, dynamic> json) {
    return MsgRelayProviderPrices(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      provider: json.valueAsString<String?>('provider', acceptCamelCase: true),
      symbols:
          (json.valueEnsureAsList<dynamic>(
            'symbols',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      prices:
          (json.valueEnsureAsList<dynamic>(
            'prices',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgRelayProviderPrices.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelayProviderPrices(
      sender: decode.getString<String?>(1),
      provider: decode.getString<String?>(2),
      symbols: decode.getListOrEmpty<String>(3),
      prices: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgRelayProviderPrices;
  @override
  MsgRelayProviderPricesResponse onServiceResponse(List<int> bytes) {
    return MsgRelayProviderPricesResponse.deserialize(bytes);
  }

  @override
  MsgRelayProviderPricesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRelayProviderPricesResponse.fromJson(json);
  }
}

class MsgRelayProviderPricesResponse extends CosmosProtoMessage {
  const MsgRelayProviderPricesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRelayProviderPricesResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelayProviderPricesResponse();
  }

  factory MsgRelayProviderPricesResponse.deserialize(List<int> bytes) {
    return MsgRelayProviderPricesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1MsgRelayProviderPricesResponse;
}

/// MsgRelayPriceFeedPrice defines a SDK message for setting a price through the
/// pricefeed oracle.
class MsgRelayPriceFeedPrice extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRelayPriceFeedPriceResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<String> base;

  final List<String> quote;

  /// price defines the price of the oracle base and quote
  final List<String> price;

  const MsgRelayPriceFeedPrice({
    this.sender,
    this.base = const [],
    this.quote = const [],
    this.price = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "oracle/MsgRelayPriceFeedPrice",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, base, quote, price];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'base': base.map((e) => e).toList(),
      'quote': quote.map((e) => e).toList(),
      'price': price.map((e) => e).toList(),
    };
  }

  factory MsgRelayPriceFeedPrice.fromJson(Map<String, dynamic> json) {
    return MsgRelayPriceFeedPrice(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      base:
          (json.valueEnsureAsList<dynamic>(
            'base',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      quote:
          (json.valueEnsureAsList<dynamic>(
            'quote',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      price:
          (json.valueEnsureAsList<dynamic>(
            'price',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgRelayPriceFeedPrice.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelayPriceFeedPrice(
      sender: decode.getString<String?>(1),
      base: decode.getListOrEmpty<String>(2),
      quote: decode.getListOrEmpty<String>(3),
      price: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgRelayPriceFeedPrice;
  @override
  MsgRelayPriceFeedPriceResponse onServiceResponse(List<int> bytes) {
    return MsgRelayPriceFeedPriceResponse.deserialize(bytes);
  }

  @override
  MsgRelayPriceFeedPriceResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRelayPriceFeedPriceResponse.fromJson(json);
  }
}

class MsgRelayPriceFeedPriceResponse extends CosmosProtoMessage {
  const MsgRelayPriceFeedPriceResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRelayPriceFeedPriceResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelayPriceFeedPriceResponse();
  }

  factory MsgRelayPriceFeedPriceResponse.deserialize(List<int> bytes) {
    return MsgRelayPriceFeedPriceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1MsgRelayPriceFeedPriceResponse;
}

/// MsgRelayCoinbaseMessages defines a SDK message for relaying price messages
/// from Coinbase API.
class MsgRelayCoinbaseMessages extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRelayCoinbaseMessagesResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<List<int>> messages;

  final List<List<int>> signatures;

  const MsgRelayCoinbaseMessages({
    this.sender,
    this.messages = const [],
    this.signatures = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "oracle/MsgRelayCoinbaseMessages",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, messages, signatures];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'messages':
          messages
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'signatures':
          signatures
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MsgRelayCoinbaseMessages.fromJson(Map<String, dynamic> json) {
    return MsgRelayCoinbaseMessages(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      messages:
          (json.valueEnsureAsList<dynamic>('messages', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      signatures:
          (json.valueEnsureAsList<dynamic>('signatures', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MsgRelayCoinbaseMessages.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelayCoinbaseMessages(
      sender: decode.getString<String?>(1),
      messages: decode.getListOfBytes(2),
      signatures: decode.getListOfBytes(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgRelayCoinbaseMessages;
  @override
  MsgRelayCoinbaseMessagesResponse onServiceResponse(List<int> bytes) {
    return MsgRelayCoinbaseMessagesResponse.deserialize(bytes);
  }

  @override
  MsgRelayCoinbaseMessagesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRelayCoinbaseMessagesResponse.fromJson(json);
  }
}

class MsgRelayCoinbaseMessagesResponse extends CosmosProtoMessage {
  const MsgRelayCoinbaseMessagesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRelayCoinbaseMessagesResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelayCoinbaseMessagesResponse();
  }

  factory MsgRelayCoinbaseMessagesResponse.deserialize(List<int> bytes) {
    return MsgRelayCoinbaseMessagesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1MsgRelayCoinbaseMessagesResponse;
}

/// MsgRelayStorkPrices defines a SDK message for relaying price message
/// from Stork API.
class MsgRelayStorkPrices extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgRelayStorkPricesResponse> {
  final String? sender;

  final List<injective_oracle_v1beta1_oracle.AssetPair> assetPairs;

  const MsgRelayStorkPrices({this.sender, this.assetPairs = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, assetPairs];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'asset_pairs': assetPairs.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgRelayStorkPrices.fromJson(Map<String, dynamic> json) {
    return MsgRelayStorkPrices(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      assetPairs:
          (json.valueEnsureAsList<dynamic>(
                'asset_pairs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.AssetPair,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_oracle_v1beta1_oracle.AssetPair.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgRelayStorkPrices.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelayStorkPrices(
      sender: decode.getString<String?>(1),
      assetPairs:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_oracle_v1beta1_oracle.AssetPair.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgRelayStorkPrices;
  @override
  MsgRelayStorkPricesResponse onServiceResponse(List<int> bytes) {
    return MsgRelayStorkPricesResponse.deserialize(bytes);
  }

  @override
  MsgRelayStorkPricesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRelayStorkPricesResponse.fromJson(json);
  }
}

class MsgRelayStorkPricesResponse extends CosmosProtoMessage {
  const MsgRelayStorkPricesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRelayStorkPricesResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelayStorkPricesResponse();
  }

  factory MsgRelayStorkPricesResponse.deserialize(List<int> bytes) {
    return MsgRelayStorkPricesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1MsgRelayStorkPricesResponse;
}

/// MsgRelayPythPrices defines a SDK message for updating Pyth prices
class MsgRelayPythPrices extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRelayPythPricesResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<injective_oracle_v1beta1_oracle.PriceAttestation>
  priceAttestations;

  const MsgRelayPythPrices({this.sender, this.priceAttestations = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "oracle/MsgRelayPythPrices",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, priceAttestations];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'price_attestations': priceAttestations.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgRelayPythPrices.fromJson(Map<String, dynamic> json) {
    return MsgRelayPythPrices(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      priceAttestations:
          (json.valueEnsureAsList<dynamic>(
                'price_attestations',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PriceAttestation,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PriceAttestation.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgRelayPythPrices.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelayPythPrices(
      sender: decode.getString<String?>(1),
      priceAttestations:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .PriceAttestation.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgRelayPythPrices;
  @override
  MsgRelayPythPricesResponse onServiceResponse(List<int> bytes) {
    return MsgRelayPythPricesResponse.deserialize(bytes);
  }

  @override
  MsgRelayPythPricesResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRelayPythPricesResponse.fromJson(json);
  }
}

/// MsgRelayPythPricesResponse defines the Msg/RelayPythPrices response type.
class MsgRelayPythPricesResponse extends CosmosProtoMessage {
  const MsgRelayPythPricesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRelayPythPricesResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelayPythPricesResponse();
  }

  factory MsgRelayPythPricesResponse.deserialize(List<int> bytes) {
    return MsgRelayPythPricesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1MsgRelayPythPricesResponse;
}

/// MsgRelayChainlinkPrices defines a SDK message for updating Chainlink Data
/// Streams prices
class MsgRelayChainlinkPrices extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRelayChainlinkPricesResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final List<injective_oracle_v1beta1_oracle.ChainlinkReport> reports;

  const MsgRelayChainlinkPrices({this.sender, this.reports = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "oracle/MsgRelayChainlinkPrices",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, reports];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'reports': reports.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgRelayChainlinkPrices.fromJson(Map<String, dynamic> json) {
    return MsgRelayChainlinkPrices(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      reports:
          (json.valueEnsureAsList<dynamic>('reports', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.ChainlinkReport,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .ChainlinkReport.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory MsgRelayChainlinkPrices.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelayChainlinkPrices(
      sender: decode.getString<String?>(1),
      reports:
          decode
              .getListOfBytes(2)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .ChainlinkReport.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgRelayChainlinkPrices;
  @override
  MsgRelayChainlinkPricesResponse onServiceResponse(List<int> bytes) {
    return MsgRelayChainlinkPricesResponse.deserialize(bytes);
  }

  @override
  MsgRelayChainlinkPricesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRelayChainlinkPricesResponse.fromJson(json);
  }
}

/// MsgRelayChainlinkPricesResponse defines the Msg/RelayChainlinkPrices response
/// type.
class MsgRelayChainlinkPricesResponse extends CosmosProtoMessage {
  const MsgRelayChainlinkPricesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRelayChainlinkPricesResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelayChainlinkPricesResponse();
  }

  factory MsgRelayChainlinkPricesResponse.deserialize(List<int> bytes) {
    return MsgRelayChainlinkPricesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1MsgRelayChainlinkPricesResponse;
}

/// MsgRelayPythProPrices defines a SDK message for relaying Pyth Pro (Lazer)
/// price update blobs. Each update is an opaque bytes blob received from the
/// Pyth Lazer WebSocket and verified on-chain via the PythLazer EVM contract.
class MsgRelayPythProPrices extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRelayPythProPricesResponse>,
        ICosmosProtoAminoMessage {
  /// sender is the relayer address broadcasting the update. Any address may
  /// relay; security is enforced by the PythLazer EVM contract.
  final String? sender;

  /// updates contains one or more Pyth Lazer update blobs; each blob is passed
  /// to a single verifyUpdate EVM call.
  final List<List<int>> updates;

  const MsgRelayPythProPrices({this.sender, this.updates = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "oracle/MsgRelayPythProPrices",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, updates];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'updates':
          updates
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MsgRelayPythProPrices.fromJson(Map<String, dynamic> json) {
    return MsgRelayPythProPrices(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      updates:
          (json.valueEnsureAsList<dynamic>('updates', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MsgRelayPythProPrices.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelayPythProPrices(
      sender: decode.getString<String?>(1),
      updates: decode.getListOfBytes(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgRelayPythProPrices;
  @override
  MsgRelayPythProPricesResponse onServiceResponse(List<int> bytes) {
    return MsgRelayPythProPricesResponse.deserialize(bytes);
  }

  @override
  MsgRelayPythProPricesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRelayPythProPricesResponse.fromJson(json);
  }
}

/// MsgRelayPythProPricesResponse defines the Msg/RelayPythProPrices response
/// type.
class MsgRelayPythProPricesResponse extends CosmosProtoMessage {
  const MsgRelayPythProPricesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRelayPythProPricesResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelayPythProPricesResponse();
  }

  factory MsgRelayPythProPricesResponse.deserialize(List<int> bytes) {
    return MsgRelayPythProPricesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1MsgRelayPythProPricesResponse;
}

/// MsgRelaySedaFastPrices defines a SDK message for relaying SEDA Fast price
/// update envelopes. Each update is the raw UTF-8 JSON of the top-level
/// "result" field of a feed.result / feed.execute WebSocket message (or a
/// POST /execute REST response). The chain parses the JSON, verifies the
/// secp256k1 signature, and decodes the price on-chain.
/// Individual entry size is capped at 8 KiB; at most 64 entries per Msg.
class MsgRelaySedaFastPrices extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRelaySedaFastPricesResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  /// updates contains one or more SEDA Fast result JSON envelopes.
  final List<List<int>> updates;

  const MsgRelaySedaFastPrices({this.sender, this.updates = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "oracle/MsgRelaySedaFastPrices",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, updates];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'updates':
          updates
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory MsgRelaySedaFastPrices.fromJson(Map<String, dynamic> json) {
    return MsgRelaySedaFastPrices(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      updates:
          (json.valueEnsureAsList<dynamic>('updates', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
    );
  }

  factory MsgRelaySedaFastPrices.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRelaySedaFastPrices(
      sender: decode.getString<String?>(1),
      updates: decode.getListOfBytes(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgRelaySedaFastPrices;
  @override
  MsgRelaySedaFastPricesResponse onServiceResponse(List<int> bytes) {
    return MsgRelaySedaFastPricesResponse.deserialize(bytes);
  }

  @override
  MsgRelaySedaFastPricesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRelaySedaFastPricesResponse.fromJson(json);
  }
}

/// MsgRelaySedaFastPricesResponse defines the Msg/RelaySedaFastPrices response
/// type.
class MsgRelaySedaFastPricesResponse extends CosmosProtoMessage {
  const MsgRelaySedaFastPricesResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRelaySedaFastPricesResponse.fromJson(Map<String, dynamic> json) {
    return MsgRelaySedaFastPricesResponse();
  }

  factory MsgRelaySedaFastPricesResponse.deserialize(List<int> bytes) {
    return MsgRelaySedaFastPricesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectiveOracleV1beta1MsgRelaySedaFastPricesResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the oracle parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_oracle_v1beta1_oracle.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "oracle/MsgUpdateParams"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<
        injective_oracle_v1beta1_oracle.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_oracle_v1beta1_oracle.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_oracle_v1beta1_oracle.Params?>(
        2,
        (b) => injective_oracle_v1beta1_oracle.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1MsgUpdateParamsResponse;
}
