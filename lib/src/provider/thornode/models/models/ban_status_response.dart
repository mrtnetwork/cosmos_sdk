import 'package:blockchain_utils/helper/helper.dart';

class ThorBanStatusResponse {
  final String nodeAddress;
  final int blockHeight;
  final List<String> signers;

  ThorBanStatusResponse({
    required this.nodeAddress,
    required this.blockHeight,
    required List<String> signers,
  }) : signers = signers.immutable;

  factory ThorBanStatusResponse.fromJson(Map<String, dynamic> json) {
    return ThorBanStatusResponse(
      nodeAddress: json['node_address'],
      blockHeight: json['block_height'],
      signers: List<String>.from(json['signers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'node_address': nodeAddress,
      'block_height': blockHeight,
      'signers': signers,
    };
  }
}
