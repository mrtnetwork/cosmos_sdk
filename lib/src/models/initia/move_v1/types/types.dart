import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class InitiaMoveV1Types extends TypeUrl {
  static const String basePath = "/initia.move.v1";
  const InitiaMoveV1Types._(super.typeUrl);

  static const InitiaMoveV1Types msgExecute =
      InitiaMoveV1Types._("/initia.move.v1.MsgExecute");

  static const InitiaMoveV1Types msgExecuteResponse =
      InitiaMoveV1Types._("/initia.move.v1.MsgExecuteResponse");
  static const List<InitiaMoveV1Types> values = [
    msgExecute,
  ];
  static InitiaMoveV1Types? findService(String? type, {bool amino = false}) {
    if (type == null) return null;
    if (amino) {
      return values.firstWhereNullable((e) => e.aminoType == type);
    }
    return values.firstWhereNullable((e) => e.typeUrl == type);
  }
}
