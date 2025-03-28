import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OpInitOpHostV1Types extends TypeUrl {
  const OpInitOpHostV1Types._(super.typeUrl, {super.aminoType});

  static const OpInitOpHostV1Types msgInitiateTokenDeposit =
      OpInitOpHostV1Types._("/opinit.ophost.v1.MsgInitiateTokenDeposit",
          aminoType: "ophost/MsgInitiateTokenDeposit");

  static const OpInitOpHostV1Types msgInitiateTokenDepositResponse =
      OpInitOpHostV1Types._(
          "/opinit.ophost.v1.MsgInitiateTokenDepositResponse");
  static const List<OpInitOpHostV1Types> values = [msgInitiateTokenDeposit];
  static OpInitOpHostV1Types? findService(String? type, {bool amino = false}) {
    if (type == null) return null;
    if (amino) {
      return values.firstWhereNullable((e) => e.aminoType == type);
    }
    return values.firstWhereNullable((e) => e.typeUrl == type);
  }
}
