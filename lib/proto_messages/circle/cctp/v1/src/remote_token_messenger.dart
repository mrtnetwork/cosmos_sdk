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
///  * @param domain_id
///  * @param address
class RemoteTokenMessenger extends CosmosProtoMessage {
  final int? domainId;

  final BuBytes? address;

  RemoteTokenMessenger({this.domainId, List<int>? address})
    : address = address?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [domainId, address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'domain_id': domainId, 'address': config.encodeBinary(address)};
  }

  factory RemoteTokenMessenger.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RemoteTokenMessenger(
      domainId: json.valueAsInt<int?>(
        'domain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      address: config.decodeBinary<List<int>?>(
        json.valueAs('address', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory RemoteTokenMessenger.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RemoteTokenMessenger(
      domainId: decode.getInt<int?>(1),
      address: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1RemoteTokenMessenger;
}
