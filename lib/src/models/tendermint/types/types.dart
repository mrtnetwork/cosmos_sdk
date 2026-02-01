import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class TendermintTypes extends TypeUrl {
  const TendermintTypes._(super.typeUrl);
  static const TendermintTypes partSetHeader = TendermintTypes._(
    "/tendermint.types.PartSetHeader",
  );
  static const TendermintTypes blockID = TendermintTypes._(
    "/tendermint.types.BlockID",
  );
  static const TendermintTypes header = TendermintTypes._(
    "/tendermint.types.Header",
  );
  static const TendermintTypes data = TendermintTypes._(
    "/tendermint.types.Data",
  );
  static const TendermintTypes evidenceParams = TendermintTypes._(
    "/tendermint.types.EvidenceParams",
  );
  static const TendermintTypes vote = TendermintTypes._(
    "/tendermint.types.Vote",
  );
  static const TendermintTypes duplicateVoteEvidence = TendermintTypes._(
    "/tendermint.types.DuplicateVoteEvidence",
  );
  static const TendermintTypes eventDataRoundState = TendermintTypes._(
    "/tendermint.types.EventDataRoundState",
  );
  static const TendermintTypes commitSig = TendermintTypes._(
    "/tendermint.types.CommitSig",
  );
  static const TendermintTypes abciParams = TendermintTypes._(
    "/tendermint.types.ABCIParams",
  );
  static const TendermintTypes commit = TendermintTypes._(
    "/tendermint.types.Commit",
  );
  static const TendermintTypes tendermintValidator = TendermintTypes._(
    "/tendermint.types.Validator",
  );
  static const TendermintTypes tendermintValidatorParams = TendermintTypes._(
    "/tendermint.types.ValidatorParams",
  );
  static const TendermintTypes tendermintValidatorSet = TendermintTypes._(
    "/tendermint.types.ValidatorSet",
  );
  static const TendermintTypes tendermintVersionParams = TendermintTypes._(
    "/tendermint.types.VersionParams",
  );
  static const TendermintTypes tendermintSignedHeader = TendermintTypes._(
    "/tendermint.types.SignedHeader",
  );
  static const TendermintTypes lightBlock = TendermintTypes._(
    "/tendermint.types.LightBlock",
  );
  static const TendermintTypes lightClientAttackEvidence = TendermintTypes._(
    "/tendermint.types.LightClientAttackEvidence",
  );
  static const TendermintTypes tendermintPart = TendermintTypes._(
    "/tendermint.types.Part",
  );
  static const TendermintTypes proposal = TendermintTypes._(
    "/tendermint.types.Proposal",
  );
  static const TendermintTypes simpleValidator = TendermintTypes._(
    "/tendermint.types.SimpleValidator",
  );
  static const TendermintTypes txProof = TendermintTypes._(
    "/tendermint.types.TxProof",
  );
  static const TendermintTypes blockMeta = TendermintTypes._(
    "/tendermint.types.BlockMeta",
  );
  static const TendermintTypes blockParams = TendermintTypes._(
    "/tendermint.types.BlockParams",
  );
  static const TendermintTypes canonicalPartSetHeader = TendermintTypes._(
    "/tendermint.types.CanonicalPartSetHeader",
  );
  static const TendermintTypes canonicalBlockID = TendermintTypes._(
    "/tendermint.types.CanonicalBlockID",
  );
  static const TendermintTypes canonicalProposal = TendermintTypes._(
    "/tendermint.types.CanonicalProposal",
  );
  static const TendermintTypes canonicalVote = TendermintTypes._(
    "/tendermint.types.CanonicalVote",
  );
  static const TendermintTypes canonicalVoteExtension = TendermintTypes._(
    "/tendermint.types.CanonicalVoteExtension",
  );
  static const TendermintTypes evidence = TendermintTypes._(
    "/tendermint.types.Evidence",
  );
  static const TendermintTypes evidenceList = TendermintTypes._(
    "/tendermint.types.EvidenceList",
  );
  static const TendermintTypes extendedCommitSig = TendermintTypes._(
    "/tendermint.types.ExtendedCommitSig",
  );
  static const TendermintTypes extendedCommit = TendermintTypes._(
    "/tendermint.types.ExtendedCommit",
  );
  static const TendermintTypes hashedParams = TendermintTypes._(
    "/tendermint.types.HashedParams",
  );
  static const TendermintTypes block = TendermintTypes._(
    "/tendermint.types.Block",
  );

  /// tendermint.crypto
  static const TendermintTypes dominoOp = TendermintTypes._(
    "/tendermint.crypto.DominoOp",
  );
  static const TendermintTypes proof = TendermintTypes._(
    "/tendermint.crypto.Proof",
  );
  static const TendermintTypes proofOp = TendermintTypes._(
    "/tendermint.crypto.ProofOp",
  );
  static const TendermintTypes proofOps = TendermintTypes._(
    "/tendermint.crypto.ProofOps",
  );
  static const TendermintTypes publicKey = TendermintTypes._(
    "/tendermint.crypto.PublicKey",
  );
  static const TendermintTypes valueOp = TendermintTypes._(
    "/tendermint.crypto.ValueOp",
  );

  /// tendermint.abci
  static const TendermintTypes eventAttribute = TendermintTypes._(
    "/tendermint.abci.EventAttribute",
  );
  static const TendermintTypes event = TendermintTypes._(
    "/tendermint.abci.Event",
  );

  /// tendermint.version
  static const TendermintTypes app = TendermintTypes._(
    "/tendermint.version.App",
  );
  static const TendermintTypes consensus = TendermintTypes._(
    "/tendermint.version.Consensus",
  );

  static const TendermintTypes authSigMessage = TendermintTypes._(
    "/tendermint.p2p.AuthSigMessage",
  );
  static const TendermintTypes protocolVersion = TendermintTypes._(
    "/tendermint.p2p.ProtocolVersion",
  );
  static const TendermintTypes defaultNodeInfoOther = TendermintTypes._(
    "/tendermint.p2p.DefaultNodeInfoOther",
  );
  static const TendermintTypes defaultNodeInfo = TendermintTypes._(
    "/tendermint.p2p.DefaultNodeInfo",
  );
  static const TendermintTypes netAddress = TendermintTypes._(
    "/tendermint.p2p.NetAddress",
  );
  static const TendermintTypes packetMsg = TendermintTypes._(
    "/tendermint.p2p.PacketMsg",
  );
  static const TendermintTypes packetPing = TendermintTypes._(
    "/tendermint.p2p.PacketPing",
  );
  static const TendermintTypes packetPong = TendermintTypes._(
    "/tendermint.p2p.PacketPong",
  );
  static const TendermintTypes pexRequest = TendermintTypes._(
    "/tendermint.p2p.PexRequest",
  );
  static const TendermintTypes pexAddrs = TendermintTypes._(
    "/tendermint.p2p.PexAddrs",
  );
  static const TendermintTypes packet = TendermintTypes._(
    "/tendermint.p2p.Packet",
  );
  static const TendermintTypes message = TendermintTypes._(
    "/tendermint.p2p.Message",
  );
}
