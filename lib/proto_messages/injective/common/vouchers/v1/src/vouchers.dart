import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// AddressVoucher pairs a bech32 address with its outstanding voucher coin.
class AddressVoucher extends CosmosProtoMessage {
  /// The bech32 address of the voucher holder.
  final String? address;

  /// The outstanding voucher coin.
  final cosmos_base_v1beta1_coin.Coin? voucher;

  const AddressVoucher({this.address, this.voucher});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, voucher];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'voucher': config.encodeMessage(voucher)};
  }

  factory AddressVoucher.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return AddressVoucher(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      voucher: json.valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
        key: 'voucher',
        parse:
            (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory AddressVoucher.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AddressVoucher(
      address: decode.getString<String?>(1),
      voucher: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveCommonVouchersV1AddressVoucher;
}
