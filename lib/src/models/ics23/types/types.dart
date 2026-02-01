import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class Ics23Types extends TypeUrl {
  const Ics23Types._(super.typeUrl);
  static const Ics23Types hashOp = Ics23Types._("cosmos.ics23.v1.HashOp");
  static const Ics23Types innerOp = Ics23Types._("cosmos.ics23.v1.InnerOp");
  static const Ics23Types innerSpec = Ics23Types._("cosmos.ics23.v1.InnerSpec");
  static const Ics23Types leafOp = Ics23Types._("cosmos.ics23.v1.LeafOp");
  static const Ics23Types proofSpec = Ics23Types._("cosmos.ics23.v1.ProofSpec");
  static const Ics23Types existenceProof = Ics23Types._(
    "cosmos.ics23.v1.ExistenceProof",
  );
  static const Ics23Types compressedExistenceProof = Ics23Types._(
    "cosmos.ics23.v1.CompressedExistenceProof",
  );
  static const Ics23Types nonExistenceProof = Ics23Types._(
    "cosmos.ics23.v1.NonExistenceProof",
  );
  static const Ics23Types batchEntry = Ics23Types._(
    "cosmos.ics23.v1.BatchEntry",
  );
  static const Ics23Types batchProof = Ics23Types._(
    "cosmos.ics23.v1.BatchProof",
  );
  static const Ics23Types compressedNonExistenceProof = Ics23Types._(
    "cosmos.ics23.v1.CompressedNonExistenceProof",
  );
  static const Ics23Types compressedBatchEntry = Ics23Types._(
    "cosmos.ics23.v1.CompressedBatchEntry",
  );
  static const Ics23Types compressedBatchProof = Ics23Types._(
    "cosmos.ics23.v1.CompressedBatchProof",
  );
  static const Ics23Types commitmentProof = Ics23Types._(
    "cosmos.ics23.v1.CommitmentProof",
  );
}
