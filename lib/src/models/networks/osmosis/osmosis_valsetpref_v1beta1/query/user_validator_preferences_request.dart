import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_valsetpref_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'user_validator_preferences_response.dart';

/// Request type for UserValidatorPreferences.
class OsmosisValSetprefUserValidatorPreferencesRequest extends CosmosMessage
    with QueryMessage<OsmosisValSetprefUserValidatorPreferencesResponse> {
  /// user account address
  final String address;
  OsmosisValSetprefUserValidatorPreferencesRequest({required this.address});
  factory OsmosisValSetprefUserValidatorPreferencesRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisValSetprefUserValidatorPreferencesRequest(
      address: decode.getField(1),
    );
  }
  factory OsmosisValSetprefUserValidatorPreferencesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisValSetprefUserValidatorPreferencesRequest(
      address: json["address"],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisValSetprefV1beta1Types.userValidatorPreferencesRequest;

  @override
  List get values => [address];

  @override
  OsmosisValSetprefUserValidatorPreferencesResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisValSetprefUserValidatorPreferencesResponse.fromJson(json);
  }

  @override
  OsmosisValSetprefUserValidatorPreferencesResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisValSetprefUserValidatorPreferencesResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [address];
}
