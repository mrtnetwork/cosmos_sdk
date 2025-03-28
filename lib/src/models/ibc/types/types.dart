import 'package:blockchain_utils/helper/helper.dart';
import 'package:blockchain_utils/service/models/params.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class IbcTypes extends TypeUrl {
  const IbcTypes._(super.typeUrl,
      {super.rpc, super.query, super.method, super.aminoType});
  static const IbcTypes capability = IbcTypes._("capability.v1.Capability");
  static const IbcTypes owner = IbcTypes._("capability.v1.Owner");
  static const IbcTypes capabilityOwners =
      IbcTypes._("capability.v1.CapabilityOwners");
  static const IbcTypes genesisOwners =
      IbcTypes._("capability.v1.GenesisOwners");
  static const IbcTypes capabilityGenesisState =
      IbcTypes._("capability.v1.GenesisState");

  /// ibc.applications.fee.v1
  static const IbcTypes msgRegisterPayee =
      IbcTypes._("/ibc.applications.fee.v1.MsgRegisterPayee");
  static const IbcTypes msgRegisterPayeeResponse =
      IbcTypes._("/ibc.applications.fee.v1.MsgRegisterPayeeResponse");
  static const IbcTypes msgRegisterCounterpartyPayee =
      IbcTypes._("/ibc.applications.fee.v1.MsgRegisterCounterpartyPayee");
  static const IbcTypes msgRegisterCounterpartyPayeeResponse = IbcTypes._(
      "/ibc.applications.fee.v1.MsgRegisterCounterpartyPayeeResponse");
  static const IbcTypes fee = IbcTypes._("/ibc.applications.fee.v1.Fee");
  static const IbcTypes packetFee =
      IbcTypes._("/ibc.applications.fee.v1.PacketFee");
  static const IbcTypes packetFees =
      IbcTypes._("/ibc.applications.fee.v1.PacketFees");
  static const IbcTypes feeEnabledChannel =
      IbcTypes._("/ibc.applications.fee.v1.Fee");
  static const IbcTypes identifiedPacketFees =
      IbcTypes._("/ibc.applications.fee.v1.IdentifiedPacketFees");
  static const IbcTypes incentivizedAcknowledgement =
      IbcTypes._("/ibc.applications.fee.v1.IncentivizedAcknowledgement");
  static const IbcTypes metadata =
      IbcTypes._("/ibc.applications.fee.v1.Metadata");
  static const IbcTypes msgPayPacketFee =
      IbcTypes._("/ibc.applications.fee.v1.MsgPayPacketFee");
  static const IbcTypes msgPayPacketFeeResponse =
      IbcTypes._("/ibc.applications.fee.v1.MsgPayPacketFeeResponse");
  static const IbcTypes msgPayPacketFeeAsync =
      IbcTypes._("/ibc.applications.fee.v1.MsgPayPacketFeeAsync");
  static const IbcTypes msgPayPacketFeeAsyncResponse =
      IbcTypes._("/ibc.applications.fee.v1.MsgPayPacketFeeAsyncResponse");
  static const IbcTypes queryIncentivizedPacketsRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryIncentivizedPacketsRequest",
      query: "/ibc.applications.fee.v1.Query/IncentivizedPackets",
      rpc: "/ibc/apps/fee/v1/incentivized_packets");
  static const IbcTypes queryIncentivizedPacketsResponse =
      IbcTypes._("/ibc.applications.fee.v1.QueryIncentivizedPacketsResponse");
  static const IbcTypes queryIncentivizedPacketRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryIncentivizedPacketRequest",
      query: "/ibc.applications.fee.v1.Query/IncentivizedPacket",
      rpc:
          "/ibc/apps/fee/v1/channels/:channel_id/ports/:port_id/sequences/:sequence/incentivized_packet");
  static const IbcTypes queryIncentivizedPacketResponse =
      IbcTypes._("/ibc.applications.fee.v1.QueryIncentivizedPacketResponse");
  static const IbcTypes queryIncentivizedPacketsForChannelRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryIncentivizedPacketsForChannelRequest",
      query: "/ibc.applications.fee.v1.Query/IncentivizedPacketsForChannel",
      rpc:
          "/ibc/apps/fee/v1/channels/:channel_id/ports/:port_id/incentivized_packets");
  static const IbcTypes queryIncentivizedPacketsForChannelResponse = IbcTypes._(
      "/ibc.applications.fee.v1.QueryIncentivizedPacketsForChannelResponse");
  static const IbcTypes queryTotalRecvFeesRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryTotalRecvFeesRequest",
      query: "/ibc.applications.fee.v1.Query/TotalRecvFees",
      rpc:
          "/ibc/apps/fee/v1/channels/:channel_id/ports/:port_id/sequences/:sequence/total_recv_fees");
  static const IbcTypes queryTotalRecvFeesResponse =
      IbcTypes._("/ibc.applications.fee.v1.queryTotalRecvFeesResponse");
  static const IbcTypes queryTotalAckFeesRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryTotalAckFeesRequest",
      query: "/ibc.applications.fee.v1.Query/TotalAckFees",
      rpc:
          "/ibc/apps/fee/v1/channels/:channel_id/ports/:port_id/sequences/:sequence/total_ack_fees");
  static const IbcTypes queryTotalAckFeesResponse =
      IbcTypes._("/ibc.applications.fee.v1.QueryTotalAckFeesResponse");
  static const IbcTypes queryTotalTimeoutFeesRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryTotalTimeoutFeesRequest",
      query: "/ibc.applications.fee.v1.Query/TotalTimeoutFees",
      rpc:
          "/ibc/apps/fee/v1/channels/:channel_id/ports/:port_id/sequences/:sequence/total_timeout_fees");
  static const IbcTypes queryTotalTimeoutFeesResponse =
      IbcTypes._("/ibc.applications.fee.v1.QueryTotalTimeoutFeesResponse");
  static const IbcTypes queryPayeeRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryPayeeRequest",
      query: "/ibc.applications.fee.v1.Query/Payee",
      rpc: "/ibc/apps/fee/v1/channels/:channel_id/relayers/:relayer/payee");
  static const IbcTypes queryPayeeResponse =
      IbcTypes._("/ibc.applications.fee.v1.QueryPayeeResponse");
  static const IbcTypes queryCounterpartyPayeeRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryCounterpartyPayeeRequest",
      query: "/ibc.applications.fee.v1.Query/CounterpartyPayee",
      rpc:
          "/ibc/apps/fee/v1/channels/:channel_id/relayers/:relayer/counterparty_payee");
  static const IbcTypes queryCounterpartyPayeeResponse =
      IbcTypes._("/ibc.applications.fee.v1.QueryCounterpartyPayeeResponse");
  static const IbcTypes queryFeeEnabledChannelsRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryFeeEnabledChannelsRequest",
      query: "/ibc.applications.fee.v1.Query/FeeEnabledChannels",
      rpc: "/ibc/apps/fee/v1/fee_enabled");
  static const IbcTypes queryFeeEnabledChannelsResponse =
      IbcTypes._("/ibc.applications.fee.v1.QueryFeeEnabledChannelsResponse");
  static const IbcTypes queryFeeEnabledChannelRequest = IbcTypes._(
      "/ibc.applications.fee.v1.QueryFeeEnabledChannelRequest",
      query: "/ibc.applications.fee.v1.Query/FeeEnabledChannel",
      rpc: "/ibc/apps/fee/v1/channels/:channel_id/ports/:port_id/fee_enabled");
  static const IbcTypes queryFeeEnabledChannelResponse =
      IbcTypes._("/ibc.applications.fee.v1.QueryFeeEnabledChannelResponse");

  /// ibc.core.channel.v1
  static const IbcTypes packetSequence =
      IbcTypes._("/ibc.core.channel.v1.PacketSequence");
  static const IbcTypes packetId = IbcTypes._("/ibc.core.channel.v1.PacketId");
  static const IbcTypes counterParty =
      IbcTypes._("/ibc.core.channel.v1.Counterparty");
  static const IbcTypes errorReceipt =
      IbcTypes._("/ibc.core.channel.v1.ErrorReceipt");
  static const IbcTypes identifiedChannel =
      IbcTypes._("/ibc.core.channel.v1.IdentifiedChannel");
  static const IbcTypes upgradeFields =
      IbcTypes._("/ibc.core.channel.v1.UpgradeFields");
  static const IbcTypes channel = IbcTypes._("/ibc.core.channel.v1.Channel");
  static const IbcTypes msgChannelOpenInit =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelOpenInit");
  static const IbcTypes msgChannelOpenInitResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelOpenInitResponse");
  static const IbcTypes msgChannelOpenTry =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelOpenTry");
  static const IbcTypes msgChannelOpenTryResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelOpenTryResponse");
  static const IbcTypes msgChannelOpenAck =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelOpenAck");
  static const IbcTypes msgChannelOpenAckResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelOpenAckResponse");
  static const IbcTypes msgChannelOpenConfirm =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelOpenConfirm");
  static const IbcTypes msgChannelOpenConfirmResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelOpenConfirmResponse");
  static const IbcTypes msgChannelCloseInit =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelCloseInit");
  static const IbcTypes msgChannelCloseInitResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelCloseInitResponse");
  static const IbcTypes msgChannelCloseConfirm =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelCloseConfirm");
  static const IbcTypes msgChannelCloseConfirmResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelCloseConfirmResponse");
  static const IbcTypes packet = IbcTypes._("/ibc.core.channel.v1.Packet");
  static const IbcTypes msgRecvPacket =
      IbcTypes._("/ibc.core.channel.v1.MsgRecvPacket");
  static const IbcTypes msgRecvPacketResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgRecvPacketResponse");
  static const IbcTypes msgTimeout =
      IbcTypes._("/ibc.core.channel.v1.MsgTimeout");
  static const IbcTypes msgTimeoutResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgTimeoutResponse");
  static const IbcTypes msgTimeoutOnClose =
      IbcTypes._("/ibc.core.channel.v1.MsgTimeoutOnClose");
  static const IbcTypes msgTimeoutOnCloseResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgTimeoutOnCloseResponse");
  static const IbcTypes msgAcknowledgement =
      IbcTypes._("/ibc.core.channel.v1.MsgAcknowledgement");
  static const IbcTypes msgAcknowledgementResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgAcknowledgementResponse");
  static const IbcTypes timeout = IbcTypes._("/ibc.core.channel.v1.Timeout");
  static const IbcTypes msgChannelUpgradeInit =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeInit");
  static const IbcTypes msgChannelUpgradeInitResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeInitResponse");
  static const IbcTypes upgrade = IbcTypes._("/ibc.core.channel.v1.Upgrade");
  static const IbcTypes msgChannelUpgradeTry =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeTry");
  static const IbcTypes msgChannelUpgradeTryResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeTryResponse");
  static const IbcTypes msgChannelUpgradeAck =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeAck");
  static const IbcTypes msgChannelUpgradeAckResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeAckResponse");
  static const IbcTypes msgChannelUpgradeConfirm =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeConfirm");
  static const IbcTypes msgChannelUpgradeConfirmResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeConfirmResponse");
  static const IbcTypes msgChannelUpgradeOpen =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeOpen");
  static const IbcTypes msgChannelUpgradeOpenResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeOpenResponse");
  static const IbcTypes msgChannelUpgradeTimeout =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeTimeout");
  static const IbcTypes msgChannelUpgradeTimeoutResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeTimeoutResponse");
  static const IbcTypes msgChannelUpgradeCancel =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeCancel");
  static const IbcTypes msgChannelUpgradeCancelResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgChannelUpgradeCancelResponse");
  static const IbcTypes ibcChannelParams =
      IbcTypes._("/ibc.core.channel.v1.Params");
  static const IbcTypes ibcChannelmsgUpdateParams =
      IbcTypes._("/ibc.core.channel.v1.MsgUpdateParams");
  static const IbcTypes ibcChannelmsgUpdateParamsResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgUpdateParamsResponse");
  static const IbcTypes msgPruneAcknowledgements =
      IbcTypes._("/ibc.core.channel.v1.MsgPruneAcknowledgements");
  static const IbcTypes msgPruneAcknowledgementsResponse =
      IbcTypes._("/ibc.core.channel.v1.MsgPruneAcknowledgementsResponse");
  static const IbcTypes queryChannelRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryChannelRequest",
      query: "/ibc.core.channel.v1.Query/Channel",
      rpc: "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id");
  static const IbcTypes queryChannelResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryChannelResponse");
  static const IbcTypes queryChannelsRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryChannelsRequest",
      query: "/ibc.core.channel.v1.Query/Channels",
      rpc: "/ibc/core/channel/v1/channels");
  static const IbcTypes queryChannelsResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryChannelsResponse");
  static const IbcTypes queryConnectionChannelsRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryConnectionChannelsRequest",
      query: "/ibc.core.channel.v1.Query/ConnectionChannels",
      rpc: "/ibc/core/channel/v1/connections/:connection/channels");
  static const IbcTypes queryConnectionChannelsResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryConnectionChannelsResponse");
  static const IbcTypes queryChannelClientStateRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryChannelClientStateRequest",
      query: "/ibc.core.channel.v1.Query/ChannelClientState",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/client_state");
  static const IbcTypes queryChannelClientStateResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryChannelClientStateResponse");
  static const IbcTypes queryChannelConsensusStateRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryChannelConsensusStateRequest",
      query: "/ibc.core.channel.v1.Query/ChannelConsensusState",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/consensus_state/revision/:revision_number/height/:revision_height");
  static const IbcTypes queryChannelConsensusStateResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryChannelConsensusStateResponse");
  static const IbcTypes queryPacketCommitmentRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryPacketCommitmentRequest",
      query: "/ibc.core.channel.v1.Query/PacketCommitment",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/packet_commitments/:sequence");
  static const IbcTypes queryPacketCommitmentResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryPacketCommitmentResponse");
  static const IbcTypes packetState =
      IbcTypes._("/ibc.core.channel.v1.PacketState");
  static const IbcTypes queryPacketCommitmentsRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryPacketCommitmentsRequest",
      query: "/ibc.core.channel.v1.Query/PacketCommitments",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/packet_commitments");
  static const IbcTypes queryPacketCommitmentsResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryPacketCommitmentsResponse");
  static const IbcTypes queryPacketReceiptRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryPacketReceiptRequest",
      query: "/ibc.core.channel.v1.Query/PacketReceipt",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/packet_receipts/:sequence");
  static const IbcTypes queryPacketReceiptResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryPacketReceiptResponse");
  static const IbcTypes queryPacketAcknowledgementRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryPacketAcknowledgementRequest",
      query: "/ibc.core.channel.v1.Query/PacketAcknowledgement",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/packet_acks/:sequence");
  static const IbcTypes queryPacketAcknowledgementResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryPacketAcknowledgementResponse");
  static const IbcTypes queryPacketAcknowledgementsRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryPacketAcknowledgementsRequest",
      query: "/ibc.core.channel.v1.Query/PacketAcknowledgements",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/packet_acknowledgements");
  static const IbcTypes queryPacketAcknowledgementsResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryPacketAcknowledgementsResponse");
  static const IbcTypes queryUnreceivedPacketsRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryUnreceivedPacketsRequest",
      query: "/ibc.core.channel.v1.Query/UnreceivedPackets",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/packet_commitments/:packet_commitment_sequences/unreceived_packets");
  static const IbcTypes queryUnreceivedPacketsResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryUnreceivedPacketsResponse");
  static const IbcTypes queryUnreceivedAcksRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryUnreceivedAcksRequest",
      query: "/ibc.core.channel.v1.Query/UnreceivedAcks",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/packet_commitments/:packet_ack_sequences/unreceived_acks");
  static const IbcTypes queryUnreceivedAcksResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryUnreceivedAcksResponse");
  static const IbcTypes queryNextSequenceReceiveRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryNextSequenceReceiveRequest",
      query: "/ibc.core.channel.v1.Query/NextSequenceReceive",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/next_sequence");
  static const IbcTypes queryNextSequenceReceiveResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryNextSequenceReceiveResponse");
  static const IbcTypes queryNextSequenceSendRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryNextSequenceSendRequest",
      query: "/ibc.core.channel.v1.Query/NextSequenceSend",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/next_sequence_send");
  static const IbcTypes queryNextSequenceSendResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryNextSequenceSendResponse");
  static const IbcTypes queryUpgradeErrorRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryUpgradeErrorRequest",
      query: "/ibc.core.channel.v1.Query/UpgradeError",
      rpc:
          "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/upgrade_error");
  static const IbcTypes queryUpgradeErrorResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryUpgradeErrorResponse");
  static const IbcTypes queryUpgradeRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryUpgradeRequest",
      query: "/ibc.core.channel.v1.Query/Upgrade",
      rpc: "/ibc/core/channel/v1/channels/:channel_id/ports/:port_id/upgrade");
  static const IbcTypes queryUpgradeResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryUpgradeResponse");
  static const IbcTypes queryChannelParamsRequest = IbcTypes._(
      "/ibc.core.channel.v1.QueryChannelParamsRequest",
      query: "/ibc.core.channel.v1.Query/ChannelParams",
      rpc: "/ibc/core/channel/v1/params");
  static const IbcTypes queryChannelParamsResponse =
      IbcTypes._("/ibc.core.channel.v1.QueryChannelParamsResponse");
  static const IbcTypes ibcChannelGenesisState =
      IbcTypes._("/ibc.core.channel.v1.GenesisState");

  /// ibc.core.client.v1
  static const IbcTypes height = IbcTypes._("/ibc.core.client.v1.Height");
  static const IbcTypes genesisMetadata =
      IbcTypes._("/ibc.core.client.v1.GenesisMetadata");
  static const IbcTypes identifiedClientState =
      IbcTypes._("/ibc.core.client.v1.IdentifiedClientState");
  static const IbcTypes identifiedGenesisMetadata =
      IbcTypes._("/ibc.core.client.v1.IdentifiedGenesisMetadata");
  static const IbcTypes msgCreateClient =
      IbcTypes._("/ibc.core.client.v1.MsgCreateClient");
  static const IbcTypes msgCreateClientResponse =
      IbcTypes._("/ibc.core.client.v1.MsgCreateClientResponse");
  static const IbcTypes msgUpdateClient =
      IbcTypes._("/ibc.core.client.v1.MsgUpdateClient");
  static const IbcTypes msgUpdateClientResponse =
      IbcTypes._("/ibc.core.client.v1.MsgUpdateClientResponse");
  static const IbcTypes ibcClientParams =
      IbcTypes._("/ibc.core.client.v1.Params");
  static const IbcTypes msgUpgradeClient =
      IbcTypes._("/ibc.core.client.v1.MsgUpgradeClient");
  static const IbcTypes msgUpgradeClientResponse =
      IbcTypes._("/ibc.core.client.v1.MsgUpgradeClientResponse");
  static const IbcTypes msgRecoverClient =
      IbcTypes._("/ibc.core.client.v1.MsgRecoverClient");
  static const IbcTypes msgRecoverClientResponse =
      IbcTypes._("/ibc.core.client.v1.MsgRecoverClientResponse");
  static const IbcTypes msgIBCSoftwareUpgrade =
      IbcTypes._("/ibc.core.client.v1.MsgIBCSoftwareUpgrade");
  static const IbcTypes msgIBCSoftwareUpgradeResponse =
      IbcTypes._("/ibc.core.client.v1.MsgIBCSoftwareUpgradeResponse");
  static const IbcTypes msgUpdateParams =
      IbcTypes._("/ibc.core.client.v1.MsgUpdateParams");
  static const IbcTypes msgUpdateParamsResponse =
      IbcTypes._("/ibc.core.client.v1.MsgIBCSoftwareUpgradeResponse");
  static const IbcTypes queryClientStateRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryClientStateRequest",
      query: "/ibc.core.client.v1.Query/ClientState",
      rpc: "/ibc/core/client/v1/client_states/:client_id");
  static const IbcTypes queryClientStateResponse =
      IbcTypes._("/ibc.core.client.v1.QueryClientStateResponse");
  static const IbcTypes queryClientStatesRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryClientStatesRequest",
      query: "/ibc.core.client.v1.Query/ClientStates",
      rpc: "/ibc/core/client/v1/client_states");
  static const IbcTypes queryClientStatesResponse =
      IbcTypes._("/ibc.core.client.v1.QueryClientStatesResponse");
  static const IbcTypes queryConsensusStateRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryConsensusStateRequest",
      query: "/ibc.core.client.v1.Query/ConsensusState",
      rpc:
          "/ibc/core/client/v1/consensus_states/:client_id/revision/:revision_number/height/:revision_height");
  static const IbcTypes queryConsensusStateResponse =
      IbcTypes._("/ibc.core.client.v1.QueryConsensusStateResponse");
  static const IbcTypes queryConsensusStatesRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryConsensusStatesRequest",
      query: "/ibc.core.client.v1.Query/ConsensusStates",
      rpc: "/ibc/core/client/v1/consensus_states/:client_id");
  static const IbcTypes queryConsensusStatesResponse =
      IbcTypes._("/ibc.core.client.v1.QueryConsensusStatesResponse");
  static const IbcTypes consensusStateWithHeight =
      IbcTypes._("/ibc.core.client.v1.ConsensusStateWithHeight");
  static const IbcTypes queryConsensusStateHeightsRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryConsensusStateHeightsRequest",
      query: "/ibc.core.client.v1.Query/ConsensusStateHeights",
      rpc: "/ibc/core/client/v1/consensus_states/:client_id/heights");
  static const IbcTypes queryConsensusStateHeightsResponse =
      IbcTypes._("/ibc.core.client.v1.QueryConsensusStateHeightsResponse");
  static const IbcTypes queryClientStatusRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryClientStatusRequest",
      query: "/ibc.core.client.v1.Query/ClientStatus",
      rpc: "/ibc/core/client/v1/client_status/:client_id");
  static const IbcTypes queryClientStatusResponse =
      IbcTypes._("/ibc.core.client.v1.QueryClientStatusResponse");
  static const IbcTypes queryClientParamsRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryClientParamsRequest",
      query: "/ibc.core.client.v1.Query/ClientParams",
      rpc: "/ibc/core/client/v1/params");
  static const IbcTypes queryClientParamsResponse =
      IbcTypes._("/ibc.core.client.v1.QueryClientParamsResponse");
  static const IbcTypes queryUpgradedClientStateRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryUpgradedClientStateRequest",
      query: "/ibc.core.client.v1.Query/UpgradedClientState",
      rpc: "/ibc/core/client/v1/upgraded_client_states");
  static const IbcTypes queryUpgradedClientStateResponse =
      IbcTypes._("/ibc.core.client.v1.QueryUpgradedClientStateResponse");
  static const IbcTypes queryUpgradedConsensusStateRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryUpgradedConsensusStateRequest",
      query: "/ibc.core.client.v1.Query/UpgradedConsensusState",
      rpc: "/ibc/core/client/v1/upgraded_consensus_states");
  static const IbcTypes queryUpgradedConsensusStateResponse =
      IbcTypes._("/ibc.core.client.v1.QueryUpgradedConsensusStateResponse");
  static const IbcTypes queryVerifyMembershipRequest = IbcTypes._(
      "/ibc.core.client.v1.QueryVerifyMembershipRequest",
      query: "/ibc.core.client.v1.Query/VerifyMembership",
      rpc: "/ibc/core/client/v1/verify_membership",
      method: RequestServiceType.post);
  static const IbcTypes queryVerifyMembershipResponse =
      IbcTypes._("/ibc.core.client.v1.QueryVerifyMembershipResponse");
  static const IbcTypes ibClientClientConsensusStates =
      IbcTypes._("/ibc.core.client.v1.ClientConsensusStates");
  static const IbcTypes ibClientGenesisState =
      IbcTypes._("/ibc.core.client.v1.GenesisState");

  /// ibc.core.commitment.v1

  static const IbcTypes merklePath =
      IbcTypes._("/ibc.core.commitment.v1.MerklePath");
  static const IbcTypes merklePrefix =
      IbcTypes._("/ibc.core.commitment.v1.MerklePrefix");
  static const IbcTypes merkleRoot =
      IbcTypes._("/ibc.core.commitment.v1.MerkleRoot");
  static const IbcTypes merkleProof =
      IbcTypes._("/ibc.core.commitment.v1.MerkleProof");

  /// ibc.applications.transfer.v1
  static const IbcTypes msgTransfer = IbcTypes._(
      "/ibc.applications.transfer.v1.MsgTransfer",
      aminoType: "cosmos-sdk/MsgTransfer");
  static const IbcTypes msgTransferResponse =
      IbcTypes._("/ibc.applications.transfer.v1.MsgTransferResponse");
  static const IbcTypes ibcTransferParams =
      IbcTypes._("/ibc.applications.transfer.v1.Params");
  static const IbcTypes denomTrace =
      IbcTypes._("/ibc.applications.transfer.v1.DenomTrace");
  static const IbcTypes ibcTransfermsgUpdateParams =
      IbcTypes._("/ibc.applications.transfer.v1.MsgUpdateParams");
  static const IbcTypes ibcTransfermsgUpdateParamsResponse =
      IbcTypes._("/ibc.applications.transfer.v1.MsgUpdateParamsResponse");
  static const IbcTypes queryDenomTracesRequest = IbcTypes._(
      "/ibc.applications.transfer.v1.QueryDenomTracesRequest",
      query: "/ibc.applications.transfer.v1.Query/DenomTraces");
  static const IbcTypes queryDenomTracesResponse =
      IbcTypes._("/ibc.applications.transfer.v1.QueryDenomTracesResponse");
  static const IbcTypes queryDenomTraceRequest = IbcTypes._(
      "/ibc.applications.transfer.v1.QueryDenomTraceRequest",
      query: "/ibc.applications.transfer.v1.Query/DenomTrace");
  static const IbcTypes queryDenomTraceResponse =
      IbcTypes._("/ibc.applications.transfer.v1.QueryDenomTraceResponse");
  static const IbcTypes queryParamsRequest = IbcTypes._(
      "/ibc.applications.transfer.v1.QueryParamsRequest",
      query: "/ibc.applications.transfer.v1.Query/Params",
      rpc: "/ibc/apps/transfer/v1/params");
  static const IbcTypes queryParamsResponse =
      IbcTypes._("/ibc.applications.transfer.v1.QueryParamsResponse");
  static const IbcTypes queryDenomHashRequest = IbcTypes._(
      "/ibc.applications.transfer.v1.QueryDenomHashRequest",
      query: "/ibc.applications.transfer.v1.Query/DenomHash",
      rpc: "/ibc/apps/transfer/v1/denom_hashes/:trace");
  static const IbcTypes queryDenomHashResponse =
      IbcTypes._("/ibc.applications.transfer.v1.QueryDenomHashResponse");
  static const IbcTypes queryEscrowAddressRequest = IbcTypes._(
      "/ibc.applications.transfer.v1.QueryEscrowAddressRequest",
      query: "/ibc.applications.transfer.v1.Query/EscrowAddress",
      rpc:
          "/ibc/apps/transfer/v1/channels/:channel_id/ports/:port_id/escrow_address");
  static const IbcTypes queryEscrowAddressResponse =
      IbcTypes._("/ibc.applications.transfer.v1.QueryEscrowAddressResponse");
  static const IbcTypes queryTotalEscrowForDenomRequest = IbcTypes._(
      "/ibc.applications.transfer.v1.QueryTotalEscrowForDenomRequest",
      query: "/ibc.applications.transfer.v1.Query/TotalEscrowForDenom",
      rpc: "/ibc/apps/transfer/v1/denoms/:denom/total_escrow");
  static const IbcTypes queryTotalEscrowForDenomResponse = IbcTypes._(
      "/ibc.applications.transfer.v1.QueryTotalEscrowForDenomResponse");
  static const IbcTypes hop = IbcTypes._("/ibc.applications.transfer.v1.Hop");
  static const IbcTypes denom =
      IbcTypes._("/ibc.applications.transfer.v2.Denom");
  static const IbcTypes token =
      IbcTypes._("/ibc.applications.transfer.v2.Token");
  static const IbcTypes forwardingPacketData =
      IbcTypes._("/ibc.applications.transfer.v2.ForwardingPacketData");
  static const IbcTypes fungibleTokenPacketDataV2 =
      IbcTypes._("/ibc.applications.transfer.v2.FungibleTokenPacketDataV2");
  static const IbcTypes queryDenomRequest = IbcTypes._(
      "/ibc.applications.transfer.v2.QueryDenomRequest",
      query: "/ibc.applications.transfer.v2.Query/Denom",
      rpc: "/ibc/apps/transfer/v2/denoms/:hash");
  static const IbcTypes queryDenomsRequest = IbcTypes._(
      "/ibc.applications.transfer.v2.QueryDenomsRequest",
      query: "/ibc.applications.transfer.v2.Query/Denoms",
      rpc: "/ibc/apps/transfer/v2/denoms");

  static const IbcTypes queryDenomsRespone =
      IbcTypes._("/ibc.applications.transfer.v2.QueryDenomsResponse");
  static const IbcTypes queryDenomRespone =
      IbcTypes._("/ibc.applications.transfer.v2.QueryDenomResponse");

  /// ibc.applications.transfer.v1
  static const IbcTypes fungibleTokenPacketData =
      IbcTypes._("/ibc.applications.transfer.v2.FungibleTokenPacketData");

  /// ibc.applications.interchain_accounts.controller.v1
  static const IbcTypes msgRegisterInterchainAccount = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.MsgRegisterInterchainAccount");
  static const IbcTypes msgRegisterInterchainAccountResponse = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.MsgRegisterInterchainAccountResponse");
  static const IbcTypes msgSendTx = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.MsgSendTx");
  static const IbcTypes msgSendTxResponse = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.MsgSendTxResponse");
  static const IbcTypes interchainAccountsControllerParams = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.MsgSendTxResponse");
  static const IbcTypes interchainAccountsControllerMsgUpdateParams = IbcTypes
      ._("/ibc.applications.interchain_accounts.controller.v1.MsgUpdateParams");
  static const IbcTypes interchainAccountsControllerMsgUpdateParamsResponse =
      IbcTypes._(
          "/ibc.applications.interchain_accounts.controller.v1.MsgUpdateParamsResponse");
  static const IbcTypes queryInterchainAccountRequest = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.QueryInterchainAccountRequest",
      query:
          "/ibc.applications.interchain_accounts.controller.v1.Query/InterchainAccount",
      rpc:
          "/ibc/apps/interchain_accounts/controller/v1/owners/:owner/connections/:connection_id");
  static const IbcTypes queryInterchainAccountResponse = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.QueryInterchainAccountResponse");
  static const IbcTypes interchainAccoutsControllerQueryParamsRequest = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.QueryParamsRequest",
      query: "/ibc.applications.interchain_accounts.controller.v1.Query/Params",
      rpc: "/ibc/apps/interchain_accounts/controller/v1/params");
  static const IbcTypes interchainAccoutsControllerQueryParamsResponse = IbcTypes._(
      "/ibc.applications.interchain_accounts.controller.v1.QueryParamsResponse");

  /// ibc.applications.interchain_accounts.v1
  static const IbcTypes cosmosTx =
      IbcTypes._("/ibc.applications.interchain_accounts.v1.CosmosTx");
  static const IbcTypes interchainAccount =
      IbcTypes._("/ibc.applications.interchain_accounts.v1.InterchainAccount");
  static const IbcTypes interchainAccountPacketData = IbcTypes._(
      "/ibc.applications.interchain_accounts.v1.InterchainAccountPacketData");
  static const IbcTypes interchainAccountMetadata =
      IbcTypes._("/ibc.applications.interchain_accounts.v1.Metadata");

  /// ibc.applications.interchain_accounts.genesis.v1
  static const IbcTypes activeChannel = IbcTypes._(
      "/ibc.applications.interchain_accounts.genesis.v1.ActiveChannel");
  static const IbcTypes registeredInterchainAccount = IbcTypes._(
      "/ibc.applications.interchain_accounts.genesis.v1.RegisteredInterchainAccount");
  static const IbcTypes controllerGenesisState = IbcTypes._(
      "/ibc.applications.interchain_accounts.genesis.v1.ControllerGenesisState");
  static const IbcTypes hostGenesisState = IbcTypes._(
      "/ibc.applications.interchain_accounts.genesis.v1.HostGenesisState");
  static const IbcTypes interchainAccountsGenesisGenesisState = IbcTypes._(
      "/ibc.applications.interchain_accounts.genesis.v1.HostGenesisState");

  /// ibc.applications.interchain_accounts.host.v1
  static const IbcTypes interchainAccountsHostParams =
      IbcTypes._("/ibc.applications.interchain_accounts.host.v1.Params");
  static const IbcTypes interchainAccountsQueryRequest =
      IbcTypes._("/ibc.applications.interchain_accounts.host.v1.QueryRequest");
  static const IbcTypes interchainAccountsHostMsgUpdateParams = IbcTypes._(
      "/ibc.applications.interchain_accounts.host.v1.MsgUpdateParams");

  static const IbcTypes interchainAccountsHostMsgModuleQuerySafe = IbcTypes._(
      "/ibc.applications.interchain_accounts.host.v1.MsgModuleQuerySafe");
  static const IbcTypes interchainAccountsHostMsgUpdateParamsResponse = IbcTypes
      ._("/ibc.applications.interchain_accounts.host.v1.MsgUpdateParamsResponse");
  static const IbcTypes interchainAccountsHostMsgModuleQuerySafeResponse =
      IbcTypes._(
          "/ibc.applications.interchain_accounts.host.v1.MsgModuleQuerySafeResponse");
  static const IbcTypes interchainAccountsHostQueryParamsRequest = IbcTypes._(
      "/ibc.applications.interchain_accounts.host.v1.QueryParamsRequest",
      query: "/ibc.applications.interchain_accounts.host.v1.Query/Params",
      rpc: "/ibc/apps/interchain_accounts/host/v1/params");
  static const IbcTypes interchainAccountsHostQueryParamsResponse = IbcTypes._(
      "/ibc.applications.interchain_accounts.host.v1.QueryParamsResponse");

  /// ibc.core.connection.v1
  static const IbcTypes ibcConnectionVersion =
      IbcTypes._("/ibc.core.connection.v1.Version");
  static const IbcTypes ibcConnectionCounterparty =
      IbcTypes._("/ibc.core.connection.v1.Counterparty");
  static const IbcTypes ibcConnectionIdentifiedConnection =
      IbcTypes._("/ibc.core.connection.v1.IdentifiedConnection");
  static const IbcTypes ibcConnectionConnectionPaths =
      IbcTypes._("/ibc.core.connection.v1.ConnectionPaths");
  static const IbcTypes ibcConnectionConnectionEnd =
      IbcTypes._("/ibc.core.connection.v1.ConnectionEnd");
  static const IbcTypes ibcConnectionClientPaths =
      IbcTypes._("/ibc.core.connection.v1.ClientPaths");

  /// ibc.core.connection.v1
  static const IbcTypes msgConnectionOpenInit =
      IbcTypes._("/ibc.core.connection.v1.MsgConnectionOpenInit");
  static const IbcTypes msgConnectionOpenInitResponse =
      IbcTypes._("/ibc.core.connection.v1.MsgConnectionOpenInitResponse");
  static const IbcTypes msgConnectionOpenTry =
      IbcTypes._("/ibc.core.connection.v1.MsgConnectionOpenTry");
  static const IbcTypes msgConnectionOpenTryResponse =
      IbcTypes._("/ibc.core.connection.v1.MsgConnectionOpenTryResponse");
  static const IbcTypes msgConnectionOpenAck =
      IbcTypes._("/ibc.core.connection.v1.MsgConnectionOpenAck");
  static const IbcTypes msgConnectionOpenAckResponse =
      IbcTypes._("/ibc.core.connection.v1.MsgConnectionOpenAckResponse");
  static const IbcTypes msgConnectionOpenConfirm =
      IbcTypes._("/ibc.core.connection.v1.MsgConnectionOpenConfirm");
  static const IbcTypes msgConnectionOpenConfirmResponse =
      IbcTypes._("/ibc.core.connection.v1.MsgConnectionOpenConfirmResponse");
  static const IbcTypes ibcConnectionParams =
      IbcTypes._("/ibc.core.connection.v1.Params");
  static const IbcTypes ibcConnectionMsgUpdateParams =
      IbcTypes._("/ibc.core.connection.v1.MsgUpdateParams");
  static const IbcTypes ibcConnectionMsgUpdateParamsResponse =
      IbcTypes._("/ibc.core.connection.v1.MsgUpdateParamsResponse");
  static const IbcTypes ibcConnectionQueryConnectionRequest = IbcTypes._(
      "/ibc.core.connection.v1.QueryConnectionRequest",
      query: "/ibc.core.connection.v1.Query/Connection",
      rpc: "/ibc/core/connection/v1/connections/:connection_id");
  static const IbcTypes ibcConnectionQueryConnectionResponse =
      IbcTypes._("/ibc.core.connection.v1.QueryConnectionResponse");
  static const IbcTypes ibcConnectionQueryConnectionsRequest = IbcTypes._(
      "/ibc.core.connection.v1.QueryConnectionsRequest",
      query: "/ibc.core.connection.v1.Query/Connections",
      rpc: "/ibc/core/connection/v1/connections");
  static const IbcTypes ibcConnectionQueryConnectionsResponse =
      IbcTypes._("/ibc.core.connection.v1.QueryConnectionsResponse");
  static const IbcTypes ibcConnectionQueryClientConnectionsRequest = IbcTypes._(
      "/ibc.core.connection.v1.QueryClientConnectionsRequest",
      query: "/ibc.core.connection.v1.Query/ClientConnections",
      rpc: "/ibc/core/connection/v1/client_connections/:client_id");
  static const IbcTypes ibcConnectionQueryClientConnectionsResponse =
      IbcTypes._("/ibc.core.connection.v1.QueryClientConnectionsResponse");
  static const IbcTypes ibcConnectionQueryConnectionClientStateRequest =
      IbcTypes._("/ibc.core.connection.v1.QueryConnectionClientStateRequest",
          query: "/ibc.core.connection.v1.Query/ConnectionClientState",
          rpc:
              "/ibc/core/connection/v1/connections/:connection_id/client_state");
  static const IbcTypes ibcConnectionQueryConnectionClientStateResponse =
      IbcTypes._("/ibc.core.connection.v1.QueryConnectionClientStateResponse");
  static const IbcTypes ibcConnectionQueryConnectionConsensusStateRequest =
      IbcTypes._("/ibc.core.connection.v1.QueryConnectionConsensusStateRequest",
          query: "/ibc.core.connection.v1.Query/ConnectionConsensusState",
          rpc:
              "/ibc/core/connection/v1/connections/:connection_id/consensus_state/revision/:revision_number/height/:revision_height");
  static const IbcTypes ibcConnectionQueryConnectionConsensusStateResponse =
      IbcTypes._(
          "/ibc.core.connection.v1.QueryConnectionConsensusStateResponse");
  static const IbcTypes ibcConnectionQueryConnectionParamsRequest = IbcTypes._(
      "/ibc.core.connection.v1.QueryConnectionParamsRequest",
      query: "/ibc.core.connection.v1.Query/ConnectionParams",
      rpc: "/ibc/core/connection/v1/params");
  static const IbcTypes ibcConnectionQueryConnectionParamsResponse =
      IbcTypes._("/ibc.core.connection.v1.QueryConnectionParamsResponse");
  static const IbcTypes ibcConnectionGenesisState =
      IbcTypes._("/ibc.core.connection.v1.GenesisState");

  /// ibc.core.types.v1
  static const IbcTypes ibcTypeGenesisState =
      IbcTypes._("/ibc.core.types.v1.GenesisState");

  /// ibc.lightclients.localhost.v2
  static const IbcTypes ibcLightClientsClientState =
      IbcTypes._("/ibc.lightclients.localhost.v2.ClientState");

  /// ibc.lightclients.localhost.v2
  static const IbcTypes soloMachineV2ChannelStateData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.ChannelStateData");
  static const IbcTypes soloMachineV2ConsensusState =
      IbcTypes._("/ibc.lightclients.solomachine.v2.ConsensusState");
  static const IbcTypes soloMachineV2ConsensusStateData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.ConsensusStateData");
  static const IbcTypes soloMachineV2Header =
      IbcTypes._("/ibc.lightclients.solomachine.v2.Header");
  static const IbcTypes soloMachineV2HeaderData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.HeaderData");
  static const IbcTypes soloMachineV2SignatureAndData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.SignatureAndData");
  static const IbcTypes soloMachineV2SignBytes =
      IbcTypes._("/ibc.lightclients.solomachine.v2.SignBytes");
  static const IbcTypes soloMachineV2TimestampedSignatureData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.TimestampedSignatureData");
  static const IbcTypes soloMachineV2ClientState =
      IbcTypes._("/ibc.lightclients.solomachine.v2.ClientState");
  static const IbcTypes soloMachineV2ClientStateData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.ClientStateData");
  static const IbcTypes soloMachineV2ConnectionStateData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.ConnectionStateData");
  static const IbcTypes soloMachineV2NextSequenceRecvData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.NextSequenceRecvData");
  static const IbcTypes soloMachineV2PacketAcknowledgementData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.PacketAcknowledgementData");
  static const IbcTypes soloMachineV2PacketCommitmentData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.PacketCommitmentData");
  static const IbcTypes soloMachineV2PacketReceiptAbsenceData =
      IbcTypes._("/ibc.lightclients.solomachine.v2.PacketReceiptAbsenceData");
  static const IbcTypes soloMachineV2Misbehaviour =
      IbcTypes._("/ibc.lightclients.solomachine.v2.Misbehaviour");

  /// ibc.lightclients.solomachine.v3
  static const IbcTypes soloMachineV3ConsensusState =
      IbcTypes._("/ibc.lightclients.solomachine.v3.ConsensusState");
  static const IbcTypes soloMachineV3ClientState =
      IbcTypes._("/ibc.lightclients.solomachine.v3.ClientState");
  static const IbcTypes soloMachineV3Header =
      IbcTypes._("/ibc.lightclients.solomachine.v3.Header");
  static const IbcTypes soloMachineV3HeaderData =
      IbcTypes._("/ibc.lightclients.solomachine.v3.HeaderData");
  static const IbcTypes soloMachineV3SignatureAndData =
      IbcTypes._("/ibc.lightclients.solomachine.v3.SignatureAndData");
  static const IbcTypes soloMachineV3SignBytes =
      IbcTypes._("/ibc.lightclients.solomachine.v3.SignBytes");
  static const IbcTypes soloMachineV3TimestampedSignatureData =
      IbcTypes._("/ibc.lightclients.solomachine.v3.TimestampedSignatureData");
  static const IbcTypes soloMachineV3Misbehaviour =
      IbcTypes._("/ibc.lightclients.solomachine.v3.Misbehaviour");

  /// ibc.lightclients.tendermint.v1
  static const IbcTypes ibcTendermintV1Fraction =
      IbcTypes._("/ibc.lightclients.tendermint.v1.Fraction");
  static const IbcTypes ibcTendermintV1ClientState =
      IbcTypes._("/ibc.lightclients.tendermint.v1.ClientState");
  static const IbcTypes ibcTendermintV1ConsensusState =
      IbcTypes._("/ibc.lightclients.tendermint.v1.ConsensusState");
  static const IbcTypes ibcTendermintV1Header =
      IbcTypes._("/ibc.lightclients.tendermint.v1.Header");
  static const IbcTypes ibcTendermintV1Misbehaviour =
      IbcTypes._("/ibc.lightclients.tendermint.v1.Misbehaviour");

  /// ibc.lightclients.wasm.v1
  static const IbcTypes ibcLightClientsWasmMsgStoreCode =
      IbcTypes._("/ibc.lightclients.wasm.v1.MsgStoreCode");
  static const IbcTypes ibcLightClientsWasmMsgStoreCodeResponse =
      IbcTypes._("/ibc.lightclients.wasm.v1.MsgStoreCodeResponse");
  static const IbcTypes ibcLightClientsWasmMsgRemoveChecksum =
      IbcTypes._("/ibc.lightclients.wasm.v1.MsgRemoveChecksum");
  static const IbcTypes ibcLightClientsWasmMsgRemoveChecksumResponse =
      IbcTypes._("/ibc.lightclients.wasm.v1.MsgRemoveChecksumResponse");
  static const IbcTypes ibcLightClientsWasmMsgMigrateContract =
      IbcTypes._("/ibc.lightclients.wasm.v1.MsgMigrateContract");
  static const IbcTypes ibcLightClientsWasmMsgMigrateContractResponse =
      IbcTypes._("/ibc.lightclients.wasm.v1.MsgMigrateContractResponse");
  static const IbcTypes ibcLightClientsWasmQueryChecksumsRequest = IbcTypes._(
      "/ibc.lightclients.wasm.v1.QueryChecksumsRequest",
      query: "/ibc.lightclients.wasm.v1.Query/Checksums",
      rpc: "/ibc/lightclients/wasm/v1/checksums");
  static const IbcTypes ibcLightClientsWasmQueryChecksumsResponse =
      IbcTypes._("/ibc.lightclients.wasm.v1.QueryChecksumsResponse");
  static const IbcTypes ibcLightClientsWasmQueryCodeRequest = IbcTypes._(
      "/ibc.lightclients.wasm.v1.QueryCodeRequest",
      query: "/ibc.lightclients.wasm.v1.Query/Code",
      rpc: "/ibc/lightclients/wasm/v1/checksums/:checksum/code");
  static const IbcTypes ibcLightClientsWasmQueryCodeResponse =
      IbcTypes._("/ibc.lightclients.wasm.v1.QueryCodeResponse");
  static const IbcTypes ibcLightClientsWasmClientMessage =
      IbcTypes._("/ibc.lightclients.wasm.v1.ClientMessage");
  static const IbcTypes ibcLightClientsWasmClientState =
      IbcTypes._("/ibc.lightclients.wasm.v1.ClientState");
  static const IbcTypes ibcLightClientsWasmConsensusState =
      IbcTypes._("/ibc.lightclients.wasm.v1.ConsensusState");
  static const IbcTypes ibcLightClientsWasmContract =
      IbcTypes._("/ibc.lightclients.wasm.v1.Contract");
  static const IbcTypes ibcLightClientsWasmGenesisState =
      IbcTypes._("/ibc.lightclients.wasm.v1.GenesisState");

  // channel v2
  static const IbcTypes channelV2MsgSendPacket =
      IbcTypes._("/ibc.core.channel.v2.MsgSendPacket");
  static const IbcTypes channelV2MsgSendPacketResponse =
      IbcTypes._("/ibc.core.channel.v2.MsgSendPacketResponse");

  static const IbcTypes channelV2Payload =
      IbcTypes._("/ibc.core.channel.v2.Payload");

  static const IbcTypes channelV2Packet =
      IbcTypes._("/ibc.core.channel.v2.Packet");
  static const IbcTypes channelV2MsgRecvPacket =
      IbcTypes._("/ibc.core.channel.v2.MsgRecvPacket");
  static const IbcTypes channelV2MsgRecvPacketResponse =
      IbcTypes._("/ibc.core.channel.v2.MsgRecvPacketResponse");
  static const IbcTypes channelV2MsgTimeout =
      IbcTypes._("/ibc.core.channel.v2.MsgTimeout");
  static const IbcTypes channelV2MsgTimeoutResponse =
      IbcTypes._("/ibc.core.channel.v2.MsgTimeoutResponse");

  static const IbcTypes channelV2Acknowledgement =
      IbcTypes._("/ibc.core.channel.v2.Acknowledgement");

  static const IbcTypes channelV2MsgAcknowledgement =
      IbcTypes._("/ibc.core.channel.v2.MsgAcknowledgement");
  static const IbcTypes channelV2MsgAcknowledgementResponse =
      IbcTypes._("/ibc.core.channel.v2.MsgAcknowledgementResponse");

  static const IbcTypes channelV2QueryNextSequenceSendResponse =
      IbcTypes._("/ibc.core.channel.v2.QueryNextSequenceSendResponse");
  static const IbcTypes channelV2QueryPacketCommitmentResponse =
      IbcTypes._("/ibc.core.channel.v2.QueryPacketCommitmentResponse");
  static const IbcTypes channelV2PacketState =
      IbcTypes._("/ibc.core.channel.v2.PacketState");
  static const IbcTypes channelV2QueryPacketCommitmentsResponse =
      IbcTypes._("/ibc.core.channel.v2.QueryPacketCommitmentsResponse");
  static const IbcTypes channelV2QueryPacketAcknowledgementResponse =
      IbcTypes._("/ibc.core.channel.v2.QueryPacketAcknowledgementResponse");
  static const IbcTypes channelV2QueryPacketAcknowledgementsResponse =
      IbcTypes._("/ibc.core.channel.v2.QueryPacketAcknowledgementsResponse");
  static const IbcTypes channelV2QueryPacketReceiptResponse =
      IbcTypes._("/ibc.core.channel.v2.QueryPacketReceiptResponse");
  static const IbcTypes channelV2QueryUnreceivedPacketsResponse =
      IbcTypes._("/ibc.core.channel.v2.QueryUnreceivedPacketsResponse");
  static const IbcTypes channelV2QueryUnreceivedAcksResponse =
      IbcTypes._("/ibc.core.channel.v2.QueryUnreceivedAcksResponse");
  static const IbcTypes channelV2QueryNextSequenceSend = IbcTypes._(
      "/ibc.core.channel.v2.QueryNextSequenceSendRequest",
      query: "/ibc.core.channel.v2.Query/NextSequenceSend",
      rpc: "/ibc/core/channel/v2/clients/:client_id/next_sequence_send");

  static const IbcTypes channelV2QueryPacketCommitment = IbcTypes._(
      "/ibc.core.channel.v2.QueryPacketCommitmentRequest",
      query: "/ibc.core.channel.v2.Query/PacketCommitment",
      rpc:
          "/ibc/core/channel/v2/clients/:client_id/packet_commitments/:sequence");

  static const IbcTypes channelV2QueryPacketCommitments = IbcTypes._(
      "/ibc.core.channel.v2.QueryPacketCommitmentsRequest",
      query: "/ibc.core.channel.v2.Query/PacketCommitments",
      rpc: "/ibc/core/channel/v2/clients/{client_id}/packet_commitments");

  static const IbcTypes channelV2QueryPacketAcknowledgementRequest = IbcTypes._(
      "/ibc.core.channel.v2.QueryPacketAcknowledgementRequest",
      query: "/ibc.core.channel.v2.Query/PacketAcknowledgement",
      rpc: "/ibc/core/channel/v2/clients/:client_id/packet_acks/:sequence");

  static const IbcTypes channelV2QueryPacketAcknowledgements = IbcTypes._(
      "/ibc.core.channel.v2.QueryPacketAcknowledgementsRequest",
      query: "/ibc.core.channel.v2.Query/PacketAcknowledgements",
      rpc: "/ibc/core/channel/v2/clients/:client_id/packet_acknowledgements");
  static const IbcTypes channelV2QueryPacketReceipt = IbcTypes._(
      "/ibc.core.channel.v2.QueryPacketReceiptRequest",
      query: "/ibc.core.channel.v2.Query/PacketReceipt",
      rpc: "/ibc/core/channel/v2/clients/:client_id/packet_receipts/:sequence");
  static const IbcTypes channelV2QueryUnreceivedPacketsRequest = IbcTypes._(
      "/ibc.core.channel.v2.QueryUnreceivedPacketsRequest",
      query: "/ibc.core.channel.v2.Query/UnreceivedPackets",
      rpc:
          "/ibc/core/channel/v2/clients/:client_id/packet_commitments/:sequences/unreceived_packets");
  static const IbcTypes channelV2QueryUnreceivedAcksRequest = IbcTypes._(
      "/ibc.core.channel.v2.QueryUnreceivedAcksRequest",
      query: "/ibc.core.channel.v2.Query/UnreceivedAcks",
      rpc:
          "/ibc/core/channel/v2/clients/:client_id/packet_commitments/:packet_ack_sequences/unreceived_acks");

  /// client v2
  static const IbcTypes ibClientV2CounterpartyInfo =
      IbcTypes._("/ibc.core.client.v2.CounterpartyInfo");
  static const IbcTypes ibClientV2GenesisCounterpartyInfo =
      IbcTypes._("/ibc.core.client.v2.GenesisCounterpartyInfo");
  static const IbcTypes ibClientV2GenesisState =
      IbcTypes._("/ibc.core.client.v2.GenesisState");

  static const IbcTypes ibClientV2MsgRegisterCounterparty =
      IbcTypes._("/ibc.core.client.v2.MsgRegisterCounterparty");
  static const IbcTypes ibClientV2MsgRegisterCounterpartyResponse =
      IbcTypes._("/ibc.core.client.v2.MsgRegisterCounterpartyResponse");
  static const IbcTypes clientV2QueryCounterpartyInfoRequest = IbcTypes._(
      "/ibc.core.client.v2.QueryCounterpartyInfoRequest",
      query: "/ibc.core.channel.v2.Query/CounterpartyInfo",
      rpc: "/ibc/core/client/v2/counterparty_info/:client_id");
  static const IbcTypes ibClientV2QueryCounterpartyInfoResponse =
      IbcTypes._("/ibc.core.client.v2.QueryCounterpartyInfoResponse");
  static const List<IbcTypes> services = [
    msgPayPacketFeeAsync,
    msgPayPacketFee,
    msgRegisterCounterpartyPayee,
    msgRegisterPayee,
    msgRegisterInterchainAccount,
    msgSendTx,
    interchainAccountsControllerMsgUpdateParams,
    interchainAccountsHostMsgModuleQuerySafe,
    interchainAccountsHostMsgUpdateParams,
    msgTransfer,
    ibcTransfermsgUpdateParams,
    msgAcknowledgement,
    msgChannelCloseConfirm,
    msgChannelCloseInit,
    msgChannelOpenAck,
    msgChannelOpenConfirm,
    msgChannelOpenInit,
    msgChannelOpenTry,
    msgChannelUpgradeAck,
    msgChannelUpgradeCancel,
    msgChannelUpgradeConfirm,
    msgChannelUpgradeInit,
    msgChannelUpgradeOpen,
    msgChannelUpgradeTimeout,
    msgChannelUpgradeTry,
    msgPruneAcknowledgements,
    msgRecvPacket,
    msgTimeoutOnClose,
    msgTimeout,
    ibcChannelmsgUpdateParams,
    channelV2MsgAcknowledgement,
    channelV2MsgRecvPacket,
    channelV2MsgSendPacket,
    channelV2MsgTimeout,
    msgCreateClient,
    msgIBCSoftwareUpgrade,
    msgRecoverClient,
    msgUpdateClient,
    msgUpdateParams,
    msgUpgradeClient,
    ibClientV2MsgRegisterCounterparty,
    msgConnectionOpenAck,
    msgConnectionOpenConfirmResponse,
    msgConnectionOpenInit,
    msgConnectionOpenTry,
    ibcConnectionMsgUpdateParams,
    ibcLightClientsWasmMsgMigrateContract,
    ibcLightClientsWasmMsgRemoveChecksum,
    ibcLightClientsWasmMsgStoreCode
  ];
  static IbcTypes? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
