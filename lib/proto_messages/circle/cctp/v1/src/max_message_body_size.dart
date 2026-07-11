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
///  * Message format for BurningAndMintingPaused
///  * @param paused true if paused, false if not paused
class MaxMessageBodySize extends CosmosProtoMessage {
  final BigInt? amount;

  const MaxMessageBodySize({this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [amount];

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount?.toString()};
  }

  factory MaxMessageBodySize.fromJson(Map<String, dynamic> json) {
    return MaxMessageBodySize(
      amount: json.valueAsBigInt<BigInt?>('amount', acceptCamelCase: true),
    );
  }

  factory MaxMessageBodySize.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MaxMessageBodySize(amount: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MaxMessageBodySize;
}
