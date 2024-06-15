import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainNodeTssTime extends CosmosMessage {
  final List<int>? address;
  final BigInt? tssTime;
  ThorchainNodeTssTime({List<int>? address, this.tssTime})
      : address = BytesUtils.tryToBytes(address, unmodifiable: true);
  factory ThorchainNodeTssTime.deserialized(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainNodeTssTime(
        address: decode.getField(1), tssTime: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": BytesUtils.tryToHexString(address),
      "tss_time": tssTime?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.nodeTssTime.typeUrl;

  @override
  List get values => [address, tssTime];
}
