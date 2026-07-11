import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/injective/auction/v1beta1/src/auction.dart"
    as injective_auction_v1beta1_auction;

/// Bid defines a SDK message for placing a bid for an auction
class MsgBid extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgBidResponse>, ICosmosProtoAminoMessage {
  /// the sender's Injective address
  final String? sender;

  /// amount of the bid in INJ tokens
  final cosmos_base_v1beta1_coin.Coin? bidAmount;

  /// the current auction round being bid on
  final BigInt? round;

  const MsgBid({this.sender, this.bidAmount, this.round});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "auction/MsgBid"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, bidAmount, round];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'bid_amount': bidAmount?.toJson(),
      'round': round?.toString(),
    };
  }

  factory MsgBid.fromJson(Map<String, dynamic> json) {
    return MsgBid(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      bidAmount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'bid_amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      round: json.valueAsBigInt<BigInt?>('round', acceptCamelCase: true),
    );
  }

  factory MsgBid.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBid(
      sender: decode.getString<String?>(1),
      bidAmount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        2,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      round: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1MsgBid;
  @override
  MsgBidResponse onServiceResponse(List<int> bytes) {
    return MsgBidResponse.deserialize(bytes);
  }

  @override
  MsgBidResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgBidResponse.fromJson(json);
  }
}

class MsgBidResponse extends CosmosProtoMessage {
  const MsgBidResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgBidResponse.fromJson(Map<String, dynamic> json) {
    return MsgBidResponse();
  }

  factory MsgBidResponse.deserialize(List<int> bytes) {
    return MsgBidResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1MsgBidResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the ocr parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_auction_v1beta1_auction.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "auction/MsgUpdateParams"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<
        injective_auction_v1beta1_auction.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => injective_auction_v1beta1_auction.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_auction_v1beta1_auction.Params?>(
        2,
        (b) => injective_auction_v1beta1_auction.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1MsgUpdateParamsResponse;
}

/// MsgClaimVoucher defines a message for claiming an outstanding voucher
class MsgClaimVoucher extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgClaimVoucherResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address.
  final String? sender;

  /// The token denom of the voucher to claim.
  final String? denom;

  const MsgClaimVoucher({this.sender, this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "auction/MsgClaimVoucher"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'denom': denom};
  }

  factory MsgClaimVoucher.fromJson(Map<String, dynamic> json) {
    return MsgClaimVoucher(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory MsgClaimVoucher.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgClaimVoucher(
      sender: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1MsgClaimVoucher;
  @override
  MsgClaimVoucherResponse onServiceResponse(List<int> bytes) {
    return MsgClaimVoucherResponse.deserialize(bytes);
  }

  @override
  MsgClaimVoucherResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgClaimVoucherResponse.fromJson(json);
  }
}

class MsgClaimVoucherResponse extends CosmosProtoMessage {
  const MsgClaimVoucherResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgClaimVoucherResponse.fromJson(Map<String, dynamic> json) {
    return MsgClaimVoucherResponse();
  }

  factory MsgClaimVoucherResponse.deserialize(List<int> bytes) {
    return MsgClaimVoucherResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveAuctionV1beta1MsgClaimVoucherResponse;
}
