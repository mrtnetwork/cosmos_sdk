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
///  * The Nonce type functions both to mark receipt of received messages and a
///  * counter for sending messages
///  * @param source_domain the domain id, used to mark used nonces for received
///  * messages
///  * @param nonce the nonce number
class Nonce extends CosmosProtoMessage {
  final int? sourceDomain;

  final BigInt? nonce;

  const Nonce({this.sourceDomain, this.nonce});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sourceDomain, nonce];

  @override
  Map<String, dynamic> toJson() {
    return {'source_domain': sourceDomain, 'nonce': nonce?.toString()};
  }

  factory Nonce.fromJson(Map<String, dynamic> json) {
    return Nonce(
      sourceDomain: json.valueAsInt<int?>(
        'source_domain',
        acceptCamelCase: true,
      ),
      nonce: json.valueAsBigInt<BigInt?>('nonce', acceptCamelCase: true),
    );
  }

  factory Nonce.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Nonce(
      sourceDomain: decode.getInt<int?>(1),
      nonce: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1Nonce;
}
