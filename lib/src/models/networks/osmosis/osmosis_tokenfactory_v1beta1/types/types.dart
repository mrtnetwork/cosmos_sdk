import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisTokenFactoryV1beta1Types extends TypeUrl {
  const OsmosisTokenFactoryV1beta1Types._(super.typeUrl,
      {super.query, super.rpc});

  static const OsmosisTokenFactoryV1beta1Types params =
      OsmosisTokenFactoryV1beta1Types._("/osmosis.tokenfactory.v1beta1.Params");

  static const OsmosisTokenFactoryV1beta1Types denomAuthorityMetadata =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.DenomAuthorityMetadata");

  static const OsmosisTokenFactoryV1beta1Types genesisDenom =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.GenesisDenom");
  static const OsmosisTokenFactoryV1beta1Types genesisState =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.GenesisState");

  static const OsmosisTokenFactoryV1beta1Types msgCreateDenom =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgCreateDenom");
  static const OsmosisTokenFactoryV1beta1Types msgCreateDenomResponse =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgCreateDenomResponse");

  static const OsmosisTokenFactoryV1beta1Types msgMint =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgMint");
  static const OsmosisTokenFactoryV1beta1Types msgMintResponse =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgMintResponse");

  static const OsmosisTokenFactoryV1beta1Types msgBurn =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgBurn");
  static const OsmosisTokenFactoryV1beta1Types msgBurnResponse =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgBurnResponse");

  static const OsmosisTokenFactoryV1beta1Types msgChangeAdmin =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgChangeAdmin");
  static const OsmosisTokenFactoryV1beta1Types msgChangeAdminResponse =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgChangeAdminResponse");

  static const OsmosisTokenFactoryV1beta1Types msgSetDenomMetadata =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgSetDenomMetadata");
  static const OsmosisTokenFactoryV1beta1Types msgSetDenomMetadataResponse =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.MsgSetDenomMetadataResponse");

  static const OsmosisTokenFactoryV1beta1Types queryParamsRequest =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.QueryParamsRequest",
          query: "/osmosis.tokenfactory.v1beta1.Query/Params",
          rpc: "/osmosis/tokenfactory/v1beta1/params");
  static const OsmosisTokenFactoryV1beta1Types queryParamsResponse =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.QueryParamsResponse");

  static const OsmosisTokenFactoryV1beta1Types
      queryDenomAuthorityMetadataRequest = OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.QueryDenomAuthorityMetadataRequest",
          query: "/osmosis.tokenfactory.v1beta1.Query/DenomAuthorityMetadata",
          rpc:
              "/osmosis/tokenfactory/v1beta1/denoms/:denom/authority_metadata");
  static const OsmosisTokenFactoryV1beta1Types
      queryDenomAuthorityMetadataResponse = OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.QueryDenomAuthorityMetadataResponse");

  static const OsmosisTokenFactoryV1beta1Types queryDenomsFromCreatorRequest =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.QueryDenomsFromCreatorRequest",
          query: "/osmosis.tokenfactory.v1beta1.Query/DenomsFromCreator",
          rpc: "/osmosis/tokenfactory/v1beta1/denoms_from_creator/:creator");
  static const OsmosisTokenFactoryV1beta1Types queryDenomsFromCreatorResponse =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.QueryDenomsFromCreatorResponse");

  /// services

  static const OsmosisTokenFactoryV1beta1Types setDenomMetadata =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.Msg/SetDenomMetadata");
  static const OsmosisTokenFactoryV1beta1Types changeAdmin =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.Msg/ChangeAdmin");
  static const OsmosisTokenFactoryV1beta1Types burn =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.Msg/Burn");
  static const OsmosisTokenFactoryV1beta1Types mint =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.Msg/Mint");
  static const OsmosisTokenFactoryV1beta1Types createDenom =
      OsmosisTokenFactoryV1beta1Types._(
          "/osmosis.tokenfactory.v1beta1.Msg/CreateDenom");
}
