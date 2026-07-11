import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Copyright 2024 Circle Internet Group, Inc.  All rights reserved.
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// SPDX-License-Identifier: Apache-2.0
/// *
///  * PerMessageBurnLimit is the maximum amount of a certain denom that can be
///  * burned in an single burn
///  * @param denom the denom
///  * @param amount the amount that can be burned (in microunits).  An amount of
///  * 1000000 uusdc is equivalent to 1USDC
class PerMessageBurnLimit extends CosmosProtoMessage {
  final String? denom;

  final String? amount;

  const PerMessageBurnLimit({this.denom, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, amount];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom, 'amount': amount};
  }

  factory PerMessageBurnLimit.fromJson(Map<String, dynamic> json) {
    return PerMessageBurnLimit(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
      amount: json.valueAsString<String?>('amount', acceptCamelCase: true),
    );
  }

  factory PerMessageBurnLimit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PerMessageBurnLimit(
      denom: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1PerMessageBurnLimit;
}
