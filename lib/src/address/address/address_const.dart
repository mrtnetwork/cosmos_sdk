import 'package:blockchain_utils/bip/slip/slip173/slip173.dart';

// This class defines constants related to Cosmos addresses.
class CosmosAddrConst {
  // Human Readable Part (HRP) for account addresses.
  static const String accHRP = Slip173.cosmos;

  // Human Readable Part (HRP) for validator addresses.
  static const String validatorHRP = "cosmosvaloper";

  // Human Readable Part (HRP) for consensus node addresses.
  static const String consensusHRP = "cosmosvalcons";
}
