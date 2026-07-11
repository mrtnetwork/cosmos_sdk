import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/types.dart"
    as injective_peggy_v1_types;
import "package:cosmos_sdk/proto_messages/injective/peggy/v1/src/params.dart"
    as injective_peggy_v1_params;

/// MsgSetOrchestratorAddresses
/// this message allows validators to delegate their voting responsibilities
/// to a given key. This key is then used as an optional authentication method
/// for sigining oracle claims
/// VALIDATOR
/// The validator field is a cosmosvaloper1... string (i.e. sdk.ValAddress)
/// that references a validator in the active set
/// ORCHESTRATOR
/// The orchestrator field is a cosmos1... string  (i.e. sdk.AccAddress) that
/// references the key that is being delegated to
/// ETH_ADDRESS
/// This is a hex encoded 0x Ethereum public key that will be used by this
/// validator on Ethereum
class MsgSetOrchestratorAddresses extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetOrchestratorAddressesResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? orchestrator;

  final String? ethAddress;

  const MsgSetOrchestratorAddresses({
    this.sender,
    this.orchestrator,
    this.ethAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgSetOrchestratorAddresses",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/set_orchestrator_address",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, orchestrator, ethAddress];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'orchestrator': orchestrator,
      'eth_address': ethAddress,
    };
  }

  factory MsgSetOrchestratorAddresses.fromJson(Map<String, dynamic> json) {
    return MsgSetOrchestratorAddresses(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      orchestrator: json.valueAsString<String?>(
        'orchestrator',
        acceptCamelCase: true,
      ),
      ethAddress: json.valueAsString<String?>(
        'eth_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSetOrchestratorAddresses.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetOrchestratorAddresses(
      sender: decode.getString<String?>(1),
      orchestrator: decode.getString<String?>(2),
      ethAddress: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgSetOrchestratorAddresses;
  @override
  MsgSetOrchestratorAddressesResponse onServiceResponse(List<int> bytes) {
    return MsgSetOrchestratorAddressesResponse.deserialize(bytes);
  }

  @override
  MsgSetOrchestratorAddressesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetOrchestratorAddressesResponse.fromJson(json);
  }
}

class MsgSetOrchestratorAddressesResponse extends CosmosProtoMessage {
  const MsgSetOrchestratorAddressesResponse();

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

  factory MsgSetOrchestratorAddressesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetOrchestratorAddressesResponse();
  }

  factory MsgSetOrchestratorAddressesResponse.deserialize(List<int> bytes) {
    return MsgSetOrchestratorAddressesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1MsgSetOrchestratorAddressesResponse;
}

/// MsgValsetConfirm
/// this is the message sent by the validators when they wish to submit their
/// signatures over the validator set at a given block height. A validator must
/// first call MsgSetEthAddress to set their Ethereum address to be used for
/// signing. Then someone (anyone) must make a ValsetRequest the request is
/// essentially a messaging mechanism to determine which block all validators
/// should submit signatures over. Finally validators sign the validator set,
/// powers, and Ethereum addresses of the entire validator set at the height of a
/// ValsetRequest and submit that signature with this message.
///
/// If a sufficient number of validators (66% of voting power) (A) have set
/// Ethereum addresses and (B) submit ValsetConfirm messages with their
/// signatures it is then possible for anyone to view these signatures in the
/// chain store and submit them to Ethereum to update the validator set
/// -------------
class MsgValsetConfirm extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgValsetConfirmResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? nonce;

  final String? orchestrator;

  final String? ethAddress;

  final String? signature;

  const MsgValsetConfirm({
    this.nonce,
    this.orchestrator,
    this.ethAddress,
    this.signature,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "peggy/MsgValsetConfirm"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "orchestrator"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/valset_confirm",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nonce, orchestrator, ethAddress, signature];

  @override
  Map<String, dynamic> toJson() {
    return {
      'nonce': nonce?.toString(),
      'orchestrator': orchestrator,
      'eth_address': ethAddress,
      'signature': signature,
    };
  }

  factory MsgValsetConfirm.fromJson(Map<String, dynamic> json) {
    return MsgValsetConfirm(
      nonce: json.valueAsBigInt<BigInt?>('nonce', acceptCamelCase: true),
      orchestrator: json.valueAsString<String?>(
        'orchestrator',
        acceptCamelCase: true,
      ),
      ethAddress: json.valueAsString<String?>(
        'eth_address',
        acceptCamelCase: true,
      ),
      signature: json.valueAsString<String?>(
        'signature',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgValsetConfirm.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgValsetConfirm(
      nonce: decode.getBigInt<BigInt?>(1),
      orchestrator: decode.getString<String?>(2),
      ethAddress: decode.getString<String?>(3),
      signature: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgValsetConfirm;
  @override
  MsgValsetConfirmResponse onServiceResponse(List<int> bytes) {
    return MsgValsetConfirmResponse.deserialize(bytes);
  }

  @override
  MsgValsetConfirmResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgValsetConfirmResponse.fromJson(json);
  }
}

class MsgValsetConfirmResponse extends CosmosProtoMessage {
  const MsgValsetConfirmResponse();

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

  factory MsgValsetConfirmResponse.fromJson(Map<String, dynamic> json) {
    return MsgValsetConfirmResponse();
  }

  factory MsgValsetConfirmResponse.deserialize(List<int> bytes) {
    return MsgValsetConfirmResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgValsetConfirmResponse;
}

/// MsgSendToEth
/// This is the message that a user calls when they want to bridge an asset
/// it will later be removed when it is included in a batch and successfully
/// submitted tokens are removed from the users balance immediately
/// -------------
/// AMOUNT:
/// the coin to send across the bridge, note the restriction that this is a
/// single coin not a set of coins that is normal in other Cosmos messages
/// FEE:
/// the fee paid for the bridge, distinct from the fee paid to the chain to
/// actually send this message in the first place. So a successful send has
/// two layers of fees for the user
class MsgSendToEth extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSendToEthResponse>,
        ICosmosProtoAminoMessage {
  /// The sender's Injective address
  final String? sender;

  /// The Ethereum address to send the tokens to
  final String? ethDest;

  /// The amount of tokens to send
  final cosmos_base_v1beta1_coin.Coin? amount;

  /// The fee paid for the bridge, distinct from the fee paid to the chain to
  /// actually send this message in the first place. So a successful send has
  /// two layers of fees for the user
  final cosmos_base_v1beta1_coin.Coin? bridgeFee;

  const MsgSendToEth({this.sender, this.ethDest, this.amount, this.bridgeFee});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "peggy/MsgSendToEth"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/send_to_eth",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.message(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, ethDest, amount, bridgeFee];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'eth_dest': ethDest,
      'amount': amount?.toJson(),
      'bridge_fee': bridgeFee?.toJson(),
    };
  }

  factory MsgSendToEth.fromJson(Map<String, dynamic> json) {
    return MsgSendToEth(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      ethDest: json.valueAsString<String?>('eth_dest', acceptCamelCase: true),
      amount: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'amount',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
      bridgeFee: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Map<String, dynamic>>(
            key: 'bridge_fee',
            parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgSendToEth.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendToEth(
      sender: decode.getString<String?>(1),
      ethDest: decode.getString<String?>(2),
      amount: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        3,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      bridgeFee: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        4,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgSendToEth;
  @override
  MsgSendToEthResponse onServiceResponse(List<int> bytes) {
    return MsgSendToEthResponse.deserialize(bytes);
  }

  @override
  MsgSendToEthResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSendToEthResponse.fromJson(json);
  }
}

class MsgSendToEthResponse extends CosmosProtoMessage {
  const MsgSendToEthResponse();

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

  factory MsgSendToEthResponse.fromJson(Map<String, dynamic> json) {
    return MsgSendToEthResponse();
  }

  factory MsgSendToEthResponse.deserialize(List<int> bytes) {
    return MsgSendToEthResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgSendToEthResponse;
}

/// MsgRequestBatch
/// this is a message anyone can send that requests a batch of transactions to
/// send across the bridge be created for whatever block height this message is
/// included in. This acts as a coordination point, the handler for this message
/// looks at the AddToOutgoingPool tx's in the store and generates a batch, also
/// available in the store tied to this message. The validators then grab this
/// batch, sign it, submit the signatures with a MsgConfirmBatch before a relayer
/// can finally submit the batch
/// -------------
class MsgRequestBatch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRequestBatchResponse>,
        ICosmosProtoAminoMessage {
  final String? orchestrator;

  final String? denom;

  const MsgRequestBatch({this.orchestrator, this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "peggy/MsgRequestBatch"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "orchestrator"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/request_batch",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [orchestrator, denom];

  @override
  Map<String, dynamic> toJson() {
    return {'orchestrator': orchestrator, 'denom': denom};
  }

  factory MsgRequestBatch.fromJson(Map<String, dynamic> json) {
    return MsgRequestBatch(
      orchestrator: json.valueAsString<String?>(
        'orchestrator',
        acceptCamelCase: true,
      ),
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory MsgRequestBatch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRequestBatch(
      orchestrator: decode.getString<String?>(1),
      denom: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgRequestBatch;
  @override
  MsgRequestBatchResponse onServiceResponse(List<int> bytes) {
    return MsgRequestBatchResponse.deserialize(bytes);
  }

  @override
  MsgRequestBatchResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRequestBatchResponse.fromJson(json);
  }
}

class MsgRequestBatchResponse extends CosmosProtoMessage {
  const MsgRequestBatchResponse();

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

  factory MsgRequestBatchResponse.fromJson(Map<String, dynamic> json) {
    return MsgRequestBatchResponse();
  }

  factory MsgRequestBatchResponse.deserialize(List<int> bytes) {
    return MsgRequestBatchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgRequestBatchResponse;
}

/// MsgConfirmBatch
/// When validators observe a MsgRequestBatch they form a batch by ordering
/// transactions currently in the txqueue in order of highest to lowest fee,
/// cutting off when the batch either reaches a hardcoded maximum size (to be
/// decided, probably around 100) or when transactions stop being profitable
/// as well as an Ethereum signature over this batch by the validator
/// -------------
class MsgConfirmBatch extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgConfirmBatchResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? nonce;

  final String? tokenContract;

  final String? ethSigner;

  final String? orchestrator;

  final String? signature;

  const MsgConfirmBatch({
    this.nonce,
    this.tokenContract,
    this.ethSigner,
    this.orchestrator,
    this.signature,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "peggy/MsgConfirmBatch"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "orchestrator"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/confirm_batch",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    nonce,
    tokenContract,
    ethSigner,
    orchestrator,
    signature,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'nonce': nonce?.toString(),
      'token_contract': tokenContract,
      'eth_signer': ethSigner,
      'orchestrator': orchestrator,
      'signature': signature,
    };
  }

  factory MsgConfirmBatch.fromJson(Map<String, dynamic> json) {
    return MsgConfirmBatch(
      nonce: json.valueAsBigInt<BigInt?>('nonce', acceptCamelCase: true),
      tokenContract: json.valueAsString<String?>(
        'token_contract',
        acceptCamelCase: true,
      ),
      ethSigner: json.valueAsString<String?>(
        'eth_signer',
        acceptCamelCase: true,
      ),
      orchestrator: json.valueAsString<String?>(
        'orchestrator',
        acceptCamelCase: true,
      ),
      signature: json.valueAsString<String?>(
        'signature',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgConfirmBatch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgConfirmBatch(
      nonce: decode.getBigInt<BigInt?>(1),
      tokenContract: decode.getString<String?>(2),
      ethSigner: decode.getString<String?>(3),
      orchestrator: decode.getString<String?>(4),
      signature: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgConfirmBatch;
  @override
  MsgConfirmBatchResponse onServiceResponse(List<int> bytes) {
    return MsgConfirmBatchResponse.deserialize(bytes);
  }

  @override
  MsgConfirmBatchResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgConfirmBatchResponse.fromJson(json);
  }
}

class MsgConfirmBatchResponse extends CosmosProtoMessage {
  const MsgConfirmBatchResponse();

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

  factory MsgConfirmBatchResponse.fromJson(Map<String, dynamic> json) {
    return MsgConfirmBatchResponse();
  }

  factory MsgConfirmBatchResponse.deserialize(List<int> bytes) {
    return MsgConfirmBatchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgConfirmBatchResponse;
}

/// EthereumBridgeDepositClaim
/// When more than 66% of the active validator set has
/// claimed to have seen the deposit enter the ethereum blockchain coins are
/// issued to the Cosmos address in question
/// -------------
class MsgDepositClaim extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDepositClaimResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? eventNonce;

  final BigInt? blockHeight;

  final String? tokenContract;

  final String? amount;

  final String? ethereumSender;

  final String? cosmosReceiver;

  final String? orchestrator;

  final String? data;

  const MsgDepositClaim({
    this.eventNonce,
    this.blockHeight,
    this.tokenContract,
    this.amount,
    this.ethereumSender,
    this.cosmosReceiver,
    this.orchestrator,
    this.data,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "peggy/MsgDepositClaim"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "orchestrator"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/deposit_claim",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    eventNonce,
    blockHeight,
    tokenContract,
    amount,
    ethereumSender,
    cosmosReceiver,
    orchestrator,
    data,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'event_nonce': eventNonce?.toString(),
      'block_height': blockHeight?.toString(),
      'token_contract': tokenContract,
      'amount': amount,
      'ethereum_sender': ethereumSender,
      'cosmos_receiver': cosmosReceiver,
      'orchestrator': orchestrator,
      'data': data,
    };
  }

  factory MsgDepositClaim.fromJson(Map<String, dynamic> json) {
    return MsgDepositClaim(
      eventNonce: json.valueAsBigInt<BigInt?>(
        'event_nonce',
        acceptCamelCase: true,
      ),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      tokenContract: json.valueAsString<String?>(
        'token_contract',
        acceptCamelCase: true,
      ),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
      ethereumSender: json.valueAsString<String?>(
        'ethereum_sender',
        acceptCamelCase: true,
      ),
      cosmosReceiver: json.valueAsString<String?>(
        'cosmos_receiver',
        acceptCamelCase: true,
      ),
      orchestrator: json.valueAsString<String?>(
        'orchestrator',
        acceptCamelCase: true,
      ),
      data: json.valueAsString<String?>('data', acceptCamelCase: true),
    );
  }

  factory MsgDepositClaim.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDepositClaim(
      eventNonce: decode.getBigInt<BigInt?>(1),
      blockHeight: decode.getBigInt<BigInt?>(2),
      tokenContract: decode.getString<String?>(3),
      amount: decode.getString<String?>(4),
      ethereumSender: decode.getString<String?>(5),
      cosmosReceiver: decode.getString<String?>(6),
      orchestrator: decode.getString<String?>(7),
      data: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgDepositClaim;
  @override
  MsgDepositClaimResponse onServiceResponse(List<int> bytes) {
    return MsgDepositClaimResponse.deserialize(bytes);
  }

  @override
  MsgDepositClaimResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDepositClaimResponse.fromJson(json);
  }
}

class MsgDepositClaimResponse extends CosmosProtoMessage {
  const MsgDepositClaimResponse();

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

  factory MsgDepositClaimResponse.fromJson(Map<String, dynamic> json) {
    return MsgDepositClaimResponse();
  }

  factory MsgDepositClaimResponse.deserialize(List<int> bytes) {
    return MsgDepositClaimResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgDepositClaimResponse;
}

/// WithdrawClaim claims that a batch of withdrawal
/// operations on the bridge contract was executed.
class MsgWithdrawClaim extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgWithdrawClaimResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? eventNonce;

  final BigInt? blockHeight;

  final BigInt? batchNonce;

  final String? tokenContract;

  final String? orchestrator;

  const MsgWithdrawClaim({
    this.eventNonce,
    this.blockHeight,
    this.batchNonce,
    this.tokenContract,
    this.orchestrator,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "peggy/MsgWithdrawClaim"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "orchestrator"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/withdraw_claim",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    eventNonce,
    blockHeight,
    batchNonce,
    tokenContract,
    orchestrator,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'event_nonce': eventNonce?.toString(),
      'block_height': blockHeight?.toString(),
      'batch_nonce': batchNonce?.toString(),
      'token_contract': tokenContract,
      'orchestrator': orchestrator,
    };
  }

  factory MsgWithdrawClaim.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawClaim(
      eventNonce: json.valueAsBigInt<BigInt?>(
        'event_nonce',
        acceptCamelCase: true,
      ),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      batchNonce: json.valueAsBigInt<BigInt?>(
        'batch_nonce',
        acceptCamelCase: true,
      ),
      tokenContract: json.valueAsString<String?>(
        'token_contract',
        acceptCamelCase: true,
      ),
      orchestrator: json.valueAsString<String?>(
        'orchestrator',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgWithdrawClaim.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgWithdrawClaim(
      eventNonce: decode.getBigInt<BigInt?>(1),
      blockHeight: decode.getBigInt<BigInt?>(2),
      batchNonce: decode.getBigInt<BigInt?>(3),
      tokenContract: decode.getString<String?>(4),
      orchestrator: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgWithdrawClaim;
  @override
  MsgWithdrawClaimResponse onServiceResponse(List<int> bytes) {
    return MsgWithdrawClaimResponse.deserialize(bytes);
  }

  @override
  MsgWithdrawClaimResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgWithdrawClaimResponse.fromJson(json);
  }
}

class MsgWithdrawClaimResponse extends CosmosProtoMessage {
  const MsgWithdrawClaimResponse();

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

  factory MsgWithdrawClaimResponse.fromJson(Map<String, dynamic> json) {
    return MsgWithdrawClaimResponse();
  }

  factory MsgWithdrawClaimResponse.deserialize(List<int> bytes) {
    return MsgWithdrawClaimResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgWithdrawClaimResponse;
}

/// ERC20DeployedClaim allows the Cosmos module
/// to learn about an ERC20 that someone deployed
/// to represent a Cosmos asset
class MsgERC20DeployedClaim extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgERC20DeployedClaimResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? eventNonce;

  final BigInt? blockHeight;

  final String? cosmosDenom;

  final String? tokenContract;

  final String? name;

  final String? symbol;

  final BigInt? decimals;

  final String? orchestrator;

  const MsgERC20DeployedClaim({
    this.eventNonce,
    this.blockHeight,
    this.cosmosDenom,
    this.tokenContract,
    this.name,
    this.symbol,
    this.decimals,
    this.orchestrator,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgERC20DeployedClaim",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "orchestrator"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/erc20_deployed_claim",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.uint64(7),
        ProtoFieldConfig.string(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    eventNonce,
    blockHeight,
    cosmosDenom,
    tokenContract,
    name,
    symbol,
    decimals,
    orchestrator,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'event_nonce': eventNonce?.toString(),
      'block_height': blockHeight?.toString(),
      'cosmos_denom': cosmosDenom,
      'token_contract': tokenContract,
      'name': name,
      'symbol': symbol,
      'decimals': decimals?.toString(),
      'orchestrator': orchestrator,
    };
  }

  factory MsgERC20DeployedClaim.fromJson(Map<String, dynamic> json) {
    return MsgERC20DeployedClaim(
      eventNonce: json.valueAsBigInt<BigInt?>(
        'event_nonce',
        acceptCamelCase: true,
      ),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      cosmosDenom: json.valueAsString<String?>(
        'cosmos_denom',
        acceptCamelCase: true,
      ),
      tokenContract: json.valueAsString<String?>(
        'token_contract',
        acceptCamelCase: true,
      ),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      symbol: json.valueAsString<String?>('symbol', acceptCamelCase: true),
      decimals: json.valueAsBigInt<BigInt?>('decimals', acceptCamelCase: true),
      orchestrator: json.valueAsString<String?>(
        'orchestrator',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgERC20DeployedClaim.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgERC20DeployedClaim(
      eventNonce: decode.getBigInt<BigInt?>(1),
      blockHeight: decode.getBigInt<BigInt?>(2),
      cosmosDenom: decode.getString<String?>(3),
      tokenContract: decode.getString<String?>(4),
      name: decode.getString<String?>(5),
      symbol: decode.getString<String?>(6),
      decimals: decode.getBigInt<BigInt?>(7),
      orchestrator: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgERC20DeployedClaim;
  @override
  MsgERC20DeployedClaimResponse onServiceResponse(List<int> bytes) {
    return MsgERC20DeployedClaimResponse.deserialize(bytes);
  }

  @override
  MsgERC20DeployedClaimResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgERC20DeployedClaimResponse.fromJson(json);
  }
}

class MsgERC20DeployedClaimResponse extends CosmosProtoMessage {
  const MsgERC20DeployedClaimResponse();

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

  factory MsgERC20DeployedClaimResponse.fromJson(Map<String, dynamic> json) {
    return MsgERC20DeployedClaimResponse();
  }

  factory MsgERC20DeployedClaimResponse.deserialize(List<int> bytes) {
    return MsgERC20DeployedClaimResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgERC20DeployedClaimResponse;
}

/// This call allows the sender (and only the sender)
/// to cancel a given MsgSendToEth and recieve a refund
/// of the tokens
class MsgCancelSendToEth extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelSendToEthResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? transactionId;

  final String? sender;

  const MsgCancelSendToEth({this.transactionId, this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgCancelSendToEth",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/cancel_send_to_eth",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [transactionId, sender];

  @override
  Map<String, dynamic> toJson() {
    return {'transaction_id': transactionId?.toString(), 'sender': sender};
  }

  factory MsgCancelSendToEth.fromJson(Map<String, dynamic> json) {
    return MsgCancelSendToEth(
      transactionId: json.valueAsBigInt<BigInt?>(
        'transaction_id',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgCancelSendToEth.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelSendToEth(
      transactionId: decode.getBigInt<BigInt?>(1),
      sender: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgCancelSendToEth;
  @override
  MsgCancelSendToEthResponse onServiceResponse(List<int> bytes) {
    return MsgCancelSendToEthResponse.deserialize(bytes);
  }

  @override
  MsgCancelSendToEthResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCancelSendToEthResponse.fromJson(json);
  }
}

class MsgCancelSendToEthResponse extends CosmosProtoMessage {
  const MsgCancelSendToEthResponse();

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

  factory MsgCancelSendToEthResponse.fromJson(Map<String, dynamic> json) {
    return MsgCancelSendToEthResponse();
  }

  factory MsgCancelSendToEthResponse.deserialize(List<int> bytes) {
    return MsgCancelSendToEthResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgCancelSendToEthResponse;
}

/// This call allows anyone to submit evidence that a
/// validator has signed a valset, batch, or logic call that never
/// existed. Subject contains the batch, valset, or logic call.
class MsgSubmitBadSignatureEvidence extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSubmitBadSignatureEvidenceResponse>,
        ICosmosProtoAminoMessage {
  final google_protobuf_any.Any? subject;

  final String? signature;

  final String? sender;

  const MsgSubmitBadSignatureEvidence({
    this.subject,
    this.signature,
    this.sender,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgSubmitBadSignatureEvidence",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/submit_bad_signature_evidence",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [subject, signature, sender];

  @override
  Map<String, dynamic> toJson() {
    return {
      'subject': subject?.toJson(),
      'signature': signature,
      'sender': sender,
    };
  }

  factory MsgSubmitBadSignatureEvidence.fromJson(Map<String, dynamic> json) {
    return MsgSubmitBadSignatureEvidence(
      subject: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'subject',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      signature: json.valueAsString<String?>(
        'signature',
        acceptCamelCase: true,
      ),
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgSubmitBadSignatureEvidence.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitBadSignatureEvidence(
      subject: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      signature: decode.getString<String?>(2),
      sender: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgSubmitBadSignatureEvidence;
  @override
  MsgSubmitBadSignatureEvidenceResponse onServiceResponse(List<int> bytes) {
    return MsgSubmitBadSignatureEvidenceResponse.deserialize(bytes);
  }

  @override
  MsgSubmitBadSignatureEvidenceResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSubmitBadSignatureEvidenceResponse.fromJson(json);
  }
}

class MsgSubmitBadSignatureEvidenceResponse extends CosmosProtoMessage {
  const MsgSubmitBadSignatureEvidenceResponse();

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

  factory MsgSubmitBadSignatureEvidenceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgSubmitBadSignatureEvidenceResponse();
  }

  factory MsgSubmitBadSignatureEvidenceResponse.deserialize(List<int> bytes) {
    return MsgSubmitBadSignatureEvidenceResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1MsgSubmitBadSignatureEvidenceResponse;
}

/// This informs the Cosmos module that a validator
/// set has been updated.
class MsgValsetUpdatedClaim extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgValsetUpdatedClaimResponse>,
        ICosmosProtoAminoMessage {
  final BigInt? eventNonce;

  final BigInt? valsetNonce;

  final BigInt? blockHeight;

  final List<injective_peggy_v1_types.BridgeValidator> members;

  final String? rewardAmount;

  final String? rewardToken;

  final String? orchestrator;

  const MsgValsetUpdatedClaim({
    this.eventNonce,
    this.valsetNonce,
    this.blockHeight,
    this.members = const [],
    this.rewardAmount,
    this.rewardToken,
    this.orchestrator,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgValsetUpdatedClaim",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "orchestrator"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/peggy/v1/valset_updated_claim",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.string(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    eventNonce,
    valsetNonce,
    blockHeight,
    members,
    rewardAmount,
    rewardToken,
    orchestrator,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'event_nonce': eventNonce?.toString(),
      'valset_nonce': valsetNonce?.toString(),
      'block_height': blockHeight?.toString(),
      'members': members.map((e) => e.toJson()).toList(),
      'reward_amount': rewardAmount,
      'reward_token': rewardToken,
      'orchestrator': orchestrator,
    };
  }

  factory MsgValsetUpdatedClaim.fromJson(Map<String, dynamic> json) {
    return MsgValsetUpdatedClaim(
      eventNonce: json.valueAsBigInt<BigInt?>(
        'event_nonce',
        acceptCamelCase: true,
      ),
      valsetNonce: json.valueAsBigInt<BigInt?>(
        'valset_nonce',
        acceptCamelCase: true,
      ),
      blockHeight: json.valueAsBigInt<BigInt?>(
        'block_height',
        acceptCamelCase: true,
      ),
      members:
          (json.valueEnsureAsList<dynamic>('members', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  injective_peggy_v1_types.BridgeValidator,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          injective_peggy_v1_types.BridgeValidator.fromJson(v),
                ),
              )
              .toList(),
      rewardAmount: json.valueAsString<String?>(
        'reward_amount',
        acceptCamelCase: true,
      ),
      rewardToken: json.valueAsString<String?>(
        'reward_token',
        acceptCamelCase: true,
      ),
      orchestrator: json.valueAsString<String?>(
        'orchestrator',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgValsetUpdatedClaim.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgValsetUpdatedClaim(
      eventNonce: decode.getBigInt<BigInt?>(1),
      valsetNonce: decode.getBigInt<BigInt?>(2),
      blockHeight: decode.getBigInt<BigInt?>(3),
      members:
          decode
              .getListOfBytes(4)
              .map(
                (b) => injective_peggy_v1_types.BridgeValidator.deserialize(b),
              )
              .toList(),
      rewardAmount: decode.getString<String?>(5),
      rewardToken: decode.getString<String?>(6),
      orchestrator: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgValsetUpdatedClaim;
  @override
  MsgValsetUpdatedClaimResponse onServiceResponse(List<int> bytes) {
    return MsgValsetUpdatedClaimResponse.deserialize(bytes);
  }

  @override
  MsgValsetUpdatedClaimResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgValsetUpdatedClaimResponse.fromJson(json);
  }
}

class MsgValsetUpdatedClaimResponse extends CosmosProtoMessage {
  const MsgValsetUpdatedClaimResponse();

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

  factory MsgValsetUpdatedClaimResponse.fromJson(Map<String, dynamic> json) {
    return MsgValsetUpdatedClaimResponse();
  }

  factory MsgValsetUpdatedClaimResponse.deserialize(List<int> bytes) {
    return MsgValsetUpdatedClaimResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgValsetUpdatedClaimResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the peggy parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final injective_peggy_v1_params.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "peggy/MsgUpdateParams"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
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
      params: json
          .valueTo<injective_peggy_v1_params.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => injective_peggy_v1_params.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_peggy_v1_params.Params?>(
        2,
        (b) => injective_peggy_v1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgUpdateParamsResponse;
}

/// MsgBlacklistEthereumAddresses defines the message used to add Ethereum
/// addresses to peggy blacklist.
class MsgBlacklistEthereumAddresses extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgBlacklistEthereumAddressesResponse>,
        ICosmosProtoAminoMessage {
  /// signer address
  final String? signer;

  /// Ethereum addresses to include in the blacklist
  final List<String> blacklistAddresses;

  const MsgBlacklistEthereumAddresses({
    this.signer,
    this.blacklistAddresses = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgBlacklistEthereumAddresses",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, blacklistAddresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'signer': signer,
      'blacklist_addresses': blacklistAddresses.map((e) => e).toList(),
    };
  }

  factory MsgBlacklistEthereumAddresses.fromJson(Map<String, dynamic> json) {
    return MsgBlacklistEthereumAddresses(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      blacklistAddresses:
          (json.valueEnsureAsList<dynamic>(
            'blacklist_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgBlacklistEthereumAddresses.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgBlacklistEthereumAddresses(
      signer: decode.getString<String?>(1),
      blacklistAddresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgBlacklistEthereumAddresses;
  @override
  MsgBlacklistEthereumAddressesResponse onServiceResponse(List<int> bytes) {
    return MsgBlacklistEthereumAddressesResponse.deserialize(bytes);
  }

  @override
  MsgBlacklistEthereumAddressesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgBlacklistEthereumAddressesResponse.fromJson(json);
  }
}

/// MsgBlacklistEthereumAddressesResponse defines the
/// MsgBlacklistEthereumAddresses response type.
class MsgBlacklistEthereumAddressesResponse extends CosmosProtoMessage {
  const MsgBlacklistEthereumAddressesResponse();

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

  factory MsgBlacklistEthereumAddressesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgBlacklistEthereumAddressesResponse();
  }

  factory MsgBlacklistEthereumAddressesResponse.deserialize(List<int> bytes) {
    return MsgBlacklistEthereumAddressesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1MsgBlacklistEthereumAddressesResponse;
}

/// MsgRevokeEthereumBlacklist defines the message used to remove Ethereum
/// addresses from peggy blacklist.
class MsgRevokeEthereumBlacklist extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRevokeEthereumBlacklistResponse>,
        ICosmosProtoAminoMessage {
  /// signer address
  final String? signer;

  /// Ethereum addresses to include in the blacklist
  final List<String> blacklistAddresses;

  const MsgRevokeEthereumBlacklist({
    this.signer,
    this.blacklistAddresses = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgRevokeEthereumBlacklist",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, blacklistAddresses];

  @override
  Map<String, dynamic> toJson() {
    return {
      'signer': signer,
      'blacklist_addresses': blacklistAddresses.map((e) => e).toList(),
    };
  }

  factory MsgRevokeEthereumBlacklist.fromJson(Map<String, dynamic> json) {
    return MsgRevokeEthereumBlacklist(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      blacklistAddresses:
          (json.valueEnsureAsList<dynamic>(
            'blacklist_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgRevokeEthereumBlacklist.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRevokeEthereumBlacklist(
      signer: decode.getString<String?>(1),
      blacklistAddresses: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgRevokeEthereumBlacklist;
  @override
  MsgRevokeEthereumBlacklistResponse onServiceResponse(List<int> bytes) {
    return MsgRevokeEthereumBlacklistResponse.deserialize(bytes);
  }

  @override
  MsgRevokeEthereumBlacklistResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRevokeEthereumBlacklistResponse.fromJson(json);
  }
}

/// MsgRevokeEthereumBlacklistResponse defines the MsgRevokeEthereumBlacklist
/// response type.
class MsgRevokeEthereumBlacklistResponse extends CosmosProtoMessage {
  const MsgRevokeEthereumBlacklistResponse();

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

  factory MsgRevokeEthereumBlacklistResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRevokeEthereumBlacklistResponse();
  }

  factory MsgRevokeEthereumBlacklistResponse.deserialize(List<int> bytes) {
    return MsgRevokeEthereumBlacklistResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .injectivePeggyV1MsgRevokeEthereumBlacklistResponse;
}

/// MsgCreateRateLimit is used to impose a (withdrawal) limit for specific ERC20
/// token within a sliding window
class MsgCreateRateLimit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCreateRateLimitResponse>,
        ICosmosProtoAminoMessage {
  /// address of peggy admin or governance account
  final String? authority;

  /// address of the ERC20 token
  final String? tokenAddress;

  /// decimals of the ERC20 token
  final int? tokenDecimals;

  /// a Pyth-specific ID used to obtain USD price of the ERC20 token
  final String? tokenPriceId;

  /// the notional USD limit imposed on all outgoing traffic (per token)
  final String? rateLimitUsd;

  /// the absolute amount of tokens that can be minted on Injective
  final String? absoluteMintLimit;

  /// length of the sliding window in which inbound (outbound) traffic is
  /// measured
  final BigInt? rateLimitWindow;

  const MsgCreateRateLimit({
    this.authority,
    this.tokenAddress,
    this.tokenDecimals,
    this.tokenPriceId,
    this.rateLimitUsd,
    this.absoluteMintLimit,
    this.rateLimitWindow,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgCreateRateLimit",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(
          6,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    tokenAddress,
    tokenDecimals,
    tokenPriceId,
    rateLimitUsd,
    absoluteMintLimit,
    rateLimitWindow,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'token_address': tokenAddress,
      'token_decimals': tokenDecimals,
      'token_price_id': tokenPriceId,
      'rate_limit_usd': rateLimitUsd,
      'absolute_mint_limit': absoluteMintLimit,
      'rate_limit_window': rateLimitWindow?.toString(),
    };
  }

  factory MsgCreateRateLimit.fromJson(Map<String, dynamic> json) {
    return MsgCreateRateLimit(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      tokenAddress: json.valueAsString<String?>(
        'token_address',
        acceptCamelCase: true,
      ),
      tokenDecimals: json.valueAsInt<int?>(
        'token_decimals',
        acceptCamelCase: true,
      ),
      tokenPriceId: json.valueAsString<String?>(
        'token_price_id',
        acceptCamelCase: true,
      ),
      rateLimitUsd: json.valueAsString<String?>(
        'rate_limit_usd',
        acceptCamelCase: true,
      ),
      absoluteMintLimit: json.valueAsString<String?>(
        'absolute_mint_limit',
        acceptCamelCase: true,
      ),
      rateLimitWindow: json.valueAsBigInt<BigInt?>(
        'rate_limit_window',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgCreateRateLimit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateRateLimit(
      authority: decode.getString<String?>(1),
      tokenAddress: decode.getString<String?>(2),
      tokenDecimals: decode.getInt<int?>(3),
      tokenPriceId: decode.getString<String?>(4),
      rateLimitUsd: decode.getString<String?>(5),
      absoluteMintLimit: decode.getString<String?>(6),
      rateLimitWindow: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgCreateRateLimit;
  @override
  MsgCreateRateLimitResponse onServiceResponse(List<int> bytes) {
    return MsgCreateRateLimitResponse.deserialize(bytes);
  }

  @override
  MsgCreateRateLimitResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateRateLimitResponse.fromJson(json);
  }
}

class MsgCreateRateLimitResponse extends CosmosProtoMessage {
  const MsgCreateRateLimitResponse();

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

  factory MsgCreateRateLimitResponse.fromJson(Map<String, dynamic> json) {
    return MsgCreateRateLimitResponse();
  }

  factory MsgCreateRateLimitResponse.deserialize(List<int> bytes) {
    return MsgCreateRateLimitResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgCreateRateLimitResponse;
}

class MsgUpdateRateLimit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateRateLimitResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of peggy admin or governance account
  final String? authority;

  /// token_address is the address of rate limited token
  final String? tokenAddress;

  /// new_token_price_id is the new Pyth price ID of the rate limited token
  final String? newTokenPriceId;

  /// new_rate_limit_usd is the new notional limit (on withdrawals) in USD
  final String? newRateLimitUsd;

  /// new_rate_limit_window is the new length of the sliding window
  final BigInt? newRateLimitWindow;

  const MsgUpdateRateLimit({
    this.authority,
    this.tokenAddress,
    this.newTokenPriceId,
    this.newRateLimitUsd,
    this.newRateLimitWindow,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgUpdateRateLimit",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.uint64(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    tokenAddress,
    newTokenPriceId,
    newRateLimitUsd,
    newRateLimitWindow,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'token_address': tokenAddress,
      'new_token_price_id': newTokenPriceId,
      'new_rate_limit_usd': newRateLimitUsd,
      'new_rate_limit_window': newRateLimitWindow?.toString(),
    };
  }

  factory MsgUpdateRateLimit.fromJson(Map<String, dynamic> json) {
    return MsgUpdateRateLimit(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      tokenAddress: json.valueAsString<String?>(
        'token_address',
        acceptCamelCase: true,
      ),
      newTokenPriceId: json.valueAsString<String?>(
        'new_token_price_id',
        acceptCamelCase: true,
      ),
      newRateLimitUsd: json.valueAsString<String?>(
        'new_rate_limit_usd',
        acceptCamelCase: true,
      ),
      newRateLimitWindow: json.valueAsBigInt<BigInt?>(
        'new_rate_limit_window',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateRateLimit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateRateLimit(
      authority: decode.getString<String?>(1),
      tokenAddress: decode.getString<String?>(2),
      newTokenPriceId: decode.getString<String?>(3),
      newRateLimitUsd: decode.getString<String?>(4),
      newRateLimitWindow: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgUpdateRateLimit;
  @override
  MsgUpdateRateLimitResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateRateLimitResponse.deserialize(bytes);
  }

  @override
  MsgUpdateRateLimitResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateRateLimitResponse.fromJson(json);
  }
}

class MsgUpdateRateLimitResponse extends CosmosProtoMessage {
  const MsgUpdateRateLimitResponse();

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

  factory MsgUpdateRateLimitResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateRateLimitResponse();
  }

  factory MsgUpdateRateLimitResponse.deserialize(List<int> bytes) {
    return MsgUpdateRateLimitResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgUpdateRateLimitResponse;
}

class MsgRemoveRateLimit extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveRateLimitResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of peggy admin or governance account
  final String? authority;

  /// token_address is the address of rate limited token
  final String? tokenAddress;

  const MsgRemoveRateLimit({this.authority, this.tokenAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "peggy/MsgRemoveRateLimit",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, tokenAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'token_address': tokenAddress};
  }

  factory MsgRemoveRateLimit.fromJson(Map<String, dynamic> json) {
    return MsgRemoveRateLimit(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      tokenAddress: json.valueAsString<String?>(
        'token_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgRemoveRateLimit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveRateLimit(
      authority: decode.getString<String?>(1),
      tokenAddress: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgRemoveRateLimit;
  @override
  MsgRemoveRateLimitResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveRateLimitResponse.deserialize(bytes);
  }

  @override
  MsgRemoveRateLimitResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRemoveRateLimitResponse.fromJson(json);
  }
}

class MsgRemoveRateLimitResponse extends CosmosProtoMessage {
  const MsgRemoveRateLimitResponse();

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

  factory MsgRemoveRateLimitResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveRateLimitResponse();
  }

  factory MsgRemoveRateLimitResponse.deserialize(List<int> bytes) {
    return MsgRemoveRateLimitResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectivePeggyV1MsgRemoveRateLimitResponse;
}
