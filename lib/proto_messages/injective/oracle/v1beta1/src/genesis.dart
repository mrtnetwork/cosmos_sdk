import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/oracle/v1beta1/src/oracle.dart"
    as injective_oracle_v1beta1_oracle;

/// GenesisState defines the oracle module's genesis state.
class GenesisState extends CosmosProtoMessage {
  /// params defines all the parameters of related to oracle.
  final injective_oracle_v1beta1_oracle.Params? params;

  final List<String> bandRelayers;

  final List<injective_oracle_v1beta1_oracle.BandPriceState> bandPriceStates;

  final List<injective_oracle_v1beta1_oracle.PriceFeedState>
  priceFeedPriceStates;

  final List<injective_oracle_v1beta1_oracle.CoinbasePriceState>
  coinbasePriceStates;

  final List<injective_oracle_v1beta1_oracle.BandPriceState> bandIbcPriceStates;

  final List<injective_oracle_v1beta1_oracle.BandOracleRequest>
  bandIbcOracleRequests;

  final injective_oracle_v1beta1_oracle.BandIBCParams? bandIbcParams;

  final BigInt? bandIbcLatestClientId;

  final List<CalldataRecord> calldataRecords;

  final BigInt? bandIbcLatestRequestId;

  final List<injective_oracle_v1beta1_oracle.ChainlinkPriceState>
  chainlinkPriceStates;

  final List<injective_oracle_v1beta1_oracle.PriceRecords>
  historicalPriceRecords;

  final List<injective_oracle_v1beta1_oracle.ProviderState> providerStates;

  final List<injective_oracle_v1beta1_oracle.PythPriceState> pythPriceStates;

  final List<injective_oracle_v1beta1_oracle.StorkPriceState> storkPriceStates;

  final List<String> storkPublishers;

  final List<injective_oracle_v1beta1_oracle.ChainlinkDataStreamsPriceState>
  chainlinkDataStreamsPriceStates;

  /// pyth_pro_price_states defines the persisted PythPro feed price states at
  /// genesis.
  final List<injective_oracle_v1beta1_oracle.PythProPriceState>
  pythProPriceStates;

  /// seda_fast_price_states defines the persisted SEDA Fast feed price states
  /// at genesis, keyed by feed_id (hex-encoded execInputs).
  final List<injective_oracle_v1beta1_oracle.SedaFastPriceState>
  sedaFastPriceStates;

  const GenesisState({
    this.params,
    this.bandRelayers = const [],
    this.bandPriceStates = const [],
    this.priceFeedPriceStates = const [],
    this.coinbasePriceStates = const [],
    this.bandIbcPriceStates = const [],
    this.bandIbcOracleRequests = const [],
    this.bandIbcParams,
    this.bandIbcLatestClientId,
    this.calldataRecords = const [],
    this.bandIbcLatestRequestId,
    this.chainlinkPriceStates = const [],
    this.historicalPriceRecords = const [],
    this.providerStates = const [],
    this.pythPriceStates = const [],
    this.storkPriceStates = const [],
    this.storkPublishers = const [],
    this.chainlinkDataStreamsPriceStates = const [],
    this.pythProPriceStates = const [],
    this.sedaFastPriceStates = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(
          8,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(
          9,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(
          11,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 13,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 14,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 15,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 16,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 17,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 18,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 19,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 20,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    params,
    bandRelayers,
    bandPriceStates,
    priceFeedPriceStates,
    coinbasePriceStates,
    bandIbcPriceStates,
    bandIbcOracleRequests,
    bandIbcParams,
    bandIbcLatestClientId,
    calldataRecords,
    bandIbcLatestRequestId,
    chainlinkPriceStates,
    historicalPriceRecords,
    providerStates,
    pythPriceStates,
    storkPriceStates,
    storkPublishers,
    chainlinkDataStreamsPriceStates,
    pythProPriceStates,
    sedaFastPriceStates,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'params': params?.toJson(),
      'band_relayers': bandRelayers.map((e) => e).toList(),
      'band_price_states': bandPriceStates.map((e) => e.toJson()).toList(),
      'price_feed_price_states':
          priceFeedPriceStates.map((e) => e.toJson()).toList(),
      'coinbase_price_states':
          coinbasePriceStates.map((e) => e.toJson()).toList(),
      'band_ibc_price_states':
          bandIbcPriceStates.map((e) => e.toJson()).toList(),
      'band_ibc_oracle_requests':
          bandIbcOracleRequests.map((e) => e.toJson()).toList(),
      'band_ibc_params': bandIbcParams?.toJson(),
      'band_ibc_latest_client_id': bandIbcLatestClientId?.toString(),
      'calldata_records': calldataRecords.map((e) => e.toJson()).toList(),
      'band_ibc_latest_request_id': bandIbcLatestRequestId?.toString(),
      'chainlink_price_states':
          chainlinkPriceStates.map((e) => e.toJson()).toList(),
      'historical_price_records':
          historicalPriceRecords.map((e) => e.toJson()).toList(),
      'provider_states': providerStates.map((e) => e.toJson()).toList(),
      'pyth_price_states': pythPriceStates.map((e) => e.toJson()).toList(),
      'stork_price_states': storkPriceStates.map((e) => e.toJson()).toList(),
      'stork_publishers': storkPublishers.map((e) => e).toList(),
      'chainlink_data_streams_price_states':
          chainlinkDataStreamsPriceStates.map((e) => e.toJson()).toList(),
      'pyth_pro_price_states':
          pythProPriceStates.map((e) => e.toJson()).toList(),
      'seda_fast_price_states':
          sedaFastPriceStates.map((e) => e.toJson()).toList(),
    };
  }

  factory GenesisState.fromJson(Map<String, dynamic> json) {
    return GenesisState(
      params: json.valueTo<
        injective_oracle_v1beta1_oracle.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_oracle_v1beta1_oracle.Params.fromJson(v),
        acceptCamelCase: true,
      ),
      bandRelayers:
          (json.valueEnsureAsList<dynamic>(
            'band_relayers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      bandPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'band_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.BandPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .BandPriceState.fromJson(v),
                ),
              )
              .toList(),
      priceFeedPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'price_feed_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PriceFeedState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PriceFeedState.fromJson(v),
                ),
              )
              .toList(),
      coinbasePriceStates:
          (json.valueEnsureAsList<dynamic>(
                'coinbase_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.CoinbasePriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .CoinbasePriceState.fromJson(v),
                ),
              )
              .toList(),
      bandIbcPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'band_ibc_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.BandPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .BandPriceState.fromJson(v),
                ),
              )
              .toList(),
      bandIbcOracleRequests:
          (json.valueEnsureAsList<dynamic>(
                'band_ibc_oracle_requests',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.BandOracleRequest,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .BandOracleRequest.fromJson(v),
                ),
              )
              .toList(),
      bandIbcParams: json.valueTo<
        injective_oracle_v1beta1_oracle.BandIBCParams?,
        Map<String, dynamic>
      >(
        key: 'band_ibc_params',
        parse: (v) => injective_oracle_v1beta1_oracle.BandIBCParams.fromJson(v),
        acceptCamelCase: true,
      ),
      bandIbcLatestClientId: json.valueAsBigInt<BigInt?>(
        'band_ibc_latest_client_id',
        acceptCamelCase: true,
      ),
      calldataRecords:
          (json.valueEnsureAsList<dynamic>(
                'calldata_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<CalldataRecord, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => CalldataRecord.fromJson(v),
                ),
              )
              .toList(),
      bandIbcLatestRequestId: json.valueAsBigInt<BigInt?>(
        'band_ibc_latest_request_id',
        acceptCamelCase: true,
      ),
      chainlinkPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'chainlink_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.ChainlinkPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .ChainlinkPriceState.fromJson(v),
                ),
              )
              .toList(),
      historicalPriceRecords:
          (json.valueEnsureAsList<dynamic>(
                'historical_price_records',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PriceRecords,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PriceRecords.fromJson(v),
                ),
              )
              .toList(),
      providerStates:
          (json.valueEnsureAsList<dynamic>(
                'provider_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.ProviderState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .ProviderState.fromJson(v),
                ),
              )
              .toList(),
      pythPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'pyth_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PythPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PythPriceState.fromJson(v),
                ),
              )
              .toList(),
      storkPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'stork_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.StorkPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .StorkPriceState.fromJson(v),
                ),
              )
              .toList(),
      storkPublishers:
          (json.valueEnsureAsList<dynamic>(
            'stork_publishers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      chainlinkDataStreamsPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'chainlink_data_streams_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.ChainlinkDataStreamsPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .ChainlinkDataStreamsPriceState.fromJson(v),
                ),
              )
              .toList(),
      pythProPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'pyth_pro_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.PythProPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .PythProPriceState.fromJson(v),
                ),
              )
              .toList(),
      sedaFastPriceStates:
          (json.valueEnsureAsList<dynamic>(
                'seda_fast_price_states',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_oracle_v1beta1_oracle.SedaFastPriceState,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => injective_oracle_v1beta1_oracle
                          .SedaFastPriceState.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory GenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return GenesisState(
      params: decode.messageTo<injective_oracle_v1beta1_oracle.Params?>(
        1,
        (b) => injective_oracle_v1beta1_oracle.Params.deserialize(b),
      ),
      bandRelayers: decode.getListOrEmpty<String>(2),
      bandPriceStates:
          decode
              .getListOfBytes(3)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .BandPriceState.deserialize(b),
              )
              .toList(),
      priceFeedPriceStates:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .PriceFeedState.deserialize(b),
              )
              .toList(),
      coinbasePriceStates:
          decode
              .getListOfBytes(5)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .CoinbasePriceState.deserialize(b),
              )
              .toList(),
      bandIbcPriceStates:
          decode
              .getListOfBytes(6)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .BandPriceState.deserialize(b),
              )
              .toList(),
      bandIbcOracleRequests:
          decode
              .getListOfBytes(7)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .BandOracleRequest.deserialize(b),
              )
              .toList(),
      bandIbcParams: decode
          .messageTo<injective_oracle_v1beta1_oracle.BandIBCParams?>(
            8,
            (b) => injective_oracle_v1beta1_oracle.BandIBCParams.deserialize(b),
          ),
      bandIbcLatestClientId: decode.getBigInt<BigInt?>(9),
      calldataRecords:
          decode
              .getListOfBytes(10)
              .map((b) => CalldataRecord.deserialize(b))
              .toList(),
      bandIbcLatestRequestId: decode.getBigInt<BigInt?>(11),
      chainlinkPriceStates:
          decode
              .getListOfBytes(12)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .ChainlinkPriceState.deserialize(b),
              )
              .toList(),
      historicalPriceRecords:
          decode
              .getListOfBytes(13)
              .map(
                (b) =>
                    injective_oracle_v1beta1_oracle.PriceRecords.deserialize(b),
              )
              .toList(),
      providerStates:
          decode
              .getListOfBytes(14)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .ProviderState.deserialize(b),
              )
              .toList(),
      pythPriceStates:
          decode
              .getListOfBytes(15)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .PythPriceState.deserialize(b),
              )
              .toList(),
      storkPriceStates:
          decode
              .getListOfBytes(16)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .StorkPriceState.deserialize(b),
              )
              .toList(),
      storkPublishers: decode.getListOrEmpty<String>(17),
      chainlinkDataStreamsPriceStates:
          decode
              .getListOfBytes(18)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .ChainlinkDataStreamsPriceState.deserialize(b),
              )
              .toList(),
      pythProPriceStates:
          decode
              .getListOfBytes(19)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .PythProPriceState.deserialize(b),
              )
              .toList(),
      sedaFastPriceStates:
          decode
              .getListOfBytes(20)
              .map(
                (b) => injective_oracle_v1beta1_oracle
                    .SedaFastPriceState.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1GenesisState;
}

class CalldataRecord extends CosmosProtoMessage {
  final BigInt? clientId;

  final List<int>? calldata;

  const CalldataRecord({this.clientId, this.calldata});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, calldata];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId?.toString(),
      'calldata': switch (calldata) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory CalldataRecord.fromJson(Map<String, dynamic> json) {
    return CalldataRecord(
      clientId: json.valueAsBigInt<BigInt?>('client_id', acceptCamelCase: true),
      calldata: json.valueAsBytes<List<int>?>(
        'calldata',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory CalldataRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CalldataRecord(
      clientId: decode.getBigInt<BigInt?>(1),
      calldata: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveOracleV1beta1CalldataRecord;
}
