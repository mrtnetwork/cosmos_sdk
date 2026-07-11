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
///  * TokenPair is used to look up the Noble token (i.e. "uusdc") from a remote
///  * domain token address Multiple remote_domain + remote_token pairs can map to
///  * the same local_token
///  *
///  * @param remote_domain the remote domain_id corresponding to the token
///  * @param remote_token the remote token address
///  * @param local_token the corresponding Noble token denom in uunits
class TokenPair extends CosmosProtoMessage {
  final int? remoteDomain;

  final List<int>? remoteToken;

  final String? localToken;

  const TokenPair({this.remoteDomain, this.remoteToken, this.localToken});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint32(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [remoteDomain, remoteToken, localToken];

  @override
  Map<String, dynamic> toJson() {
    return {
      'remote_domain': remoteDomain,
      'remote_token': switch (remoteToken) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'local_token': localToken,
    };
  }

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    return TokenPair(
      remoteDomain: json.valueAsInt<int?>(
        'remote_domain',
        acceptCamelCase: true,
      ),
      remoteToken: json.valueAsBytes<List<int>?>(
        'remote_token',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      localToken: json.valueAsString<String?>(
        'local_token',
        acceptCamelCase: true,
      ),
    );
  }

  factory TokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TokenPair(
      remoteDomain: decode.getInt<int?>(1),
      remoteToken: decode.getBytes<List<int>?>(2),
      localToken: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1TokenPair;
}
