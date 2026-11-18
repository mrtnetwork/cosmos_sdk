import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/address/address/address.dart';
import 'package:cosmos_sdk/sdk/amino/src/unknown_amino_service.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/models.dart'
    show Coin;
import 'package:cosmos_sdk/src/error/cosmos_error.dart';
import 'package:cosmos_sdk/sdk/serialization/src/protobuf.dart';
import 'package:cosmos_sdk/sdk/types/bech32_config.dart';

import 'utils.dart';

/// Fee includes the amount of coins paid in fees and the maximum
/// gas to be used by the transaction. The ratio yields an effective "gasprice",
/// which must be above some minimum to be accepted into the mempool.
class AminoFee {
  /// amount is the amount of coins to be paid as a fee
  final List<Coin> amount;

  /// gas_limit is the maximum gas that can be used in transaction processing
  /// before an out of gas error occurs
  final BigInt? gas;

  /// if unset, the first signer is responsible for paying the fees. If set, the
  /// specified account must pay the fees. the payer must be a tx signer (and
  /// thus have signed this field in AuthInfo). setting this field does *not*
  /// change the ordering of required signers for the transaction.
  final String? payer;

  /// if set, the fee payer (either the first signer or the value of the payer
  /// field) requests that a fee grant be used to pay fees instead of the fee
  /// payer's own balance. If an appropriate fee grant does not exist or the
  /// chain does not support fee grants, this will fail
  final String? granter;

  const AminoFee({this.amount = const [], this.gas, this.payer, this.granter});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount.map((e) => e.toJson()).toList(),
      'gas': gas?.toString(),
      'payer': payer,
      'granter': granter,
    }.notNullValue;
  }
}

/// example:
/// (type,value) => CosmosMessageRegistry.fromJson(type ,json:value)
typedef CbFindAminoMessage =
    ICosmosProtoAminoMessage Function(String type, Map<String, dynamic> value);

class AminoTx {
  final String chainId;
  final BigInt accountNumber;
  final BigInt sequence;
  final AminoFee fee;
  final List<ICosmosProtoAminoMessage> messages;
  final String memo;
  final CosmosBech32Config? config;

  AminoTx copyWith({
    String? chainId,
    BigInt? accountNumber,
    BigInt? sequence,
    AminoFee? fee,
    List<ICosmosProtoAminoMessage>? messages,
    String? memo,
    CosmosBech32Config? config,
  }) {
    if (sequence != null && sequence.isNegative) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        "Invalid sequence: must not be negative.",
      );
    }
    if (accountNumber != null && accountNumber.isNegative) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        "Invalid account number: must not be negative.",
      );
    }
    return AminoTx(
      chainId: chainId ?? this.chainId,
      accountNumber: accountNumber ?? this.accountNumber,
      sequence: sequence ?? this.sequence,
      fee: fee ?? this.fee,
      messages: messages ?? this.messages,
      memo: memo ?? this.memo,

      config: config ?? this.config,
    );
  }

  const AminoTx({
    required this.chainId,
    required this.accountNumber,
    required this.sequence,
    required this.fee,
    required this.messages,
    required this.config,
    this.memo = "",
  });
  factory AminoTx.fromJson(
    Map<String, dynamic> json, {
    CosmosBech32Config? config,
    CbFindAminoMessage? findMessage,
  }) {
    final chainId = json.valueAs<String>(
      "chain_id",
      onMissing:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                "Missing 'chain_id' parameters.",
              ),
      onError: (_) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'chain_id' must be a valid string.",
        );
      },
    );
    if (chainId.isEmpty) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        "'chain_id' must be a non-empty, valid string.",
      );
    }

    BigInt accountNumber = json.valueAsBigInt(
      "account_number",
      sign: false,
      onMissing:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                "Missing 'account_number' parameters.",
              ),
      onError: (_) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'account_number' must be a valid unsigned integer as string.",
        );
      },
    );
    BigInt sequence = json.valueAsBigInt(
      "sequence",
      sign: false,
      onMissing:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                "Missing 'sequence' parameters.",
              ),
      onError: (_) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'sequence' must be a valid unsigned integer as string.",
        );
      },
    );

    final List<Map<String, dynamic>>
    msgs = json.valueEnsureAsList<Map<String, dynamic>>(
      "msgs",
      onMissing:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                "Missing 'msgs' parameters.",
              ),
      onError: (_) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'msgs' must be a list of objects containing valid Amino messages.",
        );
      },
    );
    if (msgs.isEmpty) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        "At least one Amino message is required. Ensure the 'msgs' list is not empty.",
      );
    }
    final List<ICosmosProtoAminoMessage> messages = [];
    for (final i in msgs) {
      try {
        final msg = UnknownAminoService(i);
        if (findMessage != null) {
          messages.add(findMessage(msg.declarationId.aminoType, msg.value));
          continue;
        }
        messages.add(msg);
      } on BuError {
        rethrow;
      } catch (e) {
        throw BuError(
          CosmosErrorType.aminoJsonParser,
          "Failed to parse Amino message of type: ${i.valueAs<String?>("type") ?? "null"}. Verify the message structure and format.",
        );
      }
    }

    final memo = json.valueAs<String?>(
      "memo",
      onError: (notfound) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'memo' must be a valid string.",
        );
      },
    );
    final fee = json.valueEnsureAsMap<String, dynamic>(
      "fee",
      onMissing:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                "Missing 'fee' parameters.",
              ),
      onError: (_) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'fee' must be a valid Object.",
        );
      },
    );
    final gas = fee.valueAsBigInt<BigInt>(
      "gas",
      sign: false,
      onMissing:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                "Missing fee 'gas' parameters.",
              ),
      onError: (_) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'gas' must be a valid unsigned integer as string.",
        );
      },
    );
    final coins = fee.valueEnsureAsList<Map<String, dynamic>>(
      "amount",
      onMissing:
          () =>
              throw BuError(
                DefaultErrorType.invalidArgument,
                "Missing fee 'amount' parameters.",
              ),
      onError: (notfound) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'amount' must be a list of objects containing valid cosmos coin.",
        );
      },
    );

    final payer = fee.valueAs<String?>(
      "payer",
      onError: (_) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'payer' must be a valid string.",
        );
      },
    );
    final granter = fee.valueAs<String?>(
      "granter",
      onError: (_) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'granter' must be a valid string.",
        );
      },
    );
    CosmosBaseAddress? payerAddress;
    CosmosBaseAddress? granterAddress;
    if (payer != null) {
      try {
        payerAddress = CosmosBaseAddress(payer);
      } catch (e) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'payer' must be a valid address.",
        );
      }
    }
    if (granter != null) {
      try {
        granterAddress = CosmosBaseAddress(granter);
      } catch (e) {
        throw BuError(
          DefaultErrorType.invalidArgument,
          "'granter' must be a valid address.",
        );
      }
    }
    final amounts =
        coins.map((e) {
          try {
            return Coin.fromJson(e);
          } catch (_) {
            throw BuError(
              DefaultErrorType.invalidArgument,
              "'amount' must be a list of objects containing valid cosmos coin.",
            );
          }
        }).toList();
    return AminoTx(
      chainId: chainId,
      accountNumber: accountNumber,
      config: config,
      sequence: sequence,
      fee: AminoFee(
        amount: amounts,
        gas: gas,
        granter: granterAddress?.address,
        payer: payerAddress?.address,
      ),
      messages: messages,
      memo: memo ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fee = this.fee.toJson();
    final toJson = {
      "account_number": "$accountNumber",
      "chain_id": chainId,
      "fee": fee,
      "memo": memo,
      "msgs": messages.map((e) => e.toAminoJson(config: config)).toList(),
      "sequence": "$sequence",
    };
    final sort = CosmosAminoUtils.sortAminoJsonTx(toJson);
    return sort as Map<String, dynamic>;
  }

  List<int> toBuffer() {
    final toJson = StringUtils.fromJson(this.toJson(), toStringEncodable: true);
    return StringUtils.encode(toJson);
  }
}
