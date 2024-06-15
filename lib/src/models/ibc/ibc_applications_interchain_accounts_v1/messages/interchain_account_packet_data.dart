import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_v1/messages/type.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class InterchainAccountPacketData extends CosmosMessage {
  final InterchainAccountType? type;
  final List<int>? data;
  final String? memo;
  InterchainAccountPacketData({this.type, List<int>? data, this.memo})
      : data = BytesUtils.tryToBytes(data);
  factory InterchainAccountPacketData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return InterchainAccountPacketData(
        type: decode.getResult(1)?.to<InterchainAccountType, int>(
            (e) => InterchainAccountType.fromValue(e)),
        data: decode.getField(2),
        memo: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type?.value,
      "data": BytesUtils.tryToHexString(data),
      "memo": memo
    };
  }

  @override
  String get typeUrl => IbcTypes.interchainAccountPacketData.typeUrl;

  @override
  List get values => [type?.value, data, memo];
}
