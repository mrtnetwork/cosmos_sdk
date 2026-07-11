import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class AddressUnbonding extends CosmosProtoMessage {
  final String? address;

  final String? receiver;

  final String? unbondingEstimatedTime;

  final String? amount;

  final String? denom;

  final bool? claimIsPending;

  final BigInt? epochNumber;

  const AddressUnbonding({
    this.address,
    this.receiver,
    this.unbondingEstimatedTime,
    this.amount,
    this.denom,
    this.claimIsPending,
    this.epochNumber,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.bool(8),
        ProtoFieldConfig.uint64(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    receiver,
    unbondingEstimatedTime,
    amount,
    denom,
    claimIsPending,
    epochNumber,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'receiver': receiver,
      'unbonding_estimated_time': unbondingEstimatedTime,
      'amount': amount,
      'denom': denom,
      'claim_is_pending': claimIsPending,
      'epoch_number': epochNumber?.toString(),
    };
  }

  factory AddressUnbonding.fromJson(Map<String, dynamic> json) {
    return AddressUnbonding(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      receiver: json.valueAsString<String?>('receiver', acceptCamelCase: true),
      unbondingEstimatedTime: json.valueAsString<String?>(
        'unbonding_estimated_time',
        acceptCamelCase: true,
      ),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      claimIsPending: json.valueAsBool<bool?>(
        'claim_is_pending',
        acceptCamelCase: true,
      ),
      epochNumber: json.valueAsBigInt<BigInt?>(
        'epoch_number',
        acceptCamelCase: true,
      ),
    );
  }

  factory AddressUnbonding.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AddressUnbonding(
      address: decode.getString<String?>(1),
      receiver: decode.getString<String?>(2),
      unbondingEstimatedTime: decode.getString<String?>(3),
      amount: decode.getString<String?>(4),
      denom: decode.getString<String?>(5),
      claimIsPending: decode.getBool<bool?>(8),
      epochNumber: decode.getBigInt<BigInt?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcAddressUnbonding;
}
