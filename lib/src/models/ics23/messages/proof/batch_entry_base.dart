import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'base_proof.dart';

abstract class Ics23BatchEntryBase extends Ics23ProofBase {
  abstract final int id;
  const Ics23BatchEntryBase();
}

abstract class Ics23CompressedBatchEntryBase extends CosmosMessage {
  abstract final int id;
  const Ics23CompressedBatchEntryBase();
}
