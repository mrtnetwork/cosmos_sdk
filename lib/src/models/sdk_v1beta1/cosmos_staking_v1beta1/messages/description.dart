import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// Description defines a validator description.
class Description extends CosmosMessage {
  // moniker defines a human-readable name for the validator.
  final String? moniker;

  // identity defines an optional identity signature (ex. UPort or Keybase).
  final String? identity;

  // website defines an optional website link.
  final String? website;

  // securityContact defines an optional email for security contact.
  final String? securityContact;

  // details define other optional details.
  final String? details;

  const Description({
    this.moniker,
    this.identity,
    this.website,
    this.securityContact,
    this.details,
  });
  factory Description.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Description(
        moniker: decode.getField(1),
        identity: decode.getField(2),
        website: decode.getField(3),
        securityContact: decode.getField(4),
        details: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      'moniker': moniker,
      'identity': identity,
      'website': website,
      'security_contact': securityContact,
      'details': details,
    };
  }

  @override
  String get typeUrl => StakingV1beta1Types.description.typeUrl;

  @override
  List get values => [moniker, identity, website, securityContact, details];
}
