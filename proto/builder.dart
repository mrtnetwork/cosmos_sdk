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
      builder: CosmosProtoCodegenTarget(),
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

class CosmosProtoCodegenTarget extends DefaultProtoCodegenTarget {
  @override
  String get messageBaseClassName => "CosmosProtoMessage";
  static const List<String> alwaysIncludedPackagePrefixes = [
    "injective.crypto",
    "cosmos.evm.crypto",
    "cosmos.crypto",
    "cosmos.tx",
    "ethermint.crypto",
    "injective.crypto.v1beta1.ethsecp256k1",
    "stratos.crypto.v1.ethsecp256k1",
    "initia.crypto.v1beta1.ethsecp256k1",
  ];
  static const List<String> suppressedOptionPrefixes = [
    "gogoproto",
    "cosmos_proto.scalar",
    "cosmos_proto.method_added_in",
    "cosmos_proto.implements_interface",
    "cosmos_proto.accepts_interface",
    "cosmos_proto.accepts_interface",
    "cosmos_proto.message_added_in",
  ];

  static const List<String> knownQueryServices = [
    "Query",
    "ABCIListenerService",
    "Service",
    "ReflectionService",
    "QueryService",
  ];
  static const List<String> knownTxServices = [
    "Msg",
    "ABCI",
    "MsgCreator",
    "SQSIngester",
    "Stream",
    "LocalhostBifrost",
  ];

  static const queryMixinName = "ICosmosProtoQueryMessage";
  static const serviceMixinName = "ICosmosProtoServiceMessage";
  static const aminoMixinName = "ICosmosProtoAminoMessage";
  static const aminoOptionKey = "amino.name";

  const CosmosProtoCodegenTarget();

  @override
  List<ProtoOption> filterFieldOptions(ProtoField field) {
    return field.options
        .where(
          (e) => !(suppressedOptionPrefixes.any((f) => e.name.startsWith(f))),
        )
        .toList();
  }

  @override
  List<ProtoOption> filterMessageOptions(
    ProtoMessage message,
    List<ServiceMessageOption> services,
  ) {
    final List<ProtoOption> options = [
      ...message.options,
      ...services.expand((e) => e.rpc.options),
    ];
    return options
        .where(
          (e) => !(suppressedOptionPrefixes.any((f) => e.name.startsWith(f))),
        )
        .toList();
  }

  @override
  List<String> defaultImports(ProtoFile file) {
    return [
      ...super.defaultImports(file),
      "package:cosmos_sdk/proto_messages/types.dart",
      "package:cosmos_sdk/sdk/serialization/serialization.dart",
    ];
  }

  @override
  List<String> mixinsFor(
    ProtoMessage message,
    ProtoCompiler resolver,
    Set<ProtoTypeLocation> importRefrences,
  ) {
    if (message.services.isEmpty) return [];
    List<String> mixins = [];
    bool hasQuery = false;
    bool hasTx = false;
    for (final i in message.services) {
      if (!hasQuery && knownQueryServices.contains(i.serviceName)) {
        mixins.add(
          '$queryMixinName<${ProtoRuntimeTypeMapper.bareDartType(type: i.type, importRefrences: importRefrences, resolver: resolver)}>',
        );
        hasQuery = true;
        continue;
      }
      if (!hasTx && knownTxServices.contains(i.serviceName)) {
        mixins.add(
          '$serviceMixinName<${ProtoRuntimeTypeMapper.bareDartType(type: i.type, importRefrences: importRefrences, resolver: resolver)}>',
        );
        hasTx = true;
      }
    }
    if (message.hasOption(aminoOptionKey)) {
      mixins.add(aminoMixinName);
    }

    return mixins;
  }

  @override
  String buildExtraMembers(
    ProtoMessage message,
    ProtoCompiler resolver,
    Set<ProtoTypeLocation> importRefrences,
  ) {
    // Deliberately built from the proto package + declaration name only
    // (never OnChainProtoUtils.className / classNamePrefix), so this stays a
    // stable cross-run identifier even when classNamePrefix changes what
    // the generated Dart class itself is called.
    final name = OnChainProtoUtils.snakeToCamel(
      "${message.package}.${message.fullName()}".replaceAll(".", "_"),
      capitalizeFirst: false,
    );
    final buf = StringBuffer();
    buf.writeln('  @override');
    buf.writeln(
      'DefaultCosmosProtoTypeUrl get declarationId => DefaultCosmosProtoTypeUrl.$name;',
    );

    final queryService = message.services.firstWhereNullable(
      (e) => knownQueryServices.contains(e.serviceName),
    );
    if (queryService != null) {
      final query = queryService.type;
      buf.writeln('  @override');
      buf.writeln(
        '  ${ProtoRuntimeTypeMapper.bareDartType(type: query, importRefrences: importRefrences, resolver: resolver)} onQueryResponse(List<int> bytes) {',
      );
      buf.writeln(
        "    return ${ProtoRuntimeTypeMapper.bareDartType(type: query, importRefrences: importRefrences, resolver: resolver)}.deserialize(bytes);",
      );
      buf.writeln('  }');
      buf.writeln('  @override');
      buf.writeln(
        '  ${ProtoRuntimeTypeMapper.bareDartType(type: query, importRefrences: importRefrences, resolver: resolver)} onQueryResponseJson(Map<String, dynamic> json) {',
      );
      buf.writeln(
        "     return ${ProtoRuntimeTypeMapper.bareDartType(type: query, importRefrences: importRefrences, resolver: resolver)}.fromJson(json);",
      );
      buf.writeln('  }');
    }
    final txService = message.services.firstWhereNullable(
      (e) => knownTxServices.contains(e.serviceName),
    );
    if (txService != null) {
      final request = txService.type;
      buf.writeln('  @override');
      buf.writeln(
        '  ${ProtoRuntimeTypeMapper.bareDartType(type: request, importRefrences: importRefrences, resolver: resolver)} onServiceResponse(List<int> bytes) {',
      );
      buf.writeln(
        "     return ${ProtoRuntimeTypeMapper.bareDartType(type: request, importRefrences: importRefrences, resolver: resolver)}.deserialize(bytes);",
      );
      buf.writeln('  }');
      buf.writeln('  @override');
      buf.writeln(
        '  ${ProtoRuntimeTypeMapper.bareDartType(type: request, importRefrences: importRefrences, resolver: resolver)} onServiceResponseJson(Map<String, dynamic> json) {',
      );
      buf.writeln(
        "      return ${ProtoRuntimeTypeMapper.bareDartType(type: request, importRefrences: importRefrences, resolver: resolver)}.fromJson(json);",
      );
      buf.writeln('  }');
    }

    return buf.toString();
  }

  @override
  List<ProtoService> filterServices(List<ProtoService> services) {
    return services
        .where(
          (e) =>
              knownQueryServices.contains(e.name) ||
              knownTxServices.contains(e.name),
        )
        .toList();
  }

  @override
  String? buildToJson(
    ProtoMessage message,
    ProtoCompiler resolver, {
    bool camelCase = false,
    bool allowNullValue = true,
    String configGetter =
        "ProtoJsonConfig config = DefaultProtoJsonConfig.defaultConfig",
  }) {
    return super.buildToJson(
      message,
      resolver,
      camelCase: camelCase,
      allowNullValue: allowNullValue,
      configGetter:
          "CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig",
    );
  }

  @override
  String? buildFromJson(
    ProtoMessage message,
    ProtoCompiler resolver,
    String className,
    Set<ProtoTypeLocation> importRefrences, {
    bool camelCase = false,
    bool defaultOnMissing = true,
    StringBuffer? buf,
    String configGetter =
        "CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig",
  }) {
    // StringBuffer? buf;
    if (OnChainProtoUtils.isGoogleTimestamp(message.package, message.name)) {
      buf ??= StringBuffer();
      buf.writeln('  factory $className.fromRfc3339(String timestamp) {');
      buf.writeln(
        '    final data = ProtoUtils.timestampFromRfc3339(timestamp);',
      );
      buf.writeln(
        '    return $className(seconds: BigInt.from(data.seconds), nanos: data.nanos);',
      );
      buf.writeln('  }');
      buf.writeln();
      buf.writeln('  String toRfc3339()');
      buf.writeln('  {');
      buf.writeln(
        '  return ProtoUtils.timestampToRfc3339(seconds?.asSafeInt ?? 0  ,nanos??0);',
      );
      buf.writeln('  }');
    }
    if (OnChainProtoUtils.isGoogleDuration(message.package, message.name)) {
      buf ??= StringBuffer();
      buf.writeln('  factory $className.fromString(String duration) {');
      buf.writeln(
        '    final data = ProtoUtils.googleDurationFromJson(duration);',
      );
      buf.writeln(
        '    return $className(seconds: data.seconds, nanos: data.nanos);',
      );
      buf.writeln('  }');
      buf.writeln();
      buf.writeln('  String encodeString({bool asNanos = true})');
      buf.writeln('  {');
      buf.writeln(
        '  return ProtoUtils.googleDurationToJson(seconds??BigInt.zero  ,nanos??0, asNanos:asNanos);',
      );
      buf.writeln('  }');
    }

    return super.buildFromJson(
      message,
      resolver,
      className,
      importRefrences,
      configGetter: configGetter,
      camelCase: camelCase,
      buf: buf,
      defaultOnMissing: defaultOnMissing,
    );
  }

  @override
  ({
    List<ProtoMessageRefrence> references,
    List<ProtoDeclaration> declarations,
  })?
  computeReferenceClosure(
    Map<String, GeneratedProtoPackage> generatedPackages,
  ) {
    List<ProtoMessageRefrence> references = [];
    List<ProtoDeclaration> declarations = [];
    List<ProtoMessageRefrence> collectTransitiveReferences(
      ProtoMessageRefrence reference,
    ) {
      final package = generatedPackages[reference.package]!;
      List<ProtoMessageRefrence> nestedReferences = [];
      ProtoDeclaration? declaration;
      for (final i in package.files) {
        declaration ??= i.file.messages.firstWhereNullable(
          (e) => e.isEqualTo(reference),
        );
        declaration ??= i.file.enums.firstWhereNullable(
          (e) => e.isEqualTo(reference),
        );
        if (declaration != null) break;
      }
      if (declarations.contains(declaration)) return [];
      assert(declaration != null);
      if (declaration == null) return nestedReferences;
      declarations.add(declaration);
      final r = declaration.refTypes();
      for (final i in r) {
        nestedReferences.addAll(collectTransitiveReferences(i));
      }
      return nestedReferences;
    }

    // Seed the closure: messages that already carry a service (RPC
    // request/response types are always relevant) plus everything in a
    // target's always-included packages (e.g. crypto key types that get
    // referenced only via `Any`, so no ordinary field reference would
    // otherwise pull them in).
    List<ProtoMessageRefrence> seedReferences = [];
    for (final i in generatedPackages.values) {
      for (final f in i.files) {
        final bool alwaysIncluded = alwaysIncludedPackagePrefixes.any(
          (e) => f.file.package.startsWith(e),
        );
        for (final m in f.file.messages) {
          if (m.services.isNotEmpty || alwaysIncluded) {
            seedReferences.addAll(m.refTypes());
            declarations.add(m);
          }
        }
      }
    }

    references = List.from(seedReferences, growable: true);
    for (final i in seedReferences) {
      references.addAll(collectTransitiveReferences(i));
    }
    return (references: references, declarations: declarations);
  }
}
