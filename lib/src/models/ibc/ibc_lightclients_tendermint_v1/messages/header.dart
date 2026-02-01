import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/signed_header.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/validator_set.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Header defines the Tendermint client consensus Header.
/// It encapsulates all the information necessary to update
/// from a trusted Tendermint ConsensusState. The inclusion
/// of TrustedHeight and TrustedValidators allows this update
///  to process correctly, so long as the ConsensusState for the
/// TrustedHeight exists, this removes race conditions among
///  relayers The SignedHeader and ValidatorSet are the new
///  untrusted update fields for the client. The TrustedHeight
/// is the height of a stored ConsensusState on the client that
///  will be used to verify the new untrusted header. The Trusted
/// ConsensusState must be within the unbonding period of current
/// time in order to correctly verify, and the TrustedValidators
/// must hash to TrustedConsensusState.NextValidatorsHash since
/// that is the last trusted validator set at the TrustedHeight.
class IbcTendermintHeader extends CosmosMessage {
  final SignedHeader? signedHeader;
  final ValidatorSet? validatorSet;
  final IbcClientHeight trustedHeight;
  final ValidatorSet? trustedValidators;
  IbcTendermintHeader({
    this.signedHeader,
    this.validatorSet,
    required this.trustedHeight,
    this.trustedValidators,
  });
  factory IbcTendermintHeader.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTendermintHeader(
      signedHeader: decode
          .getResult(1)
          ?.to<SignedHeader, List<int>>((e) => SignedHeader.deserialize(e)),
      validatorSet: decode
          .getResult(2)
          ?.to<ValidatorSet, List<int>>((e) => ValidatorSet.deserialize(e)),
      trustedHeight: IbcClientHeight.deserialize(decode.getField(3)),
      trustedValidators: decode
          .getResult(4)
          ?.to<ValidatorSet, List<int>>((e) => ValidatorSet.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "signed_header": signedHeader?.toJson(),
      "validator_set": validatorSet?.toJson(),
      "trusted_height": trustedHeight.toJson(),
      "trusted_validators": trustedValidators?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.ibcTendermintV1Header;

  @override
  List get values => [
    signedHeader,
    validatorSet,
    trustedHeight,
    trustedValidators,
  ];
}
