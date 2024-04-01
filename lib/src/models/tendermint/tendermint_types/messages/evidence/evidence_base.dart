import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

abstract class BaseEvidence extends CosmosMessage {
  const BaseEvidence();
  abstract final int id;
}
