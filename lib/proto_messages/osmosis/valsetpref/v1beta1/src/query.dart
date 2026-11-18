import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/osmosis/valsetpref/v1beta1/src/state.dart"
    as osmosis_valsetpref_v1beta1_state;

/// Request type for UserValidatorPreferences.
class UserValidatorPreferencesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<UserValidatorPreferencesResponse> {
  /// user account address
  final String? address;

  const UserValidatorPreferencesRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/osmosis/valset-pref/v1beta1/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address};
  }

  factory UserValidatorPreferencesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UserValidatorPreferencesRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory UserValidatorPreferencesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserValidatorPreferencesRequest(
      address: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1UserValidatorPreferencesRequest;
  @override
  UserValidatorPreferencesResponse onQueryResponse(List<int> bytes) {
    return UserValidatorPreferencesResponse.deserialize(bytes);
  }

  @override
  UserValidatorPreferencesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return UserValidatorPreferencesResponse.fromJson(json);
  }
}

/// Response type the QueryUserValidatorPreferences query request
class UserValidatorPreferencesResponse extends CosmosProtoMessage {
  final List<osmosis_valsetpref_v1beta1_state.ValidatorPreference> preferences;

  const UserValidatorPreferencesResponse({this.preferences = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [preferences];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'preferences': preferences.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory UserValidatorPreferencesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return UserValidatorPreferencesResponse(
      preferences:
          (json.valueEnsureAsList<dynamic>(
                'preferences',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  osmosis_valsetpref_v1beta1_state.ValidatorPreference,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => osmosis_valsetpref_v1beta1_state
                          .ValidatorPreference.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory UserValidatorPreferencesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UserValidatorPreferencesResponse(
      preferences:
          decode
              .getListOfBytes(1)
              .map(
                (b) => osmosis_valsetpref_v1beta1_state
                    .ValidatorPreference.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisValsetprefV1beta1UserValidatorPreferencesResponse;
}
