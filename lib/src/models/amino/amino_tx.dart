import 'package:blockchain_utils/utils/string/string.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class AminoTx {
  final String chainId;
  final BigInt accountNumber;
  final BigInt sequence;
  final Fee fee;
  final List<AminoMessage> messages;
  final String memo;

  AminoTx copyWith({
    String? chainId,
    BigInt? accountNumber,
    BigInt? sequence,
    Fee? fee,
    List<AminoMessage>? messages,
    String? memo,
  }) {
    assert(sequence == null || !sequence.isNegative, "invalid sequence");
    assert(
      accountNumber == null || !accountNumber.isNegative,
      "invalid sequence",
    );
    return AminoTx(
      chainId: chainId ?? this.chainId,
      accountNumber: accountNumber ?? this.accountNumber,
      sequence: sequence ?? this.sequence,
      fee: fee ?? this.fee,
      messages: messages ?? this.messages,
      memo: memo ?? this.memo,
    );
  }

  const AminoTx({
    required this.chainId,
    required this.accountNumber,
    required this.sequence,
    required this.fee,
    required this.messages,
    this.memo = "",
  });
  factory AminoTx.fromJson(Map<String, dynamic> json) {
    final chainId = json.as<String>(
      "chain_id",
      onError: (notfound) {
        if (notfound) {
          return const AminoJsonParserException(
            "Missing 'chain_id' parameters.",
          );
        }
        return const AminoJsonParserException(
          "'chain_id' must be a valid string.",
        );
      },
    );
    if (chainId.isEmpty) {
      throw AminoJsonParserException(
        "'chain_id' must be a non-empty, valid string.",
      );
    }

    BigInt accountNumber = json.asBigInt(
      "account_number",
      sign: false,
      onError: (notfound) {
        if (notfound) {
          return const AminoJsonParserException(
            "Missing 'account_number' parameters.",
          );
        }
        return const AminoJsonParserException(
          "'account_number' must be a valid unsigned integer as string.",
        );
      },
    );
    BigInt sequence = json.asBigInt(
      "sequence",
      sign: false,
      onError: (notfound) {
        if (notfound) {
          return const AminoJsonParserException(
            "Missing 'sequence' parameters.",
          );
        }
        return const AminoJsonParserException(
          "'sequence' must be a valid unsigned integer as string.",
        );
      },
    );

    final List<Map<String, dynamic>> msgs =
        json.asListOfMap(
          "msgs",
          throwOnNull: true,
          onError: (notfound) {
            if (notfound) {
              return const AminoJsonParserException(
                "Missing 'msgs' parameters.",
              );
            }
            return const AminoJsonParserException(
              "'msgs' must be a list of objects containing valid Amino messages.",
            );
          },
        )!;
    if (msgs.isEmpty) {
      throw const AminoJsonParserException(
        "At least one Amino message is required. Ensure the 'msgs' list is not empty.",
      );
    }
    final List<AminoMessage> messages = [];
    for (final i in msgs) {
      try {
        final msg = AminoMessage.fromJson(i);
        messages.add(msg);
      } on AminoJsonParserException {
        rethrow;
      } catch (e) {
        throw AminoJsonParserException(
          "Failed to parse Amino message of type: ${i.as<String>("type")}. Verify the message structure and format.",
        );
      }
    }

    final memo = json.as<String?>(
      "memo",
      onError: (notfound) {
        return const AminoJsonParserException("'memo' must be a valid string.");
      },
    );
    final fee = json.asMap<Map<String, dynamic>>(
      "fee",
      onError: (notfound) {
        if (notfound) {
          return const AminoJsonParserException("Missing 'fee' parameters.");
        }
        return const AminoJsonParserException("'fee' must be a valid Object.");
      },
    );
    final gas = fee.asBigInt<BigInt>(
      "gas",
      sign: false,
      onError: (notfound) {
        if (notfound) {
          return const AminoJsonParserException(
            "Missing fee 'gas' parameters.",
          );
        }
        return const AminoJsonParserException(
          "'gas' must be a valid unsigned integer as string.",
        );
      },
    );
    final coins =
        fee.asListOfMap(
          "amount",
          throwOnNull: true,
          onError: (notfound) {
            if (notfound) {
              return const AminoJsonParserException(
                "Missing fee 'amount' parameters.",
              );
            }
            return const AminoJsonParserException(
              "'amount' must be a list of objects containing valid cosmos coin.",
            );
          },
        )!;
    final payer = json.as<String?>(
      "payer",
      onError: (notfound) {
        return const AminoJsonParserException(
          "'payer' must be a valid string.",
        );
      },
    );
    final granter = json.as<String?>(
      "granter",
      onError: (notfound) {
        return const AminoJsonParserException(
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
        throw AminoJsonParserException("'payer' must be a valid address.");
      }
    }
    if (granter != null) {
      try {
        granterAddress = CosmosBaseAddress(granter);
      } catch (e) {
        throw AminoJsonParserException("'granter' must be a valid address.");
      }
    }
    final amounts =
        coins.map((e) {
          try {
            return Coin.fromJson(e);
          } catch (_) {
            throw AminoJsonParserException(
              "'amount' must be a list of objects containing valid cosmos coin.",
            );
          }
        }).toList();
    return AminoTx(
      chainId: chainId,
      accountNumber: accountNumber,
      sequence: sequence,
      fee: Fee(
        amount: amounts,
        gasLimit: gas,
        granter: granterAddress,
        payer: payerAddress,
      ),
      messages: messages,
      memo: memo ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fee = this.fee.toAminoJson();
    final toJson = {
      "account_number": "$accountNumber",
      "chain_id": chainId,
      "fee": fee,
      "memo": memo,
      "msgs": messages.map((e) => e.toAminoJson()).toList(),
      "sequence": "$sequence",
    };
    final sort = CosmosUtils.sortAminoJsonTx(toJson);
    return sort as Map<String, dynamic>;
  }

  List<int> toBuffer() {
    return StringUtils.encode(StringUtils.fromJson(toJson()));
  }
}
