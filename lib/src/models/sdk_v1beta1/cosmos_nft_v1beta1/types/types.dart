import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class NFTV1beta1Types extends TypeUrl {
  const NFTV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/cosmos.nft.v1beta1";
  static const NFTV1beta1Types msgNFTSend = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.MsgSend",
  );
  static const NFTV1beta1Types msgNFTSendResponse = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.MsgSendResponse",
  );
  static const NFTV1beta1Types nFTClass = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.Class",
  );
  static const NFTV1beta1Types nFT = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.NFT",
  );
  static const NFTV1beta1Types entry = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.Entry",
  );
  static const NFTV1beta1Types eventBurn = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.EventBurn",
  );
  static const NFTV1beta1Types eventMint = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.EventMint",
  );
  static const NFTV1beta1Types eventSend = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.EventSend",
  );
  static const NFTV1beta1Types nFTGenesisState = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.GenesisState",
  );
  static const NFTV1beta1Types queryNFTBalanceRequest = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryBalanceRequest",
    query: "/cosmos.nft.v1beta1.Query/Balance",
    rpc: "/cosmos/nft/v1beta1/balance/:owner/:class_id",
  );
  static const NFTV1beta1Types queryNFTBalanceResponse = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryBalanceResponse",
  );
  static const NFTV1beta1Types queryNFTBalanceByQueryStringRequest =
      NFTV1beta1Types._(
        "/cosmos.nft.v1beta1.QueryBalanceByQueryStringRequest",
        query: "/cosmos.nft.v1beta1.Query/BalanceByQueryString",
        rpc: "/cosmos/nft/v1beta1/balance",
      );
  static const NFTV1beta1Types queryNFTBalanceByQueryStringResponse =
      NFTV1beta1Types._(
        "/cosmos.nft.v1beta1.QueryBalanceByQueryStringResponse",
      );
  static const NFTV1beta1Types queryNFTOwnerRequest = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryOwnerRequest",
    query: "/cosmos.nft.v1beta1.Query/Owner",
    rpc: "/cosmos/nft/v1beta1/owner/:class_id/:id",
  );
  static const NFTV1beta1Types queryNFTOwnerResponse = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryOwnerResponse",
  );
  static const NFTV1beta1Types queryNFTOwnerByQueryStringRequest =
      NFTV1beta1Types._(
        "/cosmos.nft.v1beta1.QueryOwnerByQueryStringRequest",
        query: "/cosmos.nft.v1beta1.Query/OwnerByQueryString",
        rpc: "/cosmos/nft/v1beta1/owner",
      );
  static const NFTV1beta1Types queryNFTOwnerByQueryStringResponse =
      NFTV1beta1Types._("/cosmos.nft.v1beta1.QueryOwnerByQueryStringResponse");
  static const NFTV1beta1Types queryNFTSupplyRequest = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QuerySupplyRequest",
    query: "/cosmos.nft.v1beta1.Query/Supply",
    rpc: "/cosmos/nft/v1beta1/supply/:class_id",
  );
  static const NFTV1beta1Types queryNFTSupplyResponse = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QuerySupplyResponse",
  );
  static const NFTV1beta1Types queryNFTSupplyByQueryStringRequest =
      NFTV1beta1Types._(
        "/cosmos.nft.v1beta1.QuerySupplyByQueryStringRequest",
        query: "/cosmos.nft.v1beta1.Query/SupplyByQueryString",
        rpc: "/cosmos/nft/v1beta1/supply",
      );
  static const NFTV1beta1Types queryNFTSupplyByQueryStringResponse =
      NFTV1beta1Types._("/cosmos.nft.v1beta1.QuerySupplyByQueryStringResponse");
  static const NFTV1beta1Types queryNFTsRequest = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryNFTsRequest",
    query: "/cosmos.nft.v1beta1.Query/NFTs",
    rpc: "/cosmos/nft/v1beta1/nfts",
  );
  static const NFTV1beta1Types queryNFTsResponse = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryNFTsResponse",
  );
  static const NFTV1beta1Types queryNFTRequest = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryNFTRequest",
    query: "/cosmos.nft.v1beta1.Query/NFT",
    rpc: "/cosmos/nft/v1beta1/nfts/:class_id/:id",
  );
  static const NFTV1beta1Types queryNFTResponse = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryNFTResponse",
  );
  static const NFTV1beta1Types queryNFTByQueryStringRequest = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryNFTByQueryStringRequest",
    query: "/cosmos.nft.v1beta1.Query/NFTByQueryString",
    rpc: "/cosmos/nft/v1beta1/nft",
  );
  static const NFTV1beta1Types queryNFTByQueryStringResponse =
      NFTV1beta1Types._("/cosmos.nft.v1beta1.QueryNFTByQueryStringResponse");
  static const NFTV1beta1Types queryNFTClassRequest = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryClassRequest",
    query: "/cosmos.nft.v1beta1.Query/Class",
    rpc: "/cosmos/nft/v1beta1/classes/:class_id",
  );
  static const NFTV1beta1Types queryNFTClassResponse = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryClassResponse",
  );
  static const NFTV1beta1Types queryNFTClassByQueryStringRequest =
      NFTV1beta1Types._(
        "/cosmos.nft.v1beta1.QueryClassByQueryStringRequest",
        query: "/cosmos.nft.v1beta1.Query/ClassByQueryString",
        rpc: "/cosmos/nft/v1beta1/class",
      );
  static const NFTV1beta1Types queryNFTClassByQueryStringResponse =
      NFTV1beta1Types._("/cosmos.nft.v1beta1.QueryClassByQueryStringResponse");
  static const NFTV1beta1Types queryNFTClassesRequest = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryClassesRequest",
    rpc: "/cosmos/nft/v1beta1/classes",
    query: "/cosmos.nft.v1beta1.Query/Classes",
  );
  static const NFTV1beta1Types queryNFTClassesResponse = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.QueryClassesResponse",
  );

  static const NFTV1beta1Types nftClasses = NFTV1beta1Types._(
    "/cosmos.nft.v1beta1.Query/Classes",
  );

  static const List<TypeUrl> services = [msgNFTSend];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
