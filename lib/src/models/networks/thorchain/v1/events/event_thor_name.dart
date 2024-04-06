import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventTHORName extends CosmosMessage {
  final String? name;
  final String? chain;
  final String? address;
  final BigInt registrationFee;
  final BigInt fundAmt;
  final BigInt? expire;
  final List<int>? owner;
  ThorchainEventTHORName(
      {this.name,
      this.chain,
      this.address,
      required this.registrationFee,
      required this.fundAmt,
      this.expire,
      List<int>? owner})
      : owner = BytesUtils.tryToBytes(owner, unmodifiable: true);
  factory ThorchainEventTHORName.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventTHORName(
        name: decode.getField(1),
        chain: decode.getField(2),
        address: decode.getField(3),
        registrationFee: BigInt.parse(decode.getField(4)),
        fundAmt: BigInt.parse(decode.getField(5)),
        expire: decode.getField(6),
        owner: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "chain": chain,
      "address": address,
      "registration_fee": registrationFee.toString(),
      "fund_amt": fundAmt.toString(),
      "expire": expire?.toString(),
      "owner": BytesUtils.tryToHexString(owner)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventTHORName.typeUrl;

  @override
  List get values => [
        name,
        chain,
        address,
        registrationFee.toString(),
        fundAmt.toString(),
        expire,
        owner
      ];
}
