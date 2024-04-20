import 'package:blockchain_utils/bip/slip/slip173/slip173.dart';

// This class defines constants related to Cosmos addresses.
class CosmosAddrConst {
  // Human Readable Part (HRP) for account addresses.
  static const String accHRP = Slip173.cosmos;

  // Human Readable Part (HRP) for validator addresses.
  static const String validatorHRP = "cosmosvaloper";

  // Human Readable Part (HRP) for consensus node addresses.
  static const String consensusHRP = "cosmosvalcons";

  // Human Readable Part (HRP) for maya protocol account addresses.
  static const String mayaProtocol = "maya";

  // Human Readable Part (HRP) for thor account addresses.
  static const String thor = "thor";

  static const String kujira = "kujira";
}
