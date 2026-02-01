import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class CCTPV1Types extends TypeUrl {
  const CCTPV1Types._(super.typeUrl, {super.aminoType});

  static const CCTPV1Types msgAcceptOwner = CCTPV1Types._(
    "/circle.cctp.v1.MsgAcceptOwner",
    aminoType: "cctp/AcceptOwner",
  );
  static const CCTPV1Types msgUpdateOwner = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateOwner",
    aminoType: "cctp/UpdateOwner",
  );
  static const CCTPV1Types msgUpdatePauser = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdatePauser",
    aminoType: "cctp/UpdatePauser",
  );
  static const CCTPV1Types msgUpdateSignatureThreshold = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateSignatureThreshold",
    aminoType: "cctp/UpdateSignatureThreshold",
  );
  static const CCTPV1Types msgUpdateTokenController = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateTokenController",
    aminoType: "cctp/UpdateTokenController",
  );
  static const CCTPV1Types msgUpdateAttesterManager = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateAttesterManager",
    aminoType: "cctp/UpdateAttesterManager",
  );
  static const CCTPV1Types msgUpdateMaxMessageBodySize = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateMaxMessageBodySize",
    aminoType: "cctp/UpdateMaxMessageBodySize",
  );
  static const CCTPV1Types msgSetMaxBurnAmountPerMessage = CCTPV1Types._(
    "/circle.cctp.v1.MsgSetMaxBurnAmountPerMessage",
    aminoType: "cctp/SetMaxBurnAmountPerMessage",
  );
  static const CCTPV1Types msgPauseBurningAndMinting = CCTPV1Types._(
    "/circle.cctp.v1.MsgPauseBurningAndMinting",
    aminoType: "cctp/PauseBurningAndMinting",
  );
  static const CCTPV1Types msgUnpauseBurningAndMinting = CCTPV1Types._(
    "/circle.cctp.v1.MsgUnpauseBurningAndMinting",
    aminoType: "cctp/UnpauseBurningAndMinting",
  );
  static const CCTPV1Types msgPauseSendingAndReceivingMessages = CCTPV1Types._(
    "/circle.cctp.v1.MsgPauseSendingAndReceivingMessages",
    aminoType: "cctp/PauseSendingAndReceivingMessages",
  );
  static const CCTPV1Types msgUnpauseSendingAndReceivingMessages =
      CCTPV1Types._(
        "/circle.cctp.v1.MsgUnpauseSendingAndReceivingMessages",
        aminoType: "cctp/UnpauseSendingAndReceivingMessages",
      );
  static const CCTPV1Types msgAcceptOwnerResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgAcceptOwnerResponse",
  );
  static const CCTPV1Types msgUpdateOwnerResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateOwnerResponse",
  );
  static const CCTPV1Types msgUpdatePauserResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdatePauserResponse",
  );
  static const CCTPV1Types msgUpdateSignatureThresholdResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateSignatureThresholdResponse",
  );
  static const CCTPV1Types msgUpdateTokenControllerResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateTokenControllerResponse",
  );
  static const CCTPV1Types msgUpdateAttesterManagerResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateAttesterManagerResponse",
  );
  static const CCTPV1Types msgUpdateMaxMessageBodySizeResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgUpdateMaxMessageBodySizeResponse",
  );
  static const CCTPV1Types msgSetMaxBurnAmountPerMessageResponse =
      CCTPV1Types._("/circle.cctp.v1.MsgSetMaxBurnAmountPerMessageResponse");
  static const CCTPV1Types msgDepositForBurnResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgDepositForBurnResponse",
  );
  static const CCTPV1Types msgReceiveMessageResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgReceiveMessageResponse",
  );
  static const CCTPV1Types msgDepositForBurnWithCallerResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgDepositForBurnWithCallerResponse",
  );
  static const CCTPV1Types msgAddRemoteTokenMessenger = CCTPV1Types._(
    "/circle.cctp.v1.MsgAddRemoteTokenMessenger",
    aminoType: "cctp/AddRemoteTokenMessenger",
  );
  static const CCTPV1Types msgReplaceDepositForBurn = CCTPV1Types._(
    "/circle.cctp.v1.MsgReplaceDepositForBurn",
    aminoType: "cctp/ReplaceDepositForBurn",
  );
  static const CCTPV1Types msgReplaceMessage = CCTPV1Types._(
    "/circle.cctp.v1.MsgReplaceMessage",
    aminoType: "cctp/ReplaceMessage",
  );
  static const CCTPV1Types msgRemoveRemoteTokenMessenger = CCTPV1Types._(
    "/circle.cctp.v1.MsgRemoveRemoteTokenMessenger",
    aminoType: "cctp/RemoveRemoteTokenMessenger",
  );
  static const CCTPV1Types msgDepositForBurn = CCTPV1Types._(
    "/circle.cctp.v1.MsgDepositForBurn",
    aminoType: "cctp/DepositForBurn",
  );

  static const CCTPV1Types msgSendMessage = CCTPV1Types._(
    "/circle.cctp.v1.MsgSendMessage",
    aminoType: "cctp/SendMessage",
  );
  static const CCTPV1Types msgSendMessageWithCaller = CCTPV1Types._(
    "/circle.cctp.v1.MsgSendMessageWithCaller",
    aminoType: "cctp/SendMessageWithCaller",
  );
  static const CCTPV1Types msgAddRemoteTokenMessengerResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgAddRemoteTokenMessengerResponse",
  );
  static const CCTPV1Types msgRemoveRemoteTokenMessengerResponse =
      CCTPV1Types._("/circle.cctp.v1.MsgRemoveRemoteTokenMessengerResponse");
  static const CCTPV1Types msgReplaceDepositForBurnResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgReplaceDepositForBurnResponse",
  );
  static const CCTPV1Types msgReplaceMessageResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgReplaceMessageResponse",
  );
  static const CCTPV1Types msgSendMessageResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgSendMessageResponse",
  );
  static const CCTPV1Types msgSendMessageWithCallerResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgSendMessageWithCallerResponse",
  );
  static const CCTPV1Types msgDepositForBurnWithCaller = CCTPV1Types._(
    "/circle.cctp.v1.MsgDepositForBurnWithCaller",
    aminoType: "cctp/DepositForBurnWithCaller",
  );

  static const CCTPV1Types msgDisableAttester = CCTPV1Types._(
    "/circle.cctp.v1.MsgDisableAttester",
    aminoType: "cctp/DisableAttester",
  );

  static const CCTPV1Types msgEnableAttester = CCTPV1Types._(
    "/circle.cctp.v1.MsgEnableAttester",
    aminoType: "cctp/EnableAttester",
  );
  static const CCTPV1Types msgDisableAttesterResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgDisableAttesterResponse",
  );
  static const CCTPV1Types msgEnableAttesterResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgEnableAttesterResponse",
  );

  static const CCTPV1Types msgLinkTokenPair = CCTPV1Types._(
    "/circle.cctp.v1.MsgLinkTokenPair",
    aminoType: "cctp/LinkTokenPair",
  );
  static const CCTPV1Types msgUnlinkTokenPair = CCTPV1Types._(
    "/circle.cctp.v1.MsgUnlinkTokenPair",
    aminoType: "cctp/UnlinkTokenPair",
  );
  static const CCTPV1Types msgReceiveMessage = CCTPV1Types._(
    "/circle.cctp.v1.MsgReceiveMessage",
    aminoType: "cctp/ReceiveMessage",
  );

  static const CCTPV1Types msgLinkTokenPairResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgLinkTokenPairResponse",
  );
  static const CCTPV1Types msgUnlinkTokenPairResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgUnlinkTokenPairResponse",
  );
  static const CCTPV1Types msgPauseBurningAndMintingResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgPauseBurningAndMintingResponse",
  );
  static const CCTPV1Types msgUnpauseBurningAndMintingResponse = CCTPV1Types._(
    "/circle.cctp.v1.MsgUnpauseBurningAndMintingResponse",
  );
  static const CCTPV1Types msgPauseSendingAndReceivingMessagesResponse =
      CCTPV1Types._(
        "/circle.cctp.v1.MsgPauseSendingAndReceivingMessagesResponse",
      );
  static const CCTPV1Types msgUnpauseSendingAndReceivingMessagesResponse =
      CCTPV1Types._(
        "/circle.cctp.v1.MsgUnpauseSendingAndReceivingMessagesResponse",
      );

  static const List<TypeUrl> services = [
    msgAcceptOwner,
    msgUpdateOwner,
    msgUpdatePauser,
    msgUpdateSignatureThreshold,
    msgUpdateTokenController,
    msgUpdateAttesterManager,
    msgUpdateMaxMessageBodySize,
    msgSetMaxBurnAmountPerMessage,
    msgPauseBurningAndMinting,
    msgUnpauseBurningAndMinting,
    msgPauseSendingAndReceivingMessages,
    msgUnpauseSendingAndReceivingMessages,
    msgAddRemoteTokenMessenger,
    msgReplaceDepositForBurn,
    msgReplaceMessage,
    msgRemoveRemoteTokenMessenger,
    msgDepositForBurn,
    msgSendMessage,
    msgSendMessageWithCaller,
    msgDepositForBurnWithCaller,
    msgDisableAttester,
    msgEnableAttester,
    msgLinkTokenPair,
    msgUnlinkTokenPair,
    msgReceiveMessage,
  ];
  static TypeUrl? findService(String? type, {bool amino = false}) {
    if (type == null) return null;
    if (amino) {
      return services.firstWhereNullable((e) => e.aminoType == type);
    }
    return services.firstWhereNullable((e) => e.typeUrl == type);
  }
}
