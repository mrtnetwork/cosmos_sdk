import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class Ics23ProofBase extends CosmosMessage {
  abstract final int commitmentId;
  const Ics23ProofBase();
}
