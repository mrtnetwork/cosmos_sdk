// ignore_for_file: avoid_print

import 'dart:io';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:onchain_proto/onchain_proto.dart';

class CosmosPackageRegistryBuilderTarget {
  final String output;
  final String className;
  final String typeName;
  const CosmosPackageRegistryBuilderTarget({
    required this.output,
    required this.className,
    required this.typeName,
  });
}

class CosmosPackageRegisteryBuilder {
  final List<ProtoWritePackageResult> packages;
  final CosmosPackageRegistryBuilderTarget target;
  final List<String> imports;
  const CosmosPackageRegisteryBuilder({
    required this.packages,
    required this.target,
    this.imports = const [],
  });
  void _writeTypeUrl() {
    final buf = StringBuffer();
    // final messages = packages;
    buf.writeln("import 'package:cosmos_sdk/sdk/exception/exception.dart';");
    buf.writeln(
      "import 'package:cosmos_sdk/sdk/serialization/serialization.dart';",
    );
    buf.writeln("import 'package:blockchain_utils/blockchain_utils.dart';");
    buf.writeln(
      'enum DefaultCosmosProtoTypeUrl implements CosmosProtoTypeUrl {',
    );
    final messages =
        packages
            .expand((e) => e.files)
            .expand((e) => e.fileData.classInfo)
            .toList();
    // final
    for (final i in messages.indexed) {
      final msg = i.$2;
      final isLast = i.$1 == messages.length - 1;
      final name = OnChainProtoUtils.snakeToCamel(
        "${msg.package}.${msg.message.fullName()}".replaceAll(".", "_"),
        capitalizeFirst: false,
      );
      String? serviceUrl;
      final service = msg.message.services.firstOrNull;
      if (service != null) {
        serviceUrl = "/${msg.package}.${service.fullName()}";
      }

      final amino =
          msg.message.options.firstWhereNullable((e) => e.name == "amino.name")
              as ProtoOptionString?;
      buf.writeln(
        "  $name(typeUrl: '${msg.typeUrl}',${serviceUrl == null ? '' : 'serviceUrl: "$serviceUrl",'}${amino == null ? '' : 'aminoType: "${amino.value}"'})${isLast ? ';' : ','}",
      );
    }
    buf.writeln('@override');
    buf.writeln('final String typeUrl;');
    buf.writeln('@override');
    buf.writeln('final String? aminoType;');
    buf.writeln('@override');
    buf.writeln('final String? serviceUrl;');
    buf.writeln(
      ' const DefaultCosmosProtoTypeUrl({required this.typeUrl, this.aminoType, this.serviceUrl});',
    );
    buf.writeln('  static DefaultCosmosProtoTypeUrl? fromUrl(String? value) {');
    buf.writeln(
      '    return DefaultCosmosProtoTypeUrl.values.firstWhereNullable(',
    );
    buf.writeln(
      '      (e) => e.typeUrl == value || e.aminoType == value || e.serviceUrl == value,',
    );
    buf.writeln('    );');
    buf.writeln('  }');
    buf.writeln('@override');
    buf.writeln(' String getServiceUrl() {');
    buf.writeln('    final serviceUrl = this.serviceUrl;');
    buf.writeln(
      'if (serviceUrl == null) {throw DartCosmosSdkPluginException("Missing service url.", details: {"type_url": typeUrl}, ); }',
    );
    buf.writeln('return serviceUrl;');
    buf.writeln('  }');
    buf.writeln('@override');
    buf.writeln(' String getAminoType() {');
    buf.writeln('    final aminoType = this.aminoType;');
    buf.writeln(
      'if (aminoType == null) {throw DartCosmosSdkPluginException("Missing amino type name.", details: {"type_url": typeUrl}, ); }',
    );
    buf.writeln('return aminoType;');
    buf.writeln('  }');

    buf.writeln('}');
    File("lib/proto_messages/types.dart")
      ..createSync(recursive: true)
      ..writeAsStringSync(buf.toString());
  }

  void _write() {
    final buf = StringBuffer();
    final dartName = OnChainProtoUtils.className(target.className);
    final typeName = OnChainProtoUtils.className(target.typeName);
    final messages = packages;
    Set<String> allImports = {};
    void addImport(String url, {String? refrence}) {
      if (refrence != null) {
        allImports.add("import '$url' as ${refrence.replaceAll(".", "_")};");
        return;
      }
      allImports.add("import '$url';");
    }

    addImport("package:cosmos_sdk/proto_messages/types.dart");

    for (final i in imports) {
      addImport(i);
    }
    buf.writeln('class $dartName { ');
    buf.writeln(
      '  static $typeName? fromJson(String typeUrl, {List<int>? bytes, Map<String,dynamic>? json}) {',
    );
    buf.writeln("assert(bytes != null || json != null);");
    buf.writeln("if(bytes==null && json ==null) return null;");
    buf.writeln("final type = DefaultCosmosProtoTypeUrl.fromUrl(typeUrl);");
    buf.writeln("if(type==null) return null;");
    buf.writeln("switch (type) {");
    for (final n in messages) {
      for (final i in n.files) {
        for (final msg in i.fileData.classInfo) {
          String getter = "${n.package.replaceAll(".", "_")}.";
          if (msg.message.name == "Any") {
            getter = "";
          }
          addImport(n.srcUrl, refrence: n.package);
          final name = OnChainProtoUtils.snakeToCamel(
            "${msg.package}.${msg.message.fullName()}".replaceAll(".", "_"),
            capitalizeFirst: false,
          );
          buf.writeln('         case DefaultCosmosProtoTypeUrl.$name:');
          buf.writeln("return switch(json){");
          buf.writeln(
            "Map<String, dynamic> json =>$getter${msg.className}.fromJson(json),",
          );
          buf.writeln("_ =>$getter${msg.className}.deserialize(bytes!)");
          buf.writeln("};");
        }
      }
    }
    buf.writeln("}");
    buf.writeln("}");
    buf.writeln("}");
    final fBuf = StringBuffer();
    for (var e in allImports) {
      fBuf.writeln(e);
    }
    fBuf.writeln(buf.toString());
    File(target.output)
      ..createSync(recursive: true)
      ..writeAsStringSync(fBuf.toString());
  }

  void write() {
    _write();
    _writeTypeUrl();
  }
}

class CosmosProtoPackagesBuilder {
  final ProtoCompiler resolver;
  const CosmosProtoPackagesBuilder._({required this.resolver});
  factory CosmosProtoPackagesBuilder() {
    final resolver = ProtoCompiler.fromDirectory(
      writer: ProtoPackageWriter(
        skipFiles: [
          ProtoWriteSkipFile(
            protoPath: "proto/google/protobuf/any.proto",
            importUri: "package:cosmos_sdk/sdk/serialization/buffer/any.dart",
            allowInSrc: false,
          ),
        ],
        packageRoot: "package:cosmos_sdk/proto_messages",
        outputRoot: "lib/proto_messages",
        overrides: [
          ProtoPackagePathOverride(
            packageRoot: "package:cosmos_sdk/proto_messages/thorchain",
            outputRoot: "lib/proto_messages/thorchain",
            packages: ["types", "common"],
          ),
        ],
      ),
      sourceDirectory: "proto",
    );
    return CosmosProtoPackagesBuilder._(resolver: resolver);
  }
  void compile() {
    resolver.compile(onlyRefrences: true);
    final result = resolver.writeAll();
    final registeryBuilder = CosmosPackageRegisteryBuilder(
      packages: result,
      imports: ['package:cosmos_sdk/sdk/serialization/serialization.dart'],
      target: CosmosPackageRegistryBuilderTarget(
        output: "lib/proto_messages/registery.dart",
        className: "CosmosMessageRegistry",
        typeName: "CosmosProtoMessage",
      ),
    );
    registeryBuilder.write();
  }
}

void main() {
  final compiler = CosmosProtoPackagesBuilder();
  print("Compiling...");
  compiler.compile();
  _cleanUpImports();
}

void _cleanUpImports() {
  print("Clean up imports...");
  _process(args: ["fix", "--apply", "--code=unused_import"]);
  print("Format dart code...");
  _process(args: ["format", "."]);
}

void _process({
  String command = "dart",
  List<String> args = const ["fix", "--apply", "--code=unused_import"],
  String? workingDirectory,
}) {
  final process = Process.runSync(
    command,
    args,
    runInShell: Platform.isWindows,
    workingDirectory: workingDirectory,
  );
  final exitCode = process.exitCode;
  assert(exitCode == 0, "Dart fix failed with exit code $exitCode");
}
