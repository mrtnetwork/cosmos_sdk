import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Extensions for tooling.
/// The full set of known editions.
enum Edition implements ProtoEnumVariant {
  /// A placeholder for an unknown edition value.
  editionUnknown(0, 'EDITION_UNKNOWN'),

  /// A placeholder edition for specifying default behaviors *before* a feature
  /// was first introduced.  This is effectively an "infinite past".
  editionLegacy(900, 'EDITION_LEGACY'),

  /// Legacy syntax "editions".  These pre-date editions, but behave much like
  /// distinct editions.  These can't be used to specify the edition of proto
  /// files, but feature definitions must supply proto2/proto3 defaults for
  /// backwards compatibility.
  editionProto2(998, 'EDITION_PROTO2'),
  editionProto3(999, 'EDITION_PROTO3'),

  /// Editions that have been released.  The specific values are arbitrary and
  /// should not be depended on, but they will always be time-ordered for easy
  /// comparison.
  edition2023(1000, 'EDITION_2023'),
  edition2024(1001, 'EDITION_2024'),

  /// A placeholder edition for developing and testing unscheduled features.
  editionUnstable(9999, 'EDITION_UNSTABLE'),

  /// Placeholder editions for testing feature resolution.  These should not be
  /// used or relied on outside of tests.
  edition1TestOnly(1, 'EDITION_1_TEST_ONLY'),
  edition2TestOnly(2, 'EDITION_2_TEST_ONLY'),
  edition99997TestOnly(99997, 'EDITION_99997_TEST_ONLY'),
  edition99998TestOnly(99998, 'EDITION_99998_TEST_ONLY'),
  edition99999TestOnly(99999, 'EDITION_99999_TEST_ONLY'),

  /// Placeholder for specifying unbounded edition support.  This should only
  /// ever be used by plugins that can expect to never require any changes to
  /// support a new edition.
  editionMax(2147483647, 'EDITION_MAX');

  const Edition(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static Edition fromValue(int? value) {
    return Edition.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ItemNotFoundException(name: "Edition", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static Edition from(Object? value) {
    return Edition.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse: () => throw ItemNotFoundException(name: "Edition", value: value),
    );
  }
}

/// The verification state of the extension range.
enum ExtensionRangeOptionsVerificationState implements ProtoEnumVariant {
  /// All the extensions of the range must be declared.
  declaration(0, 'DECLARATION'),
  unverified(1, 'UNVERIFIED');

  const ExtensionRangeOptionsVerificationState(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ExtensionRangeOptionsVerificationState fromValue(int? value) {
    return ExtensionRangeOptionsVerificationState.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ExtensionRangeOptionsVerificationState",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ExtensionRangeOptionsVerificationState from(Object? value) {
    return ExtensionRangeOptionsVerificationState.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "ExtensionRangeOptionsVerificationState",
                value: value,
              ),
    );
  }
}

enum FieldDescriptorProtoType implements ProtoEnumVariant {
  /// 0 is reserved for errors.
  /// Order is weird for historical reasons.
  typeDouble(1, 'TYPE_DOUBLE'),
  typeFloat(2, 'TYPE_FLOAT'),

  /// Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT64 if
  /// negative values are likely.
  typeInt64(3, 'TYPE_INT64'),
  typeUint64(4, 'TYPE_UINT64'),

  /// Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT32 if
  /// negative values are likely.
  typeInt32(5, 'TYPE_INT32'),
  typeFixed64(6, 'TYPE_FIXED64'),
  typeFixed32(7, 'TYPE_FIXED32'),
  typeBool(8, 'TYPE_BOOL'),
  typeString(9, 'TYPE_STRING'),

  /// Tag-delimited aggregate.
  /// Group type is deprecated and not supported after google.protobuf. However, Proto3
  /// implementations should still be able to parse the group wire format and
  /// treat group fields as unknown fields.  In Editions, the group wire format
  /// can be enabled via the `message_encoding` feature.
  typeGroup(10, 'TYPE_GROUP'),
  typeMessage(11, 'TYPE_MESSAGE'),

  /// Length-delimited aggregate.
  /// New in version 2.
  typeBytes(12, 'TYPE_BYTES'),
  typeUint32(13, 'TYPE_UINT32'),
  typeEnum(14, 'TYPE_ENUM'),
  typeSfixed32(15, 'TYPE_SFIXED32'),
  typeSfixed64(16, 'TYPE_SFIXED64'),
  typeSint32(17, 'TYPE_SINT32'),

  /// Uses ZigZag encoding.
  typeSint64(18, 'TYPE_SINT64');

  const FieldDescriptorProtoType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FieldDescriptorProtoType fromValue(int? value) {
    return FieldDescriptorProtoType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldDescriptorProtoType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FieldDescriptorProtoType from(Object? value) {
    return FieldDescriptorProtoType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldDescriptorProtoType",
                value: value,
              ),
    );
  }
}

/// Uses ZigZag encoding.
enum FieldDescriptorProtoLabel implements ProtoEnumVariant {
  /// 0 is reserved for errors
  labelOptional(1, 'LABEL_OPTIONAL'),
  labelRepeated(3, 'LABEL_REPEATED'),

  /// The required label is only allowed in google.protobuf.  In proto3 and Editions
  /// it's explicitly prohibited.  In Editions, the `field_presence` feature
  /// can be used to get this behavior.
  labelRequired(2, 'LABEL_REQUIRED');

  const FieldDescriptorProtoLabel(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FieldDescriptorProtoLabel fromValue(int? value) {
    return FieldDescriptorProtoLabel.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldDescriptorProtoLabel",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FieldDescriptorProtoLabel from(Object? value) {
    return FieldDescriptorProtoLabel.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldDescriptorProtoLabel",
                value: value,
              ),
    );
  }
}

/// Generated classes can be optimized for speed or code size.
enum FileOptionsOptimizeMode implements ProtoEnumVariant {
  speed(1, 'SPEED'),

  /// Generate complete code for parsing, serialization,
  /// etc.
  codeSize(2, 'CODE_SIZE'),

  /// Use ReflectionOps to implement these methods.
  liteRuntime(3, 'LITE_RUNTIME');

  const FileOptionsOptimizeMode(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FileOptionsOptimizeMode fromValue(int? value) {
    return FileOptionsOptimizeMode.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FileOptionsOptimizeMode",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FileOptionsOptimizeMode from(Object? value) {
    return FileOptionsOptimizeMode.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FileOptionsOptimizeMode",
                value: value,
              ),
    );
  }
}

/// deprecated = true,
enum FieldOptionsCType implements ProtoEnumVariant {
  /// Default mode.
  string(0, 'STRING'),

  /// The option [ctype=CORD] may be applied to a non-repeated field of type
  /// "bytes". It indicates that in C++, the data should be stored in a Cord
  /// instead of a string.  For very large strings, this may reduce memory
  /// fragmentation. It may also allow better performance when parsing from a
  /// Cord, or when parsing with aliasing enabled, as the parsed Cord may then
  /// alias the original buffer.
  cord(1, 'CORD'),
  stringPiece(2, 'STRING_PIECE');

  const FieldOptionsCType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FieldOptionsCType fromValue(int? value) {
    return FieldOptionsCType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldOptionsCType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FieldOptionsCType from(Object? value) {
    return FieldOptionsCType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldOptionsCType",
                value: value,
              ),
    );
  }
}

enum FieldOptionsJSType implements ProtoEnumVariant {
  /// Use the default type.
  jsNormal(0, 'JS_NORMAL'),

  /// Use JavaScript strings.
  jsString(1, 'JS_STRING'),

  /// Use JavaScript numbers.
  jsNumber(2, 'JS_NUMBER');

  const FieldOptionsJSType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FieldOptionsJSType fromValue(int? value) {
    return FieldOptionsJSType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldOptionsJSType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FieldOptionsJSType from(Object? value) {
    return FieldOptionsJSType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldOptionsJSType",
                value: value,
              ),
    );
  }
}

/// If set to RETENTION_SOURCE, the option will be omitted from the binary.
enum FieldOptionsOptionRetention implements ProtoEnumVariant {
  retentionUnknown(0, 'RETENTION_UNKNOWN'),
  retentionRuntime(1, 'RETENTION_RUNTIME'),
  retentionSource(2, 'RETENTION_SOURCE');

  const FieldOptionsOptionRetention(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FieldOptionsOptionRetention fromValue(int? value) {
    return FieldOptionsOptionRetention.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldOptionsOptionRetention",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FieldOptionsOptionRetention from(Object? value) {
    return FieldOptionsOptionRetention.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldOptionsOptionRetention",
                value: value,
              ),
    );
  }
}

/// This indicates the types of entities that the field may apply to when used
/// as an option. If it is unset, then the field may be freely used as an
/// option on any kind of entity.
enum FieldOptionsOptionTargetType implements ProtoEnumVariant {
  targetTypeUnknown(0, 'TARGET_TYPE_UNKNOWN'),
  targetTypeFile(1, 'TARGET_TYPE_FILE'),
  targetTypeExtensionRange(2, 'TARGET_TYPE_EXTENSION_RANGE'),
  targetTypeMessage(3, 'TARGET_TYPE_MESSAGE'),
  targetTypeField(4, 'TARGET_TYPE_FIELD'),
  targetTypeOneof(5, 'TARGET_TYPE_ONEOF'),
  targetTypeEnum(6, 'TARGET_TYPE_ENUM'),
  targetTypeEnumEntry(7, 'TARGET_TYPE_ENUM_ENTRY'),
  targetTypeService(8, 'TARGET_TYPE_SERVICE'),
  targetTypeMethod(9, 'TARGET_TYPE_METHOD');

  const FieldOptionsOptionTargetType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FieldOptionsOptionTargetType fromValue(int? value) {
    return FieldOptionsOptionTargetType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldOptionsOptionTargetType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FieldOptionsOptionTargetType from(Object? value) {
    return FieldOptionsOptionTargetType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FieldOptionsOptionTargetType",
                value: value,
              ),
    );
  }
}

/// Is this method side-effect-free (or safe in HTTP parlance), or idempotent,
/// or neither? HTTP based RPC implementation may choose GET verb for safe
/// methods, and PUT verb for idempotent methods instead of the default POST.
enum MethodOptionsIdempotencyLevel implements ProtoEnumVariant {
  idempotencyUnknown(0, 'IDEMPOTENCY_UNKNOWN'),
  noSideEffects(1, 'NO_SIDE_EFFECTS'),

  /// implies idempotent
  idempotent(2, 'IDEMPOTENT');

  const MethodOptionsIdempotencyLevel(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static MethodOptionsIdempotencyLevel fromValue(int? value) {
    return MethodOptionsIdempotencyLevel.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "MethodOptionsIdempotencyLevel",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static MethodOptionsIdempotencyLevel from(Object? value) {
    return MethodOptionsIdempotencyLevel.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "MethodOptionsIdempotencyLevel",
                value: value,
              ),
    );
  }
}

enum FeatureSetFieldPresence implements ProtoEnumVariant {
  fieldPresenceUnknown(0, 'FIELD_PRESENCE_UNKNOWN'),
  explicit(1, 'EXPLICIT'),
  implicit(2, 'IMPLICIT'),
  legacyRequired(3, 'LEGACY_REQUIRED');

  const FeatureSetFieldPresence(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FeatureSetFieldPresence fromValue(int? value) {
    return FeatureSetFieldPresence.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetFieldPresence",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FeatureSetFieldPresence from(Object? value) {
    return FeatureSetFieldPresence.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetFieldPresence",
                value: value,
              ),
    );
  }
}

enum FeatureSetEnumType implements ProtoEnumVariant {
  enumTypeUnknown(0, 'ENUM_TYPE_UNKNOWN'),
  open(1, 'OPEN'),
  closed(2, 'CLOSED');

  const FeatureSetEnumType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FeatureSetEnumType fromValue(int? value) {
    return FeatureSetEnumType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetEnumType",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FeatureSetEnumType from(Object? value) {
    return FeatureSetEnumType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetEnumType",
                value: value,
              ),
    );
  }
}

enum FeatureSetRepeatedFieldEncoding implements ProtoEnumVariant {
  repeatedFieldEncodingUnknown(0, 'REPEATED_FIELD_ENCODING_UNKNOWN'),
  packed(1, 'PACKED'),
  expanded(2, 'EXPANDED');

  const FeatureSetRepeatedFieldEncoding(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FeatureSetRepeatedFieldEncoding fromValue(int? value) {
    return FeatureSetRepeatedFieldEncoding.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetRepeatedFieldEncoding",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FeatureSetRepeatedFieldEncoding from(Object? value) {
    return FeatureSetRepeatedFieldEncoding.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetRepeatedFieldEncoding",
                value: value,
              ),
    );
  }
}

enum FeatureSetUtf8Validation implements ProtoEnumVariant {
  utf8ValidationUnknown(0, 'UTF8_VALIDATION_UNKNOWN'),
  verify(2, 'VERIFY'),
  none(3, 'NONE');

  const FeatureSetUtf8Validation(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FeatureSetUtf8Validation fromValue(int? value) {
    return FeatureSetUtf8Validation.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetUtf8Validation",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FeatureSetUtf8Validation from(Object? value) {
    return FeatureSetUtf8Validation.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetUtf8Validation",
                value: value,
              ),
    );
  }
}

enum FeatureSetMessageEncoding implements ProtoEnumVariant {
  messageEncodingUnknown(0, 'MESSAGE_ENCODING_UNKNOWN'),
  lengthPrefixed(1, 'LENGTH_PREFIXED'),
  delimited(2, 'DELIMITED');

  const FeatureSetMessageEncoding(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FeatureSetMessageEncoding fromValue(int? value) {
    return FeatureSetMessageEncoding.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetMessageEncoding",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FeatureSetMessageEncoding from(Object? value) {
    return FeatureSetMessageEncoding.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetMessageEncoding",
                value: value,
              ),
    );
  }
}

enum FeatureSetJsonFormat implements ProtoEnumVariant {
  jsonFormatUnknown(0, 'JSON_FORMAT_UNKNOWN'),
  allow(1, 'ALLOW'),
  legacyBestEffort(2, 'LEGACY_BEST_EFFORT');

  const FeatureSetJsonFormat(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FeatureSetJsonFormat fromValue(int? value) {
    return FeatureSetJsonFormat.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetJsonFormat",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FeatureSetJsonFormat from(Object? value) {
    return FeatureSetJsonFormat.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetJsonFormat",
                value: value,
              ),
    );
  }
}

enum FeatureSetEnforceNamingStyle implements ProtoEnumVariant {
  enforceNamingStyleUnknown(0, 'ENFORCE_NAMING_STYLE_UNKNOWN'),
  style2024(1, 'STYLE2024'),
  styleLegacy(2, 'STYLE_LEGACY');

  const FeatureSetEnforceNamingStyle(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FeatureSetEnforceNamingStyle fromValue(int? value) {
    return FeatureSetEnforceNamingStyle.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetEnforceNamingStyle",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FeatureSetEnforceNamingStyle from(Object? value) {
    return FeatureSetEnforceNamingStyle.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetEnforceNamingStyle",
                value: value,
              ),
    );
  }
}

enum FeatureSetVisibilityFeatureDefaultSymbolVisibility
    implements ProtoEnumVariant {
  defaultSymbolVisibilityUnknown(0, 'DEFAULT_SYMBOL_VISIBILITY_UNKNOWN'),

  /// Default pre-EDITION_2024, all UNSET visibility are export.
  exportAll(1, 'EXPORT_ALL'),

  /// All top-level symbols default to export, nested default to local.
  exportTopLevel(2, 'EXPORT_TOP_LEVEL'),

  /// All symbols default to local.
  localAll(3, 'LOCAL_ALL'),

  /// All symbols local by default. Nested types cannot be exported.
  /// With special case caveat for message { enum {} reserved 1 to max; }
  /// This is the recommended setting for new protos.
  strict(4, 'STRICT');

  const FeatureSetVisibilityFeatureDefaultSymbolVisibility(
    this.value,
    this.protoName,
  );

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static FeatureSetVisibilityFeatureDefaultSymbolVisibility fromValue(
    int? value,
  ) {
    return FeatureSetVisibilityFeatureDefaultSymbolVisibility.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetVisibilityFeatureDefaultSymbolVisibility",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static FeatureSetVisibilityFeatureDefaultSymbolVisibility from(
    Object? value,
  ) {
    return FeatureSetVisibilityFeatureDefaultSymbolVisibility.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "FeatureSetVisibilityFeatureDefaultSymbolVisibility",
                value: value,
              ),
    );
  }
}

/// Describes the 'visibility' of a symbol with respect to the proto import
/// system. Symbols can only be imported when the visibility rules do not prevent
/// it (ex: local symbols cannot be imported).  Visibility modifiers can only set
/// on `message` and `enum` as they are the only types available to be referenced
/// from other files.
enum SymbolVisibility implements ProtoEnumVariant {
  visibilityUnset(0, 'VISIBILITY_UNSET'),
  visibilityLocal(1, 'VISIBILITY_LOCAL'),
  visibilityExport(2, 'VISIBILITY_EXPORT');

  const SymbolVisibility(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static SymbolVisibility fromValue(int? value) {
    return SymbolVisibility.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "SymbolVisibility",
                value: value,
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static SymbolVisibility from(Object? value) {
    return SymbolVisibility.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(
                name: "SymbolVisibility",
                value: value,
              ),
    );
  }
}

/// Describes a complete .proto file.
class FileDescriptorProto extends CosmosProtoMessage {
  final String? name;

  /// file name, relative to root of source tree
  final String? package;

  /// e.g. "foo", "foo.bar", etc.
  /// Names of files imported by this file.
  final List<String> dependency;

  /// Indexes of the public imported files in the dependency list above.
  final List<int> publicDependency;

  /// Indexes of the weak imported files in the dependency list.
  /// For Google-internal migration only. Do not use.
  final List<int> weakDependency;

  /// Names of files imported by this file purely for the purpose of providing
  /// option extensions. These are excluded from the dependency list above.
  final List<String> optionDependency;

  /// All top-level definitions in this file.
  final List<DescriptorProto> messageType;

  final List<EnumDescriptorProto> enumType;

  final List<ServiceDescriptorProto> service;

  final List<FieldDescriptorProto> extension_;

  final FileOptions? options;

  /// This field contains optional information about the original source code.
  /// You may safely remove this entire field without harming runtime
  /// functionality of the descriptors -- the information is needed only by
  /// development tools.
  final SourceCodeInfo? sourceCodeInfo;

  /// The syntax of the proto file.
  /// The supported values are "proto2", "proto3", and "editions".
  ///
  /// If `edition` is present, this value must be "editions".
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final String? syntax;

  /// The edition of the proto file.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final Edition? edition;

  const FileDescriptorProto({
    this.name,
    this.package,
    this.dependency = const [],
    this.publicDependency = const [],
    this.weakDependency = const [],
    this.optionDependency = const [],
    this.messageType = const [],
    this.enumType = const [],
    this.service = const [],
    this.extension_ = const [],
    this.options,
    this.sourceCodeInfo,
    this.syntax,
    this.edition,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.string(2, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.int32,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 11,
          elementType: ProtoFieldType.int32,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 15,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(8, hasOptionalFlags: true),
        ProtoFieldConfig.message(9, hasOptionalFlags: true),
        ProtoFieldConfig.string(12, hasOptionalFlags: true),
        ProtoFieldConfig.enumType(14, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    package,
    dependency,
    publicDependency,
    weakDependency,
    optionDependency,
    messageType,
    enumType,
    service,
    extension_,
    options,
    sourceCodeInfo,
    syntax,
    edition,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'package': package,
      'dependency': dependency.map((e) => e).toList(),
      'public_dependency': publicDependency.map((e) => e).toList(),
      'weak_dependency': weakDependency.map((e) => e).toList(),
      'option_dependency': optionDependency.map((e) => e).toList(),
      'message_type': messageType.map((e) => e.toJson()).toList(),
      'enum_type': enumType.map((e) => e.toJson()).toList(),
      'service': service.map((e) => e.toJson()).toList(),
      'extension': extension_.map((e) => e.toJson()).toList(),
      'options': options?.toJson(),
      'source_code_info': sourceCodeInfo?.toJson(),
      'syntax': syntax,
      'edition': edition?.protoName,
    };
  }

  factory FileDescriptorProto.fromJson(Map<String, dynamic> json) {
    return FileDescriptorProto(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      package: json.valueAsString<String?>('package', acceptCamelCase: true),
      dependency:
          (json.valueEnsureAsList<dynamic>(
            'dependency',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      publicDependency:
          (json.valueEnsureAsList<dynamic>(
            'public_dependency',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsInt<int>(e)).toList(),
      weakDependency:
          (json.valueEnsureAsList<dynamic>(
            'weak_dependency',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsInt<int>(e)).toList(),
      optionDependency:
          (json.valueEnsureAsList<dynamic>(
            'option_dependency',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      messageType:
          (json.valueEnsureAsList<dynamic>(
                'message_type',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<DescriptorProto, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => DescriptorProto.fromJson(v),
                    ),
              )
              .toList(),
      enumType:
          (json.valueEnsureAsList<dynamic>('enum_type', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  EnumDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => EnumDescriptorProto.fromJson(v)),
              )
              .toList(),
      service:
          (json.valueEnsureAsList<dynamic>('service', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  ServiceDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => ServiceDescriptorProto.fromJson(v)),
              )
              .toList(),
      extension_:
          (json.valueEnsureAsList<dynamic>('extension', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  FieldDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => FieldDescriptorProto.fromJson(v)),
              )
              .toList(),
      options: json.valueTo<FileOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => FileOptions.fromJson(v),
        acceptCamelCase: true,
      ),
      sourceCodeInfo: json.valueTo<SourceCodeInfo?, Map<String, dynamic>>(
        key: 'source_code_info',
        parse: (v) => SourceCodeInfo.fromJson(v),
        acceptCamelCase: true,
      ),
      syntax: json.valueAsString<String?>('syntax', acceptCamelCase: true),
      edition: json.valueTo<Edition?, Object?>(
        key: 'edition',
        parse: (v) => Edition.from(v),
      ),
    );
  }

  factory FileDescriptorProto.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FileDescriptorProto(
      name: decode.getString<String?>(1),
      package: decode.getString<String?>(2),
      dependency: decode.getListOrEmpty<String>(3),
      publicDependency: decode.getListOrEmpty<int>(10),
      weakDependency: decode.getListOrEmpty<int>(11),
      optionDependency: decode.getListOrEmpty<String>(15),
      messageType:
          decode
              .getListOfBytes(4)
              .map((b) => DescriptorProto.deserialize(b))
              .toList(),
      enumType:
          decode
              .getListOfBytes(5)
              .map((b) => EnumDescriptorProto.deserialize(b))
              .toList(),
      service:
          decode
              .getListOfBytes(6)
              .map((b) => ServiceDescriptorProto.deserialize(b))
              .toList(),
      extension_:
          decode
              .getListOfBytes(7)
              .map((b) => FieldDescriptorProto.deserialize(b))
              .toList(),
      options: decode.messageTo<FileOptions?>(
        8,
        (b) => FileOptions.deserialize(b),
      ),
      sourceCodeInfo: decode.messageTo<SourceCodeInfo?>(
        9,
        (b) => SourceCodeInfo.deserialize(b),
      ),
      syntax: decode.getString<String?>(12),
      edition: decode.getEnum<Edition?>(14, Edition.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufFileDescriptorProto;
}

/// Describes a message type.
class DescriptorProto extends CosmosProtoMessage {
  final String? name;

  final List<FieldDescriptorProto> field;

  final List<FieldDescriptorProto> extension_;

  final List<DescriptorProto> nestedType;

  final List<EnumDescriptorProto> enumType;

  final List<DescriptorProtoExtensionRange> extensionRange;

  final List<OneofDescriptorProto> oneofDecl;

  final MessageOptions? options;

  /// Exclusive.
  final List<DescriptorProtoReservedRange> reservedRange;

  /// Reserved field names, which may not be used by fields in the same message.
  /// A given name may only be reserved once.
  final List<String> reservedName;

  /// Support for `export` and `local` keywords on enums.
  final SymbolVisibility? visibility;

  const DescriptorProto({
    this.name,
    this.field = const [],
    this.extension_ = const [],
    this.nestedType = const [],
    this.enumType = const [],
    this.extensionRange = const [],
    this.oneofDecl = const [],
    this.options,
    this.reservedRange = const [],
    this.reservedName = const [],
    this.visibility,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 8,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(7, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 9,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 10,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.enumType(11, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    field,
    extension_,
    nestedType,
    enumType,
    extensionRange,
    oneofDecl,
    options,
    reservedRange,
    reservedName,
    visibility,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'field': field.map((e) => e.toJson()).toList(),
      'extension': extension_.map((e) => e.toJson()).toList(),
      'nested_type': nestedType.map((e) => e.toJson()).toList(),
      'enum_type': enumType.map((e) => e.toJson()).toList(),
      'extension_range': extensionRange.map((e) => e.toJson()).toList(),
      'oneof_decl': oneofDecl.map((e) => e.toJson()).toList(),
      'options': options?.toJson(),
      'reserved_range': reservedRange.map((e) => e.toJson()).toList(),
      'reserved_name': reservedName.map((e) => e).toList(),
      'visibility': visibility?.protoName,
    };
  }

  factory DescriptorProto.fromJson(Map<String, dynamic> json) {
    return DescriptorProto(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      field:
          (json.valueEnsureAsList<dynamic>('field', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  FieldDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => FieldDescriptorProto.fromJson(v)),
              )
              .toList(),
      extension_:
          (json.valueEnsureAsList<dynamic>('extension', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  FieldDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => FieldDescriptorProto.fromJson(v)),
              )
              .toList(),
      nestedType:
          (json.valueEnsureAsList<dynamic>(
                'nested_type',
                acceptCamelCase: true,
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<DescriptorProto, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => DescriptorProto.fromJson(v),
                    ),
              )
              .toList(),
      enumType:
          (json.valueEnsureAsList<dynamic>('enum_type', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  EnumDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => EnumDescriptorProto.fromJson(v)),
              )
              .toList(),
      extensionRange:
          (json.valueEnsureAsList<dynamic>(
                'extension_range',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  DescriptorProtoExtensionRange,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => DescriptorProtoExtensionRange.fromJson(v),
                ),
              )
              .toList(),
      oneofDecl:
          (json.valueEnsureAsList<dynamic>('oneof_decl', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  OneofDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => OneofDescriptorProto.fromJson(v)),
              )
              .toList(),
      options: json.valueTo<MessageOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => MessageOptions.fromJson(v),
        acceptCamelCase: true,
      ),
      reservedRange:
          (json.valueEnsureAsList<dynamic>(
                'reserved_range',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  DescriptorProtoReservedRange,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => DescriptorProtoReservedRange.fromJson(v),
                ),
              )
              .toList(),
      reservedName:
          (json.valueEnsureAsList<dynamic>(
            'reserved_name',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      visibility: json.valueTo<SymbolVisibility?, Object?>(
        key: 'visibility',
        parse: (v) => SymbolVisibility.from(v),
      ),
    );
  }

  factory DescriptorProto.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DescriptorProto(
      name: decode.getString<String?>(1),
      field:
          decode
              .getListOfBytes(2)
              .map((b) => FieldDescriptorProto.deserialize(b))
              .toList(),
      extension_:
          decode
              .getListOfBytes(6)
              .map((b) => FieldDescriptorProto.deserialize(b))
              .toList(),
      nestedType:
          decode
              .getListOfBytes(3)
              .map((b) => DescriptorProto.deserialize(b))
              .toList(),
      enumType:
          decode
              .getListOfBytes(4)
              .map((b) => EnumDescriptorProto.deserialize(b))
              .toList(),
      extensionRange:
          decode
              .getListOfBytes(5)
              .map((b) => DescriptorProtoExtensionRange.deserialize(b))
              .toList(),
      oneofDecl:
          decode
              .getListOfBytes(8)
              .map((b) => OneofDescriptorProto.deserialize(b))
              .toList(),
      options: decode.messageTo<MessageOptions?>(
        7,
        (b) => MessageOptions.deserialize(b),
      ),
      reservedRange:
          decode
              .getListOfBytes(9)
              .map((b) => DescriptorProtoReservedRange.deserialize(b))
              .toList(),
      reservedName: decode.getListOrEmpty<String>(10),
      visibility: decode.getEnum<SymbolVisibility?>(
        11,
        SymbolVisibility.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufDescriptorProto;
}

class DescriptorProtoExtensionRange extends CosmosProtoMessage {
  final int? start;

  /// Inclusive.
  final int? end;

  /// Exclusive.
  final ExtensionRangeOptions? options;

  const DescriptorProtoExtensionRange({this.start, this.end, this.options});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.int32(1, hasOptionalFlags: true),
        ProtoFieldConfig.int32(2, hasOptionalFlags: true),
        ProtoFieldConfig.message(3, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [start, end, options];

  @override
  Map<String, dynamic> toJson() {
    return {'start': start, 'end': end, 'options': options?.toJson()};
  }

  factory DescriptorProtoExtensionRange.fromJson(Map<String, dynamic> json) {
    return DescriptorProtoExtensionRange(
      start: json.valueAsInt<int?>('start', acceptCamelCase: true),
      end: json.valueAsInt<int?>('end', acceptCamelCase: true),
      options: json.valueTo<ExtensionRangeOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => ExtensionRangeOptions.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory DescriptorProtoExtensionRange.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DescriptorProtoExtensionRange(
      start: decode.getInt<int?>(1),
      end: decode.getInt<int?>(2),
      options: decode.messageTo<ExtensionRangeOptions?>(
        3,
        (b) => ExtensionRangeOptions.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufDescriptorProtoExtensionRange;
}

/// Range of reserved tag numbers. Reserved tag numbers may not be used by
/// fields or extension ranges in the same message. Reserved ranges may
/// not overlap.
class DescriptorProtoReservedRange extends CosmosProtoMessage {
  final int? start;

  /// Inclusive.
  final int? end;

  const DescriptorProtoReservedRange({this.start, this.end});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.int32(1, hasOptionalFlags: true),
        ProtoFieldConfig.int32(2, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [start, end];

  @override
  Map<String, dynamic> toJson() {
    return {'start': start, 'end': end};
  }

  factory DescriptorProtoReservedRange.fromJson(Map<String, dynamic> json) {
    return DescriptorProtoReservedRange(
      start: json.valueAsInt<int?>('start', acceptCamelCase: true),
      end: json.valueAsInt<int?>('end', acceptCamelCase: true),
    );
  }

  factory DescriptorProtoReservedRange.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DescriptorProtoReservedRange(
      start: decode.getInt<int?>(1),
      end: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufDescriptorProtoReservedRange;
}

class ExtensionRangeOptions extends CosmosProtoMessage {
  /// The parser stores options it doesn't recognize here. See above.
  final List<UninterpretedOption> uninterpretedOption;

  /// removed is_repeated
  /// For external users: DO NOT USE. We are in the process of open sourcing
  /// extension declaration and executing internal cleanups before it can be
  /// used externally.
  final List<ExtensionRangeOptionsDeclaration> declaration;

  /// Any features defined in the specific edition.
  final FeatureSet? features;

  /// The verification state of the range.
  /// are marked as UNVERIFIED.
  final ExtensionRangeOptionsVerificationState? verification;

  const ExtensionRangeOptions({
    this.uninterpretedOption = const [],
    this.declaration = const [],
    this.features,
    this.verification,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_SOURCE"),
          ],
        ),
        ProtoFieldConfig.message(50, hasOptionalFlags: true),
        ProtoFieldConfig.enumType(
          3,
          options: [
            ProtoOptionString(name: "default", value: "UNVERIFIED"),
            ProtoOptionString(name: "retention", value: "RETENTION_SOURCE"),
          ],
          hasOptionalFlags: true,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    uninterpretedOption,
    declaration,
    features,
    verification,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
      'declaration': declaration.map((e) => e.toJson()).toList(),
      'features': features?.toJson(),
      'verification': verification?.protoName,
    };
  }

  factory ExtensionRangeOptions.fromJson(Map<String, dynamic> json) {
    return ExtensionRangeOptions(
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
      declaration:
          (json.valueEnsureAsList<dynamic>(
                'declaration',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  ExtensionRangeOptionsDeclaration,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => ExtensionRangeOptionsDeclaration.fromJson(v),
                ),
              )
              .toList(),
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      verification: json
          .valueTo<ExtensionRangeOptionsVerificationState?, Object?>(
            key: 'verification',
            parse: (v) => ExtensionRangeOptionsVerificationState.from(v),
          ),
    );
  }

  factory ExtensionRangeOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExtensionRangeOptions(
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
      declaration:
          decode
              .getListOfBytes(2)
              .map((b) => ExtensionRangeOptionsDeclaration.deserialize(b))
              .toList(),
      features: decode.messageTo<FeatureSet?>(
        50,
        (b) => FeatureSet.deserialize(b),
      ),
      verification: decode.getEnum<ExtensionRangeOptionsVerificationState?>(
        3,
        ExtensionRangeOptionsVerificationState.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufExtensionRangeOptions;
}

class ExtensionRangeOptionsDeclaration extends CosmosProtoMessage {
  /// The extension number declared within the extension range.
  final int? number;

  /// The fully-qualified name of the extension field. There must be a leading
  /// dot in front of the full name.
  final String? fullName;

  /// The fully-qualified type name of the extension field. Unlike
  /// Metadata.type, Declaration.type must have a leading dot for messages
  /// and enums.
  final String? type;

  /// If true, indicates that the number is reserved in the extension range,
  /// and any extension field with the number will fail to compile. Set this
  /// when a declared extension field is deleted.
  final bool? reserved;

  /// If true, indicates that the extension must be defined as repeated.
  /// Otherwise the extension must be defined as optional.
  final bool? repeated;

  const ExtensionRangeOptionsDeclaration({
    this.number,
    this.fullName,
    this.type,
    this.reserved,
    this.repeated,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.int32(1, hasOptionalFlags: true),
        ProtoFieldConfig.string(2, hasOptionalFlags: true),
        ProtoFieldConfig.string(3, hasOptionalFlags: true),
        ProtoFieldConfig.bool(5, hasOptionalFlags: true),
        ProtoFieldConfig.bool(6, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [number, fullName, type, reserved, repeated];

  @override
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'full_name': fullName,
      'type': type,
      'reserved': reserved,
      'repeated': repeated,
    };
  }

  factory ExtensionRangeOptionsDeclaration.fromJson(Map<String, dynamic> json) {
    return ExtensionRangeOptionsDeclaration(
      number: json.valueAsInt<int?>('number', acceptCamelCase: true),
      fullName: json.valueAsString<String?>('full_name', acceptCamelCase: true),
      type: json.valueAsString<String?>('type', acceptCamelCase: true),
      reserved: json.valueAsBool<bool?>('reserved', acceptCamelCase: true),
      repeated: json.valueAsBool<bool?>('repeated', acceptCamelCase: true),
    );
  }

  factory ExtensionRangeOptionsDeclaration.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ExtensionRangeOptionsDeclaration(
      number: decode.getInt<int?>(1),
      fullName: decode.getString<String?>(2),
      type: decode.getString<String?>(3),
      reserved: decode.getBool<bool?>(5),
      repeated: decode.getBool<bool?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufExtensionRangeOptionsDeclaration;
}

/// Clients can define custom options in extensions of this message. See above.
/// Describes a field within a message.
class FieldDescriptorProto extends CosmosProtoMessage {
  final String? name;

  final int? number;

  final FieldDescriptorProtoLabel? label;

  /// If type_name is set, this need not be set.  If both this and type_name
  /// are set, this must be one of TYPE_ENUM, TYPE_MESSAGE or TYPE_GROUP.
  final FieldDescriptorProtoType? type;

  /// For message and enum types, this is the name of the type.  If the name
  /// starts with a '.', it is fully-qualified.  Otherwise, C++-like scoping
  /// rules are used to find the type (i.e. first the nested types within this
  /// message are searched, then within the parent, on up to the root
  /// namespace).
  final String? typeName;

  /// For extensions, this is the name of the type being extended.  It is
  /// resolved in the same manner as type_name.
  final String? extendee;

  /// For numeric types, contains the original text representation of the value.
  /// For booleans, "true" or "false".
  /// For strings, contains the default text contents (not escaped in any way).
  /// For bytes, contains the C escaped value.  All bytes >= 128 are escaped.
  final String? defaultValue;

  /// If set, gives the index of a oneof in the containing type's oneof_decl
  /// list.  This field is a member of that oneof.
  final int? oneofIndex;

  /// JSON name of this field. The value is set by protocol compiler. If the
  /// user has set a "json_name" option on this field, that option's value
  /// will be used. Otherwise, it's deduced from the field's name by converting
  /// it to camelCase.
  final String? jsonName;

  final FieldOptions? options;

  /// If true, this is a proto3 "optional". When a proto3 field is optional, it
  /// tracks presence regardless of field type.
  ///
  /// When proto3_optional is true, this field must belong to a oneof to signal
  /// to old proto3 clients that presence is tracked for this field. This oneof
  /// is known as a "synthetic" oneof, and this field must be its sole member
  /// (each proto3 optional field gets its own synthetic oneof). Synthetic oneofs
  /// exist in the descriptor only, and do not generate any API. Synthetic oneofs
  /// must be ordered after all "real" oneofs.
  ///
  /// For message fields, proto3_optional doesn't create any semantic change,
  /// since non-repeated message fields always track presence. However it still
  /// indicates the semantic detail of whether the user wrote "optional" or not.
  /// This can be useful for round-tripping the .proto file. For consistency we
  /// give message fields a synthetic oneof also, even though it is not required
  /// to track presence. This is especially important because the parser can't
  /// tell if a field is a message or an enum, so it must always create a
  /// synthetic oneof.
  ///
  /// Proto2 optional fields do not set this flag, because they already indicate
  /// optional with `LABEL_OPTIONAL`.
  final bool? proto3Optional;

  const FieldDescriptorProto({
    this.name,
    this.number,
    this.label,
    this.type,
    this.typeName,
    this.extendee,
    this.defaultValue,
    this.oneofIndex,
    this.jsonName,
    this.options,
    this.proto3Optional,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.int32(3, hasOptionalFlags: true),
        ProtoFieldConfig.enumType(4, hasOptionalFlags: true),
        ProtoFieldConfig.enumType(5, hasOptionalFlags: true),
        ProtoFieldConfig.string(6, hasOptionalFlags: true),
        ProtoFieldConfig.string(2, hasOptionalFlags: true),
        ProtoFieldConfig.string(7, hasOptionalFlags: true),
        ProtoFieldConfig.int32(9, hasOptionalFlags: true),
        ProtoFieldConfig.string(10, hasOptionalFlags: true),
        ProtoFieldConfig.message(8, hasOptionalFlags: true),
        ProtoFieldConfig.bool(17, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    number,
    label,
    type,
    typeName,
    extendee,
    defaultValue,
    oneofIndex,
    jsonName,
    options,
    proto3Optional,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'label': label?.protoName,
      'type': type?.protoName,
      'type_name': typeName,
      'extendee': extendee,
      'default_value': defaultValue,
      'oneof_index': oneofIndex,
      'json_name': jsonName,
      'options': options?.toJson(),
      'proto3_optional': proto3Optional,
    };
  }

  factory FieldDescriptorProto.fromJson(Map<String, dynamic> json) {
    return FieldDescriptorProto(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      number: json.valueAsInt<int?>('number', acceptCamelCase: true),
      label: json.valueTo<FieldDescriptorProtoLabel?, Object?>(
        key: 'label',
        parse: (v) => FieldDescriptorProtoLabel.from(v),
      ),
      type: json.valueTo<FieldDescriptorProtoType?, Object?>(
        key: 'type',
        parse: (v) => FieldDescriptorProtoType.from(v),
      ),
      typeName: json.valueAsString<String?>('type_name', acceptCamelCase: true),
      extendee: json.valueAsString<String?>('extendee', acceptCamelCase: true),
      defaultValue: json.valueAsString<String?>(
        'default_value',
        acceptCamelCase: true,
      ),
      oneofIndex: json.valueAsInt<int?>('oneof_index', acceptCamelCase: true),
      jsonName: json.valueAsString<String?>('json_name', acceptCamelCase: true),
      options: json.valueTo<FieldOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => FieldOptions.fromJson(v),
        acceptCamelCase: true,
      ),
      proto3Optional: json.valueAsBool<bool?>(
        'proto3_optional',
        acceptCamelCase: true,
      ),
    );
  }

  factory FieldDescriptorProto.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FieldDescriptorProto(
      name: decode.getString<String?>(1),
      number: decode.getInt<int?>(3),
      label: decode.getEnum<FieldDescriptorProtoLabel?>(
        4,
        FieldDescriptorProtoLabel.values,
      ),
      type: decode.getEnum<FieldDescriptorProtoType?>(
        5,
        FieldDescriptorProtoType.values,
      ),
      typeName: decode.getString<String?>(6),
      extendee: decode.getString<String?>(2),
      defaultValue: decode.getString<String?>(7),
      oneofIndex: decode.getInt<int?>(9),
      jsonName: decode.getString<String?>(10),
      options: decode.messageTo<FieldOptions?>(
        8,
        (b) => FieldOptions.deserialize(b),
      ),
      proto3Optional: decode.getBool<bool?>(17),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufFieldDescriptorProto;
}

/// Describes a oneof.
class OneofDescriptorProto extends CosmosProtoMessage {
  final String? name;

  final OneofOptions? options;

  const OneofDescriptorProto({this.name, this.options});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.message(2, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, options];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'options': options?.toJson()};
  }

  factory OneofDescriptorProto.fromJson(Map<String, dynamic> json) {
    return OneofDescriptorProto(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      options: json.valueTo<OneofOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => OneofOptions.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory OneofDescriptorProto.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OneofDescriptorProto(
      name: decode.getString<String?>(1),
      options: decode.messageTo<OneofOptions?>(
        2,
        (b) => OneofOptions.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufOneofDescriptorProto;
}

/// Describes an enum type.
class EnumDescriptorProto extends CosmosProtoMessage {
  final String? name;

  final List<EnumValueDescriptorProto> value;

  final EnumOptions? options;

  /// Inclusive.
  /// Range of reserved numeric values. Reserved numeric values may not be used
  /// by enum values in the same enum declaration. Reserved ranges may not
  /// overlap.
  final List<EnumDescriptorProtoEnumReservedRange> reservedRange;

  /// Reserved enum value names, which may not be reused. A given name may only
  /// be reserved once.
  final List<String> reservedName;

  /// Support for `export` and `local` keywords on enums.
  final SymbolVisibility? visibility;

  const EnumDescriptorProto({
    this.name,
    this.value = const [],
    this.options,
    this.reservedRange = const [],
    this.reservedName = const [],
    this.visibility,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(3, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.enumType(6, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    value,
    options,
    reservedRange,
    reservedName,
    visibility,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value.map((e) => e.toJson()).toList(),
      'options': options?.toJson(),
      'reserved_range': reservedRange.map((e) => e.toJson()).toList(),
      'reserved_name': reservedName.map((e) => e).toList(),
      'visibility': visibility?.protoName,
    };
  }

  factory EnumDescriptorProto.fromJson(Map<String, dynamic> json) {
    return EnumDescriptorProto(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      value:
          (json.valueEnsureAsList<dynamic>('value', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  EnumValueDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => EnumValueDescriptorProto.fromJson(v)),
              )
              .toList(),
      options: json.valueTo<EnumOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => EnumOptions.fromJson(v),
        acceptCamelCase: true,
      ),
      reservedRange:
          (json.valueEnsureAsList<dynamic>(
                'reserved_range',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  EnumDescriptorProtoEnumReservedRange,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => EnumDescriptorProtoEnumReservedRange.fromJson(v),
                ),
              )
              .toList(),
      reservedName:
          (json.valueEnsureAsList<dynamic>(
            'reserved_name',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      visibility: json.valueTo<SymbolVisibility?, Object?>(
        key: 'visibility',
        parse: (v) => SymbolVisibility.from(v),
      ),
    );
  }

  factory EnumDescriptorProto.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EnumDescriptorProto(
      name: decode.getString<String?>(1),
      value:
          decode
              .getListOfBytes(2)
              .map((b) => EnumValueDescriptorProto.deserialize(b))
              .toList(),
      options: decode.messageTo<EnumOptions?>(
        3,
        (b) => EnumOptions.deserialize(b),
      ),
      reservedRange:
          decode
              .getListOfBytes(4)
              .map((b) => EnumDescriptorProtoEnumReservedRange.deserialize(b))
              .toList(),
      reservedName: decode.getListOrEmpty<String>(5),
      visibility: decode.getEnum<SymbolVisibility?>(6, SymbolVisibility.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufEnumDescriptorProto;
}

/// Range of reserved numeric values. Reserved values may not be used by
/// entries in the same enum. Reserved ranges may not overlap.
///
/// Note that this is distinct from DescriptorProto.ReservedRange in that it
/// is inclusive such that it can appropriately represent the entire int32
/// domain.
class EnumDescriptorProtoEnumReservedRange extends CosmosProtoMessage {
  final int? start;

  /// Inclusive.
  final int? end;

  const EnumDescriptorProtoEnumReservedRange({this.start, this.end});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.int32(1, hasOptionalFlags: true),
        ProtoFieldConfig.int32(2, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [start, end];

  @override
  Map<String, dynamic> toJson() {
    return {'start': start, 'end': end};
  }

  factory EnumDescriptorProtoEnumReservedRange.fromJson(
    Map<String, dynamic> json,
  ) {
    return EnumDescriptorProtoEnumReservedRange(
      start: json.valueAsInt<int?>('start', acceptCamelCase: true),
      end: json.valueAsInt<int?>('end', acceptCamelCase: true),
    );
  }

  factory EnumDescriptorProtoEnumReservedRange.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EnumDescriptorProtoEnumReservedRange(
      start: decode.getInt<int?>(1),
      end: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .googleProtobufEnumDescriptorProtoEnumReservedRange;
}

/// Describes a value within an enum.
class EnumValueDescriptorProto extends CosmosProtoMessage {
  final String? name;

  final int? number;

  final EnumValueOptions? options;

  const EnumValueDescriptorProto({this.name, this.number, this.options});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.int32(2, hasOptionalFlags: true),
        ProtoFieldConfig.message(3, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, number, options];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'number': number, 'options': options?.toJson()};
  }

  factory EnumValueDescriptorProto.fromJson(Map<String, dynamic> json) {
    return EnumValueDescriptorProto(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      number: json.valueAsInt<int?>('number', acceptCamelCase: true),
      options: json.valueTo<EnumValueOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => EnumValueOptions.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory EnumValueDescriptorProto.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EnumValueDescriptorProto(
      name: decode.getString<String?>(1),
      number: decode.getInt<int?>(2),
      options: decode.messageTo<EnumValueOptions?>(
        3,
        (b) => EnumValueOptions.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufEnumValueDescriptorProto;
}

/// Describes a service.
class ServiceDescriptorProto extends CosmosProtoMessage {
  final String? name;

  final List<MethodDescriptorProto> method;

  final ServiceOptions? options;

  const ServiceDescriptorProto({
    this.name,
    this.method = const [],
    this.options,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(3, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, method, options];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'method': method.map((e) => e.toJson()).toList(),
      'options': options?.toJson(),
    };
  }

  factory ServiceDescriptorProto.fromJson(Map<String, dynamic> json) {
    return ServiceDescriptorProto(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      method:
          (json.valueEnsureAsList<dynamic>('method', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  MethodDescriptorProto,
                  Map<String, dynamic>
                >(value: e, parse: (v) => MethodDescriptorProto.fromJson(v)),
              )
              .toList(),
      options: json.valueTo<ServiceOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => ServiceOptions.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory ServiceDescriptorProto.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ServiceDescriptorProto(
      name: decode.getString<String?>(1),
      method:
          decode
              .getListOfBytes(2)
              .map((b) => MethodDescriptorProto.deserialize(b))
              .toList(),
      options: decode.messageTo<ServiceOptions?>(
        3,
        (b) => ServiceOptions.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufServiceDescriptorProto;
}

/// Describes a method of a service.
class MethodDescriptorProto extends CosmosProtoMessage {
  final String? name;

  /// Input and output type names.  These are resolved in the same way as
  /// FieldDescriptorProto.type_name, but must refer to a message type.
  final String? inputType;

  final String? outputType;

  final MethodOptions? options;

  /// Identifies if client streams multiple client messages
  final bool? clientStreaming;

  /// Identifies if server streams multiple server messages
  final bool? serverStreaming;

  const MethodDescriptorProto({
    this.name,
    this.inputType,
    this.outputType,
    this.options,
    this.clientStreaming,
    this.serverStreaming,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.string(2, hasOptionalFlags: true),
        ProtoFieldConfig.string(3, hasOptionalFlags: true),
        ProtoFieldConfig.message(4, hasOptionalFlags: true),
        ProtoFieldConfig.bool(
          5,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          6,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    inputType,
    outputType,
    options,
    clientStreaming,
    serverStreaming,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'input_type': inputType,
      'output_type': outputType,
      'options': options?.toJson(),
      'client_streaming': clientStreaming,
      'server_streaming': serverStreaming,
    };
  }

  factory MethodDescriptorProto.fromJson(Map<String, dynamic> json) {
    return MethodDescriptorProto(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      inputType: json.valueAsString<String?>(
        'input_type',
        acceptCamelCase: true,
      ),
      outputType: json.valueAsString<String?>(
        'output_type',
        acceptCamelCase: true,
      ),
      options: json.valueTo<MethodOptions?, Map<String, dynamic>>(
        key: 'options',
        parse: (v) => MethodOptions.fromJson(v),
        acceptCamelCase: true,
      ),
      clientStreaming: json.valueAsBool<bool?>(
        'client_streaming',
        acceptCamelCase: true,
      ),
      serverStreaming: json.valueAsBool<bool?>(
        'server_streaming',
        acceptCamelCase: true,
      ),
    );
  }

  factory MethodDescriptorProto.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MethodDescriptorProto(
      name: decode.getString<String?>(1),
      inputType: decode.getString<String?>(2),
      outputType: decode.getString<String?>(3),
      options: decode.messageTo<MethodOptions?>(
        4,
        (b) => MethodOptions.deserialize(b),
      ),
      clientStreaming: decode.getBool<bool?>(5),
      serverStreaming: decode.getBool<bool?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufMethodDescriptorProto;
}

/// ===================================================================
/// Options
/// Each of the definitions above may have "options" attached.  These are
/// just annotations which may cause code to be generated slightly differently
/// or may contain hints for code that manipulates protocol messages.
///
/// Clients may define custom options as extensions of the *Options messages.
/// These extensions may not yet be known at parsing time, so the parser cannot
/// store the values in them.  Instead it stores them in a field in the *Options
/// message called uninterpreted_option. This field must have the same name
/// across all *Options messages. We then use this field to populate the
/// extensions when we build a descriptor, at which point all protos have been
/// parsed and so all extensions are known.
///
/// Extension numbers for custom options may be chosen as follows:
/// * For options which will only be used within a single application or
/// organization, or for experimental options, use field numbers 50000
/// through 99999.  It is up to you to ensure that you do not use the
/// same number for multiple options.
/// * For options which will be published and used publicly by multiple
/// independent entities, e-mail protobuf-global-extension-registry@google.com
/// to reserve extension numbers. Simply provide your project name (e.g.
/// Objective-C plugin) and your project website (if available) -- there's no
/// need to explain how you intend to use them. Usually you only need one
/// extension number. You can declare multiple options with only one extension
/// number by putting them in a sub-message. See the Custom Options section of
/// the docs for examples:
/// https://developers.google.com/protocol-buffers/docs/proto#options
/// If this turns out to be popular, a web service will be set up
/// to automatically assign option numbers.
class FileOptions extends CosmosProtoMessage {
  /// Sets the Java package where classes generated from this .proto will be
  /// placed.  By default, the proto package is used, but this is often
  /// inappropriate because proto packages do not normally start with backwards
  /// domain names.
  final String? javaPackage;

  /// Controls the name of the wrapper Java class generated for the .proto file.
  /// That class will always contain the .proto file's getDescriptor() method as
  /// well as any top-level extensions defined in the .proto file.
  /// If java_multiple_files is disabled, then all the other classes from the
  /// .proto file will be nested inside the single wrapper outer class.
  final String? javaOuterClassname;

  /// If enabled, then the Java code generator will generate a separate .java
  /// file for each top-level message, enum, and service defined in the .proto
  /// file.  Thus, these types will *not* be nested inside the wrapper class
  /// named by java_outer_classname.  However, the wrapper class will still be
  /// generated to contain the file's getDescriptor() method as well as any
  /// top-level extensions defined in the file.
  final bool? javaMultipleFiles;

  /// This option does nothing.
  final bool? javaGenerateEqualsAndHash;

  /// A proto2 file can set this to true to opt in to UTF-8 checking for Java,
  /// which will throw an exception if invalid UTF-8 is parsed from the wire or
  /// assigned to a string field.
  ///
  /// applies to, and update these docs accordingly.
  ///
  /// Proto3 files already perform these checks. Setting the option explicitly to
  /// false has no effect: it cannot be used to opt proto3 files out of UTF-8
  /// checks.
  final bool? javaStringCheckUtf8;

  /// Generate code using MessageLite and the lite runtime.
  final FileOptionsOptimizeMode? optimizeFor;

  /// Sets the Go package where structs generated from this .proto will be
  /// placed. If omitted, the Go package will be derived from the following:
  /// - The basename of the package import path, if provided.
  /// - Otherwise, the package statement in the .proto file, if present.
  /// - Otherwise, the basename of the .proto file, without extension.
  final String? goPackage;

  /// Should generic services be generated in each language?  "Generic" services
  /// are not specific to any particular RPC system.  They are generated by the
  /// main code generators in each language (without additional plugins).
  /// Generic services were the only kind of service generation supported by
  /// early versions of google.protobuf.
  ///
  /// Generic services are now considered deprecated in favor of using plugins
  /// that generate code specific to your particular RPC system.  Therefore,
  /// these default to false.  Old code which depends on generic services should
  /// explicitly set them to true.
  final bool? ccGenericServices;

  final bool? javaGenericServices;

  final bool? pyGenericServices;

  /// removed php_generic_services
  /// Is this file deprecated?
  /// Depending on the target platform, this can emit Deprecated annotations
  /// for everything in the file, or it will be completely ignored; in the very
  /// least, this is a formalization for deprecating files.
  final bool? deprecated;

  /// Enables the use of arenas for the proto messages in this file. This applies
  /// only to generated classes for C++.
  final bool? ccEnableArenas;

  /// Sets the objective c class prefix which is prepended to all objective c
  /// generated classes from this .proto. There is no default.
  final String? objcClassPrefix;

  /// Namespace for generated classes; defaults to the package.
  final String? csharpNamespace;

  /// By default Swift generators will take the proto package and CamelCase it
  /// replacing '.' with underscore and use that to prefix the types/symbols
  /// defined. When this options is provided, they will use this value instead
  /// to prefix the types/symbols defined.
  final String? swiftPrefix;

  /// Sets the php class prefix which is prepended to all php generated classes
  /// from this .proto. Default is empty.
  final String? phpClassPrefix;

  /// Use this option to change the namespace of php generated classes. Default
  /// is empty. When this option is empty, the package name will be used for
  /// determining the namespace.
  final String? phpNamespace;

  /// Use this option to change the namespace of php generated metadata classes.
  /// Default is empty. When this option is empty, the proto file name will be
  /// used for determining the namespace.
  final String? phpMetadataNamespace;

  /// Use this option to change the package of ruby generated classes. Default
  /// is empty. When this option is not set, the package name will be used for
  /// determining the ruby package.
  final String? rubyPackage;

  /// Any features defined in the specific edition.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final FeatureSet? features;

  /// The parser stores options it doesn't recognize here.
  /// See the documentation for the "Options" section above.
  final List<UninterpretedOption> uninterpretedOption;

  const FileOptions({
    this.javaPackage,
    this.javaOuterClassname,
    this.javaMultipleFiles,
    this.javaGenerateEqualsAndHash,
    this.javaStringCheckUtf8,
    this.optimizeFor,
    this.goPackage,
    this.ccGenericServices,
    this.javaGenericServices,
    this.pyGenericServices,
    this.deprecated,
    this.ccEnableArenas,
    this.objcClassPrefix,
    this.csharpNamespace,
    this.swiftPrefix,
    this.phpClassPrefix,
    this.phpNamespace,
    this.phpMetadataNamespace,
    this.rubyPackage,
    this.features,
    this.uninterpretedOption = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, hasOptionalFlags: true),
        ProtoFieldConfig.string(8, hasOptionalFlags: true),
        ProtoFieldConfig.bool(
          10,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          20,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          27,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          9,
          options: [ProtoOptionString(name: "default", value: "SPEED")],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.string(11, hasOptionalFlags: true),
        ProtoFieldConfig.bool(
          16,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          17,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          18,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          23,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          31,
          options: [ProtoOptionBool(name: "default", value: true)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.string(36, hasOptionalFlags: true),
        ProtoFieldConfig.string(37, hasOptionalFlags: true),
        ProtoFieldConfig.string(39, hasOptionalFlags: true),
        ProtoFieldConfig.string(40, hasOptionalFlags: true),
        ProtoFieldConfig.string(41, hasOptionalFlags: true),
        ProtoFieldConfig.string(44, hasOptionalFlags: true),
        ProtoFieldConfig.string(45, hasOptionalFlags: true),
        ProtoFieldConfig.message(50, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    javaPackage,
    javaOuterClassname,
    javaMultipleFiles,
    javaGenerateEqualsAndHash,
    javaStringCheckUtf8,
    optimizeFor,
    goPackage,
    ccGenericServices,
    javaGenericServices,
    pyGenericServices,
    deprecated,
    ccEnableArenas,
    objcClassPrefix,
    csharpNamespace,
    swiftPrefix,
    phpClassPrefix,
    phpNamespace,
    phpMetadataNamespace,
    rubyPackage,
    features,
    uninterpretedOption,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'java_package': javaPackage,
      'java_outer_classname': javaOuterClassname,
      'java_multiple_files': javaMultipleFiles,
      'java_generate_equals_and_hash': javaGenerateEqualsAndHash,
      'java_string_check_utf8': javaStringCheckUtf8,
      'optimize_for': optimizeFor?.protoName,
      'go_package': goPackage,
      'cc_generic_services': ccGenericServices,
      'java_generic_services': javaGenericServices,
      'py_generic_services': pyGenericServices,
      'deprecated': deprecated,
      'cc_enable_arenas': ccEnableArenas,
      'objc_class_prefix': objcClassPrefix,
      'csharp_namespace': csharpNamespace,
      'swift_prefix': swiftPrefix,
      'php_class_prefix': phpClassPrefix,
      'php_namespace': phpNamespace,
      'php_metadata_namespace': phpMetadataNamespace,
      'ruby_package': rubyPackage,
      'features': features?.toJson(),
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
    };
  }

  factory FileOptions.fromJson(Map<String, dynamic> json) {
    return FileOptions(
      javaPackage: json.valueAsString<String?>(
        'java_package',
        acceptCamelCase: true,
      ),
      javaOuterClassname: json.valueAsString<String?>(
        'java_outer_classname',
        acceptCamelCase: true,
      ),
      javaMultipleFiles: json.valueAsBool<bool?>(
        'java_multiple_files',
        acceptCamelCase: true,
      ),
      javaGenerateEqualsAndHash: json.valueAsBool<bool?>(
        'java_generate_equals_and_hash',
        acceptCamelCase: true,
      ),
      javaStringCheckUtf8: json.valueAsBool<bool?>(
        'java_string_check_utf8',
        acceptCamelCase: true,
      ),
      optimizeFor: json.valueTo<FileOptionsOptimizeMode?, Object?>(
        key: 'optimize_for',
        parse: (v) => FileOptionsOptimizeMode.from(v),
      ),
      goPackage: json.valueAsString<String?>(
        'go_package',
        acceptCamelCase: true,
      ),
      ccGenericServices: json.valueAsBool<bool?>(
        'cc_generic_services',
        acceptCamelCase: true,
      ),
      javaGenericServices: json.valueAsBool<bool?>(
        'java_generic_services',
        acceptCamelCase: true,
      ),
      pyGenericServices: json.valueAsBool<bool?>(
        'py_generic_services',
        acceptCamelCase: true,
      ),
      deprecated: json.valueAsBool<bool?>('deprecated', acceptCamelCase: true),
      ccEnableArenas: json.valueAsBool<bool?>(
        'cc_enable_arenas',
        acceptCamelCase: true,
      ),
      objcClassPrefix: json.valueAsString<String?>(
        'objc_class_prefix',
        acceptCamelCase: true,
      ),
      csharpNamespace: json.valueAsString<String?>(
        'csharp_namespace',
        acceptCamelCase: true,
      ),
      swiftPrefix: json.valueAsString<String?>(
        'swift_prefix',
        acceptCamelCase: true,
      ),
      phpClassPrefix: json.valueAsString<String?>(
        'php_class_prefix',
        acceptCamelCase: true,
      ),
      phpNamespace: json.valueAsString<String?>(
        'php_namespace',
        acceptCamelCase: true,
      ),
      phpMetadataNamespace: json.valueAsString<String?>(
        'php_metadata_namespace',
        acceptCamelCase: true,
      ),
      rubyPackage: json.valueAsString<String?>(
        'ruby_package',
        acceptCamelCase: true,
      ),
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory FileOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FileOptions(
      javaPackage: decode.getString<String?>(1),
      javaOuterClassname: decode.getString<String?>(8),
      javaMultipleFiles: decode.getBool<bool?>(10),
      javaGenerateEqualsAndHash: decode.getBool<bool?>(20),
      javaStringCheckUtf8: decode.getBool<bool?>(27),
      optimizeFor: decode.getEnum<FileOptionsOptimizeMode?>(
        9,
        FileOptionsOptimizeMode.values,
      ),
      goPackage: decode.getString<String?>(11),
      ccGenericServices: decode.getBool<bool?>(16),
      javaGenericServices: decode.getBool<bool?>(17),
      pyGenericServices: decode.getBool<bool?>(18),
      deprecated: decode.getBool<bool?>(23),
      ccEnableArenas: decode.getBool<bool?>(31),
      objcClassPrefix: decode.getString<String?>(36),
      csharpNamespace: decode.getString<String?>(37),
      swiftPrefix: decode.getString<String?>(39),
      phpClassPrefix: decode.getString<String?>(40),
      phpNamespace: decode.getString<String?>(41),
      phpMetadataNamespace: decode.getString<String?>(44),
      rubyPackage: decode.getString<String?>(45),
      features: decode.messageTo<FeatureSet?>(
        50,
        (b) => FeatureSet.deserialize(b),
      ),
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufFileOptions;
}

/// Clients can define custom options in extensions of this message.
/// See the documentation for the "Options" section above.
class MessageOptions extends CosmosProtoMessage {
  /// Set true to use the old proto1 MessageSet wire format for extensions.
  /// This is provided for backwards-compatibility with the MessageSet wire
  /// format.  You should not use this for any other reason:  It's less
  /// efficient, has fewer features, and is more complicated.
  ///
  /// The message must be defined exactly as follows:
  /// message Foo {
  /// option message_set_wire_format = true;
  /// extensions 4 to max;
  /// }
  /// Note that the message cannot have any defined fields; MessageSets only
  /// have extensions.
  ///
  /// All extensions of your type must be singular messages; e.g. they cannot
  /// be int32s, enums, or repeated messages.
  ///
  /// Because this is an option, the above two restrictions are not enforced by
  /// the protocol compiler.
  final bool? messageSetWireFormat;

  /// Disables the generation of the standard "descriptor()" accessor, which can
  /// conflict with a field of the same name.  This is meant to make migration
  /// from proto1 easier; new code should avoid fields named "descriptor".
  final bool? noStandardDescriptorAccessor;

  /// Is this message deprecated?
  /// Depending on the target platform, this can emit Deprecated annotations
  /// for the message, or it will be completely ignored; in the very least,
  /// this is a formalization for deprecating messages.
  final bool? deprecated;

  /// Whether the message is an automatically generated map entry type for the
  /// maps field.
  ///
  /// For maps fields:
  /// The parsed descriptor looks like:
  /// message MapFieldEntry {
  /// option map_entry = true;
  /// optional KeyType key = 1;
  /// optional ValueType value = 2;
  /// }
  /// repeated MapFieldEntry map_field = 1;
  ///
  /// Implementations may choose not to generate the map_entry=true message, but
  /// use a native map in the target language to hold the keys and values.
  /// The reflection APIs in such implementations still need to work as
  /// if the field is a repeated message field.
  ///
  /// NOTE: Do not set the option in .proto files. Always use the maps syntax
  /// instead. The option should only be implicitly set by the proto compiler
  /// parser.
  final bool? mapEntry;

  /// javalite_serializable
  /// javanano_as_lite
  /// Enable the legacy handling of JSON field name conflicts.  This lowercases
  /// and strips underscored from the fields before comparison in proto3 only.
  /// The new behavior takes `json_name` into account and applies to proto2 as
  /// well.
  ///
  /// This should only be used as a temporary measure against broken builds due
  /// to the change in behavior for JSON field name conflicts.
  ///
  /// teams have had time to migrate.
  final bool? deprecatedLegacyJsonFieldConflicts;

  /// Any features defined in the specific edition.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final FeatureSet? features;

  /// The parser stores options it doesn't recognize here. See above.
  final List<UninterpretedOption> uninterpretedOption;

  const MessageOptions({
    this.messageSetWireFormat,
    this.noStandardDescriptorAccessor,
    this.deprecated,
    this.mapEntry,
    this.deprecatedLegacyJsonFieldConflicts,
    this.features,
    this.uninterpretedOption = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(
          1,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          2,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          3,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(7, hasOptionalFlags: true),
        ProtoFieldConfig.bool(
          11,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.message(12, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    messageSetWireFormat,
    noStandardDescriptorAccessor,
    deprecated,
    mapEntry,
    deprecatedLegacyJsonFieldConflicts,
    features,
    uninterpretedOption,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message_set_wire_format': messageSetWireFormat,
      'no_standard_descriptor_accessor': noStandardDescriptorAccessor,
      'deprecated': deprecated,
      'map_entry': mapEntry,
      'deprecated_legacy_json_field_conflicts':
          deprecatedLegacyJsonFieldConflicts,
      'features': features?.toJson(),
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
    };
  }

  factory MessageOptions.fromJson(Map<String, dynamic> json) {
    return MessageOptions(
      messageSetWireFormat: json.valueAsBool<bool?>(
        'message_set_wire_format',
        acceptCamelCase: true,
      ),
      noStandardDescriptorAccessor: json.valueAsBool<bool?>(
        'no_standard_descriptor_accessor',
        acceptCamelCase: true,
      ),
      deprecated: json.valueAsBool<bool?>('deprecated', acceptCamelCase: true),
      mapEntry: json.valueAsBool<bool?>('map_entry', acceptCamelCase: true),
      deprecatedLegacyJsonFieldConflicts: json.valueAsBool<bool?>(
        'deprecated_legacy_json_field_conflicts',
        acceptCamelCase: true,
      ),
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory MessageOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MessageOptions(
      messageSetWireFormat: decode.getBool<bool?>(1),
      noStandardDescriptorAccessor: decode.getBool<bool?>(2),
      deprecated: decode.getBool<bool?>(3),
      mapEntry: decode.getBool<bool?>(7),
      deprecatedLegacyJsonFieldConflicts: decode.getBool<bool?>(11),
      features: decode.messageTo<FeatureSet?>(
        12,
        (b) => FeatureSet.deserialize(b),
      ),
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufMessageOptions;
}

/// Clients can define custom options in extensions of this message. See above.
class FieldOptions extends CosmosProtoMessage {
  /// NOTE: ctype is deprecated. Use `features.(pb.cpp).string_type` instead.
  /// The ctype option instructs the C++ code generator to use a different
  /// representation of the field than it normally would.  See the specific
  /// options below.  This option is only implemented to support use of
  /// [ctype=CORD] and [ctype=STRING] (the default) on non-repeated fields of
  /// type "bytes" in the open source release.
  final FieldOptionsCType? ctype;

  /// The packed option can be enabled for repeated primitive fields to enable
  /// a more efficient representation on the wire. Rather than repeatedly
  /// writing the tag and type for each element, the entire array is encoded as
  /// a single length-delimited blob. In proto3, only explicit setting it to
  /// false will avoid using packed encoding.  This option is prohibited in
  /// Editions, but the `repeated_field_encoding` feature can be used to control
  /// the behavior.
  final bool? packed;

  /// The jstype option determines the JavaScript type used for values of the
  /// field.  The option is permitted only for 64 bit integral and fixed types
  /// (int64, uint64, sint64, fixed64, sfixed64).  A field with jstype JS_STRING
  /// is represented as JavaScript string, which avoids loss of precision that
  /// can happen when a large value is converted to a floating point JavaScript.
  /// Specifying JS_NUMBER for the jstype causes the generated JavaScript code to
  /// use the JavaScript "number" type.  The behavior of the default option
  /// JS_NORMAL is implementation dependent.
  ///
  /// This option is an enum to permit additional types to be added, e.g.
  /// goog.math.Integer.
  final FieldOptionsJSType? jstype;

  /// Should this field be parsed lazily?  Lazy applies only to message-type
  /// fields.  It means that when the outer message is initially parsed, the
  /// inner message's contents will not be parsed but instead stored in encoded
  /// form.  The inner message will actually be parsed when it is first accessed.
  ///
  /// This is only a hint.  Implementations are free to choose whether to use
  /// eager or lazy parsing regardless of the value of this option.  However,
  /// setting this option true suggests that the protocol author believes that
  /// using lazy parsing on this field is worth the additional bookkeeping
  /// overhead typically needed to implement it.
  ///
  /// This option does not affect the public interface of any generated code;
  /// all method signatures remain the same.  Furthermore, thread-safety of the
  /// interface is not affected by this option; const methods remain safe to
  /// call from multiple threads concurrently, while non-const methods continue
  /// to require exclusive access.
  ///
  /// Note that lazy message fields are still eagerly verified to check
  /// ill-formed wireformat or missing required fields. Calling IsInitialized()
  /// on the outer message would fail if the inner message has missing required
  /// fields. Failed verification would result in parsing failure (except when
  /// uninitialized messages are acceptable).
  final bool? lazy;

  /// unverified_lazy does no correctness checks on the byte stream. This should
  /// only be used where lazy with verification is prohibitive for performance
  /// reasons.
  final bool? unverifiedLazy;

  /// Is this field deprecated?
  /// Depending on the target platform, this can emit Deprecated annotations
  /// for accessors, or it will be completely ignored; in the very least, this
  /// is a formalization for deprecating fields.
  final bool? deprecated;

  /// DEPRECATED. DO NOT USE!
  /// For Google-internal migration only. Do not use.
  final bool? weak;

  /// Indicate that the field value should not be printed out when using debug
  /// formats, e.g. when the field contains sensitive credentials.
  final bool? debugRedact;

  final FieldOptionsOptionRetention? retention;

  final List<FieldOptionsOptionTargetType> targets;

  /// Textproto value.
  final List<FieldOptionsEditionDefault> editionDefaults;

  /// Any features defined in the specific edition.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final FeatureSet? features;

  final FieldOptionsFeatureSupport? featureSupport;

  /// The parser stores options it doesn't recognize here. See above.
  final List<UninterpretedOption> uninterpretedOption;

  const FieldOptions({
    this.ctype,
    this.packed,
    this.jstype,
    this.lazy,
    this.unverifiedLazy,
    this.deprecated,
    this.weak,
    this.debugRedact,
    this.retention,
    this.targets = const [],
    this.editionDefaults = const [],
    this.features,
    this.featureSupport,
    this.uninterpretedOption = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(
          1,
          options: [ProtoOptionString(name: "default", value: "STRING")],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(2, hasOptionalFlags: true),
        ProtoFieldConfig.enumType(
          6,
          options: [ProtoOptionString(name: "default", value: "JS_NORMAL")],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          5,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          15,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          3,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          10,
          options: [
            ProtoOptionBool(name: "default", value: false),
            ProtoOptionBool(name: "deprecated", value: true),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          16,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(17, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 19,
          elementType: ProtoFieldType.enumType,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 20,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(21, hasOptionalFlags: true),
        ProtoFieldConfig.message(22, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    ctype,
    packed,
    jstype,
    lazy,
    unverifiedLazy,
    deprecated,
    weak,
    debugRedact,
    retention,
    targets,
    editionDefaults,
    features,
    featureSupport,
    uninterpretedOption,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'ctype': ctype?.protoName,
      'packed': packed,
      'jstype': jstype?.protoName,
      'lazy': lazy,
      'unverified_lazy': unverifiedLazy,
      'deprecated': deprecated,
      'weak': weak,
      'debug_redact': debugRedact,
      'retention': retention?.protoName,
      'targets': targets.map((e) => e.protoName).toList(),
      'edition_defaults': editionDefaults.map((e) => e.toJson()).toList(),
      'features': features?.toJson(),
      'feature_support': featureSupport?.toJson(),
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
    };
  }

  factory FieldOptions.fromJson(Map<String, dynamic> json) {
    return FieldOptions(
      ctype: json.valueTo<FieldOptionsCType?, Object?>(
        key: 'ctype',
        parse: (v) => FieldOptionsCType.from(v),
      ),
      packed: json.valueAsBool<bool?>('packed', acceptCamelCase: true),
      jstype: json.valueTo<FieldOptionsJSType?, Object?>(
        key: 'jstype',
        parse: (v) => FieldOptionsJSType.from(v),
      ),
      lazy: json.valueAsBool<bool?>('lazy', acceptCamelCase: true),
      unverifiedLazy: json.valueAsBool<bool?>(
        'unverified_lazy',
        acceptCamelCase: true,
      ),
      deprecated: json.valueAsBool<bool?>('deprecated', acceptCamelCase: true),
      weak: json.valueAsBool<bool?>('weak', acceptCamelCase: true),
      debugRedact: json.valueAsBool<bool?>(
        'debug_redact',
        acceptCamelCase: true,
      ),
      retention: json.valueTo<FieldOptionsOptionRetention?, Object?>(
        key: 'retention',
        parse: (v) => FieldOptionsOptionRetention.from(v),
      ),
      targets:
          (json.valueEnsureAsList<dynamic>('targets', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<FieldOptionsOptionTargetType, Object>(
                  value: e,
                  parse: (v) => FieldOptionsOptionTargetType.from(v),
                ),
              )
              .toList(),
      editionDefaults:
          (json.valueEnsureAsList<dynamic>(
                'edition_defaults',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  FieldOptionsEditionDefault,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => FieldOptionsEditionDefault.fromJson(v),
                ),
              )
              .toList(),
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      featureSupport: json
          .valueTo<FieldOptionsFeatureSupport?, Map<String, dynamic>>(
            key: 'feature_support',
            parse: (v) => FieldOptionsFeatureSupport.fromJson(v),
            acceptCamelCase: true,
          ),
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory FieldOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FieldOptions(
      ctype: decode.getEnum<FieldOptionsCType?>(1, FieldOptionsCType.values),
      packed: decode.getBool<bool?>(2),
      jstype: decode.getEnum<FieldOptionsJSType?>(6, FieldOptionsJSType.values),
      lazy: decode.getBool<bool?>(5),
      unverifiedLazy: decode.getBool<bool?>(15),
      deprecated: decode.getBool<bool?>(3),
      weak: decode.getBool<bool?>(10),
      debugRedact: decode.getBool<bool?>(16),
      retention: decode.getEnum<FieldOptionsOptionRetention?>(
        17,
        FieldOptionsOptionRetention.values,
      ),
      targets: decode.getReapeatedEnum<FieldOptionsOptionTargetType>(
        19,
        FieldOptionsOptionTargetType.values,
      ),
      editionDefaults:
          decode
              .getListOfBytes(20)
              .map((b) => FieldOptionsEditionDefault.deserialize(b))
              .toList(),
      features: decode.messageTo<FeatureSet?>(
        21,
        (b) => FeatureSet.deserialize(b),
      ),
      featureSupport: decode.messageTo<FieldOptionsFeatureSupport?>(
        22,
        (b) => FieldOptionsFeatureSupport.deserialize(b),
      ),
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufFieldOptions;
}

class FieldOptionsEditionDefault extends CosmosProtoMessage {
  final Edition? edition;

  final String? value;

  const FieldOptionsEditionDefault({this.edition, this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(3, hasOptionalFlags: true),
        ProtoFieldConfig.string(2, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [edition, value];

  @override
  Map<String, dynamic> toJson() {
    return {'edition': edition?.protoName, 'value': value};
  }

  factory FieldOptionsEditionDefault.fromJson(Map<String, dynamic> json) {
    return FieldOptionsEditionDefault(
      edition: json.valueTo<Edition?, Object?>(
        key: 'edition',
        parse: (v) => Edition.from(v),
      ),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
    );
  }

  factory FieldOptionsEditionDefault.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FieldOptionsEditionDefault(
      edition: decode.getEnum<Edition?>(3, Edition.values),
      value: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufFieldOptionsEditionDefault;
}

/// Information about the support window of a feature.
class FieldOptionsFeatureSupport extends CosmosProtoMessage {
  /// The edition that this feature was first available in.  In editions
  /// earlier than this one, the default assigned to EDITION_LEGACY will be
  /// used, and proto files will not be able to override it.
  final Edition? editionIntroduced;

  /// The edition this feature becomes deprecated in.  Using this after this
  /// edition may trigger warnings.
  final Edition? editionDeprecated;

  /// The deprecation warning text if this feature is used after the edition it
  /// was marked deprecated in.
  final String? deprecationWarning;

  /// The edition this feature is no longer available in.  In editions after
  /// this one, the last default assigned will be used, and proto files will
  /// not be able to override it.
  final Edition? editionRemoved;

  const FieldOptionsFeatureSupport({
    this.editionIntroduced,
    this.editionDeprecated,
    this.deprecationWarning,
    this.editionRemoved,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1, hasOptionalFlags: true),
        ProtoFieldConfig.enumType(2, hasOptionalFlags: true),
        ProtoFieldConfig.string(3, hasOptionalFlags: true),
        ProtoFieldConfig.enumType(4, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    editionIntroduced,
    editionDeprecated,
    deprecationWarning,
    editionRemoved,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'edition_introduced': editionIntroduced?.protoName,
      'edition_deprecated': editionDeprecated?.protoName,
      'deprecation_warning': deprecationWarning,
      'edition_removed': editionRemoved?.protoName,
    };
  }

  factory FieldOptionsFeatureSupport.fromJson(Map<String, dynamic> json) {
    return FieldOptionsFeatureSupport(
      editionIntroduced: json.valueTo<Edition?, Object?>(
        key: 'edition_introduced',
        parse: (v) => Edition.from(v),
      ),
      editionDeprecated: json.valueTo<Edition?, Object?>(
        key: 'edition_deprecated',
        parse: (v) => Edition.from(v),
      ),
      deprecationWarning: json.valueAsString<String?>(
        'deprecation_warning',
        acceptCamelCase: true,
      ),
      editionRemoved: json.valueTo<Edition?, Object?>(
        key: 'edition_removed',
        parse: (v) => Edition.from(v),
      ),
    );
  }

  factory FieldOptionsFeatureSupport.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FieldOptionsFeatureSupport(
      editionIntroduced: decode.getEnum<Edition?>(1, Edition.values),
      editionDeprecated: decode.getEnum<Edition?>(2, Edition.values),
      deprecationWarning: decode.getString<String?>(3),
      editionRemoved: decode.getEnum<Edition?>(4, Edition.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufFieldOptionsFeatureSupport;
}

/// Clients can define custom options in extensions of this message. See above.
/// removed jtype
/// reserve target, target_obsolete_do_not_use
class OneofOptions extends CosmosProtoMessage {
  /// Any features defined in the specific edition.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final FeatureSet? features;

  /// The parser stores options it doesn't recognize here. See above.
  final List<UninterpretedOption> uninterpretedOption;

  const OneofOptions({this.features, this.uninterpretedOption = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [features, uninterpretedOption];

  @override
  Map<String, dynamic> toJson() {
    return {
      'features': features?.toJson(),
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
    };
  }

  factory OneofOptions.fromJson(Map<String, dynamic> json) {
    return OneofOptions(
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory OneofOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return OneofOptions(
      features: decode.messageTo<FeatureSet?>(
        1,
        (b) => FeatureSet.deserialize(b),
      ),
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufOneofOptions;
}

/// Clients can define custom options in extensions of this message. See above.
class EnumOptions extends CosmosProtoMessage {
  /// Set this option to true to allow mapping different tag names to the same
  /// value.
  final bool? allowAlias;

  /// Is this enum deprecated?
  /// Depending on the target platform, this can emit Deprecated annotations
  /// for the enum, or it will be completely ignored; in the very least, this
  /// is a formalization for deprecating enums.
  final bool? deprecated;

  /// javanano_as_lite
  /// Enable the legacy handling of JSON field name conflicts.  This lowercases
  /// and strips underscored from the fields before comparison in proto3 only.
  /// The new behavior takes `json_name` into account and applies to proto2 as
  /// well.
  /// had time to migrate.
  final bool? deprecatedLegacyJsonFieldConflicts;

  /// Any features defined in the specific edition.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final FeatureSet? features;

  /// The parser stores options it doesn't recognize here. See above.
  final List<UninterpretedOption> uninterpretedOption;

  const EnumOptions({
    this.allowAlias,
    this.deprecated,
    this.deprecatedLegacyJsonFieldConflicts,
    this.features,
    this.uninterpretedOption = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(2, hasOptionalFlags: true),
        ProtoFieldConfig.bool(
          3,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.bool(
          6,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.message(7, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    allowAlias,
    deprecated,
    deprecatedLegacyJsonFieldConflicts,
    features,
    uninterpretedOption,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'allow_alias': allowAlias,
      'deprecated': deprecated,
      'deprecated_legacy_json_field_conflicts':
          deprecatedLegacyJsonFieldConflicts,
      'features': features?.toJson(),
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
    };
  }

  factory EnumOptions.fromJson(Map<String, dynamic> json) {
    return EnumOptions(
      allowAlias: json.valueAsBool<bool?>('allow_alias', acceptCamelCase: true),
      deprecated: json.valueAsBool<bool?>('deprecated', acceptCamelCase: true),
      deprecatedLegacyJsonFieldConflicts: json.valueAsBool<bool?>(
        'deprecated_legacy_json_field_conflicts',
        acceptCamelCase: true,
      ),
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory EnumOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EnumOptions(
      allowAlias: decode.getBool<bool?>(2),
      deprecated: decode.getBool<bool?>(3),
      deprecatedLegacyJsonFieldConflicts: decode.getBool<bool?>(6),
      features: decode.messageTo<FeatureSet?>(
        7,
        (b) => FeatureSet.deserialize(b),
      ),
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufEnumOptions;
}

/// Clients can define custom options in extensions of this message. See above.
class EnumValueOptions extends CosmosProtoMessage {
  /// Is this enum value deprecated?
  /// Depending on the target platform, this can emit Deprecated annotations
  /// for the enum value, or it will be completely ignored; in the very least,
  /// this is a formalization for deprecating enum values.
  final bool? deprecated;

  /// Any features defined in the specific edition.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final FeatureSet? features;

  /// Indicate that fields annotated with this enum value should not be printed
  /// out when using debug formats, e.g. when the field contains sensitive
  /// credentials.
  final bool? debugRedact;

  /// Information about the support window of a feature value.
  final FieldOptionsFeatureSupport? featureSupport;

  /// The parser stores options it doesn't recognize here. See above.
  final List<UninterpretedOption> uninterpretedOption;

  const EnumValueOptions({
    this.deprecated,
    this.features,
    this.debugRedact,
    this.featureSupport,
    this.uninterpretedOption = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(
          1,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.message(2, hasOptionalFlags: true),
        ProtoFieldConfig.bool(
          3,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.message(4, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    deprecated,
    features,
    debugRedact,
    featureSupport,
    uninterpretedOption,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'deprecated': deprecated,
      'features': features?.toJson(),
      'debug_redact': debugRedact,
      'feature_support': featureSupport?.toJson(),
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
    };
  }

  factory EnumValueOptions.fromJson(Map<String, dynamic> json) {
    return EnumValueOptions(
      deprecated: json.valueAsBool<bool?>('deprecated', acceptCamelCase: true),
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      debugRedact: json.valueAsBool<bool?>(
        'debug_redact',
        acceptCamelCase: true,
      ),
      featureSupport: json
          .valueTo<FieldOptionsFeatureSupport?, Map<String, dynamic>>(
            key: 'feature_support',
            parse: (v) => FieldOptionsFeatureSupport.fromJson(v),
            acceptCamelCase: true,
          ),
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory EnumValueOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EnumValueOptions(
      deprecated: decode.getBool<bool?>(1),
      features: decode.messageTo<FeatureSet?>(
        2,
        (b) => FeatureSet.deserialize(b),
      ),
      debugRedact: decode.getBool<bool?>(3),
      featureSupport: decode.messageTo<FieldOptionsFeatureSupport?>(
        4,
        (b) => FieldOptionsFeatureSupport.deserialize(b),
      ),
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufEnumValueOptions;
}

/// Clients can define custom options in extensions of this message. See above.
class ServiceOptions extends CosmosProtoMessage {
  /// Any features defined in the specific edition.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final FeatureSet? features;

  /// Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
  /// framework.  We apologize for hoarding these numbers to ourselves, but
  /// we were already using them long before we decided to release Protocol
  /// Buffers.
  /// Is this service deprecated?
  /// Depending on the target platform, this can emit Deprecated annotations
  /// for the service, or it will be completely ignored; in the very least,
  /// this is a formalization for deprecating services.
  final bool? deprecated;

  /// The parser stores options it doesn't recognize here. See above.
  final List<UninterpretedOption> uninterpretedOption;

  const ServiceOptions({
    this.features,
    this.deprecated,
    this.uninterpretedOption = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.message(34, hasOptionalFlags: true),
        ProtoFieldConfig.bool(
          33,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [features, deprecated, uninterpretedOption];

  @override
  Map<String, dynamic> toJson() {
    return {
      'features': features?.toJson(),
      'deprecated': deprecated,
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
    };
  }

  factory ServiceOptions.fromJson(Map<String, dynamic> json) {
    return ServiceOptions(
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      deprecated: json.valueAsBool<bool?>('deprecated', acceptCamelCase: true),
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory ServiceOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ServiceOptions(
      features: decode.messageTo<FeatureSet?>(
        34,
        (b) => FeatureSet.deserialize(b),
      ),
      deprecated: decode.getBool<bool?>(33),
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufServiceOptions;
}

/// Clients can define custom options in extensions of this message. See above.
class MethodOptions extends CosmosProtoMessage {
  /// Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
  /// framework.  We apologize for hoarding these numbers to ourselves, but
  /// we were already using them long before we decided to release Protocol
  /// Buffers.
  /// Is this method deprecated?
  /// Depending on the target platform, this can emit Deprecated annotations
  /// for the method, or it will be completely ignored; in the very least,
  /// this is a formalization for deprecating methods.
  final bool? deprecated;

  /// idempotent, but may have side effects
  final MethodOptionsIdempotencyLevel? idempotencyLevel;

  /// Any features defined in the specific edition.
  /// WARNING: This field should only be used by protobuf plugins or special
  /// cases like the proto compiler. Other uses are discouraged and
  /// developers should rely on the protoreflect APIs for their client language.
  final FeatureSet? features;

  /// The parser stores options it doesn't recognize here. See above.
  final List<UninterpretedOption> uninterpretedOption;

  const MethodOptions({
    this.deprecated,
    this.idempotencyLevel,
    this.features,
    this.uninterpretedOption = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.bool(
          33,
          options: [ProtoOptionBool(name: "default", value: false)],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          34,
          options: [
            ProtoOptionString(name: "default", value: "IDEMPOTENCY_UNKNOWN"),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.message(35, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 999,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    deprecated,
    idempotencyLevel,
    features,
    uninterpretedOption,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'deprecated': deprecated,
      'idempotency_level': idempotencyLevel?.protoName,
      'features': features?.toJson(),
      'uninterpreted_option':
          uninterpretedOption.map((e) => e.toJson()).toList(),
    };
  }

  factory MethodOptions.fromJson(Map<String, dynamic> json) {
    return MethodOptions(
      deprecated: json.valueAsBool<bool?>('deprecated', acceptCamelCase: true),
      idempotencyLevel: json.valueTo<MethodOptionsIdempotencyLevel?, Object?>(
        key: 'idempotency_level',
        parse: (v) => MethodOptionsIdempotencyLevel.from(v),
      ),
      features: json.valueTo<FeatureSet?, Map<String, dynamic>>(
        key: 'features',
        parse: (v) => FeatureSet.fromJson(v),
        acceptCamelCase: true,
      ),
      uninterpretedOption:
          (json.valueEnsureAsList<dynamic>(
                'uninterpreted_option',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => UninterpretedOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory MethodOptions.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MethodOptions(
      deprecated: decode.getBool<bool?>(33),
      idempotencyLevel: decode.getEnum<MethodOptionsIdempotencyLevel?>(
        34,
        MethodOptionsIdempotencyLevel.values,
      ),
      features: decode.messageTo<FeatureSet?>(
        35,
        (b) => FeatureSet.deserialize(b),
      ),
      uninterpretedOption:
          decode
              .getListOfBytes(999)
              .map((b) => UninterpretedOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufMethodOptions;
}

/// Clients can define custom options in extensions of this message. See above.
/// A message representing a option the parser does not recognize. This only
/// appears in options protos created by the compiler::Parser class.
/// DescriptorPool resolves these when building Descriptor objects. Therefore,
/// options protos in descriptor objects (e.g. returned by Descriptor::options(),
/// or produced by Descriptor::CopyTo()) will never have UninterpretedOptions
/// in them.
class UninterpretedOption extends CosmosProtoMessage {
  final List<UninterpretedOptionNamePart> name;

  /// The value of the uninterpreted option, in whatever type the tokenizer
  /// identified it as during parsing. Exactly one of these should be set.
  final String? identifierValue;

  final BigInt? positiveIntValue;

  final BigInt? negativeIntValue;

  final double? doubleValue;

  final List<int>? stringValue;

  final String? aggregateValue;

  const UninterpretedOption({
    this.name = const [],
    this.identifierValue,
    this.positiveIntValue,
    this.negativeIntValue,
    this.doubleValue,
    this.stringValue,
    this.aggregateValue,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(3, hasOptionalFlags: true),
        ProtoFieldConfig.uint64(4, hasOptionalFlags: true),
        ProtoFieldConfig.int64(5, hasOptionalFlags: true),
        ProtoFieldConfig.double(6, hasOptionalFlags: true),
        ProtoFieldConfig.bytes(7, hasOptionalFlags: true),
        ProtoFieldConfig.string(8, hasOptionalFlags: true),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    identifierValue,
    positiveIntValue,
    negativeIntValue,
    doubleValue,
    stringValue,
    aggregateValue,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name.map((e) => e.toJson()).toList(),
      'identifier_value': identifierValue,
      'positive_int_value': positiveIntValue?.toString(),
      'negative_int_value': negativeIntValue?.toString(),
      'double_value': doubleValue,
      'string_value': switch (stringValue) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'aggregate_value': aggregateValue,
    };
  }

  factory UninterpretedOption.fromJson(Map<String, dynamic> json) {
    return UninterpretedOption(
      name:
          (json.valueEnsureAsList<dynamic>('name', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  UninterpretedOptionNamePart,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => UninterpretedOptionNamePart.fromJson(v),
                ),
              )
              .toList(),
      identifierValue: json.valueAsString<String?>(
        'identifier_value',
        acceptCamelCase: true,
      ),
      positiveIntValue: json.valueAsBigInt<BigInt?>(
        'positive_int_value',
        acceptCamelCase: true,
      ),
      negativeIntValue: json.valueAsBigInt<BigInt?>(
        'negative_int_value',
        acceptCamelCase: true,
      ),
      doubleValue: json.valueAsDouble<double?>(
        'double_value',
        acceptCamelCase: true,
      ),
      stringValue: json.valueAsBytes<List<int>?>(
        'string_value',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      aggregateValue: json.valueAsString<String?>(
        'aggregate_value',
        acceptCamelCase: true,
      ),
    );
  }

  factory UninterpretedOption.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UninterpretedOption(
      name:
          decode
              .getListOfBytes(2)
              .map((b) => UninterpretedOptionNamePart.deserialize(b))
              .toList(),
      identifierValue: decode.getString<String?>(3),
      positiveIntValue: decode.getBigInt<BigInt?>(4),
      negativeIntValue: decode.getBigInt<BigInt?>(5),
      doubleValue: decode.getDouble<double?>(6),
      stringValue: decode.getBytes<List<int>?>(7),
      aggregateValue: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufUninterpretedOption;
}

/// The name of the uninterpreted option.  Each string represents a segment in
/// a dot-separated name.  is_extension is true iff a segment represents an
/// extension (denoted with parentheses in options specs in .proto files).
/// E.g.,{ ["foo", false], ["bar.baz", true], ["moo", false] } represents
/// "foo.(bar.baz).moo".
class UninterpretedOptionNamePart extends CosmosProtoMessage {
  final String namePart;

  final bool isExtension;

  const UninterpretedOptionNamePart({
    required this.namePart,
    this.isExtension = false,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [namePart, isExtension];

  @override
  Map<String, dynamic> toJson() {
    return {'name_part': namePart, 'is_extension': isExtension};
  }

  factory UninterpretedOptionNamePart.fromJson(Map<String, dynamic> json) {
    return UninterpretedOptionNamePart(
      namePart: json.valueAsString<String>(
        'name_part',
        acceptCamelCase: true,
        onMissing: () => "",
      ),
      isExtension: json.valueAsBool<bool>(
        'is_extension',
        acceptCamelCase: true,
        onMissing: () => false,
      ),
    );
  }

  factory UninterpretedOptionNamePart.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return UninterpretedOptionNamePart(
      namePart: decode.getString<String>(1),
      isExtension: decode.getBool<bool>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufUninterpretedOptionNamePart;
}

/// ===================================================================
/// Features
/// not well scoped.  This means that each of the feature enums below can clash
/// with each other.  The short names we've chosen maximize call-site
/// readability, but leave us very open to this scenario.  A future feature will
/// be designed and implemented to handle this, hopefully before we ever hit a
/// conflict here.
class FeatureSet extends CosmosProtoMessage {
  final FeatureSetFieldPresence? fieldPresence;

  final FeatureSetEnumType? enumType;

  final FeatureSetRepeatedFieldEncoding? repeatedFieldEncoding;

  final FeatureSetUtf8Validation? utf8Validation;

  final FeatureSetMessageEncoding? messageEncoding;

  final FeatureSetJsonFormat? jsonFormat;

  final FeatureSetEnforceNamingStyle? enforceNamingStyle;

  final FeatureSetVisibilityFeatureDefaultSymbolVisibility?
  defaultSymbolVisibility;

  const FeatureSet({
    this.fieldPresence,
    this.enumType,
    this.repeatedFieldEncoding,
    this.utf8Validation,
    this.messageEncoding,
    this.jsonFormat,
    this.enforceNamingStyle,
    this.defaultSymbolVisibility,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(
          1,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_RUNTIME"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FIELD"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FILE"),
            ProtoOptionMap(
              name: "feature_support",
              value: {"edition_introduced": "EDITION_2023"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_LEGACY", "value": "EXPLICIT"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_PROTO3", "value": "IMPLICIT"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_2023", "value": "EXPLICIT"},
            ),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          2,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_RUNTIME"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_ENUM"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FILE"),
            ProtoOptionMap(
              name: "feature_support",
              value: {"edition_introduced": "EDITION_2023"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_LEGACY", "value": "CLOSED"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_PROTO3", "value": "OPEN"},
            ),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          3,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_RUNTIME"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FIELD"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FILE"),
            ProtoOptionMap(
              name: "feature_support",
              value: {"edition_introduced": "EDITION_2023"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_LEGACY", "value": "EXPANDED"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_PROTO3", "value": "PACKED"},
            ),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          4,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_RUNTIME"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FIELD"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FILE"),
            ProtoOptionMap(
              name: "feature_support",
              value: {"edition_introduced": "EDITION_2023"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_LEGACY", "value": "NONE"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_PROTO3", "value": "VERIFY"},
            ),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          5,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_RUNTIME"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FIELD"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FILE"),
            ProtoOptionMap(
              name: "feature_support",
              value: {"edition_introduced": "EDITION_2023"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_LEGACY", "value": "LENGTH_PREFIXED"},
            ),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          6,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_RUNTIME"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_MESSAGE"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_ENUM"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FILE"),
            ProtoOptionMap(
              name: "feature_support",
              value: {"edition_introduced": "EDITION_2023"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {
                "edition": "EDITION_LEGACY",
                "value": "LEGACY_BEST_EFFORT",
              },
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_PROTO3", "value": "ALLOW"},
            ),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          7,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_SOURCE"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FILE"),
            ProtoOptionString(
              name: "targets",
              value: "TARGET_TYPE_EXTENSION_RANGE",
            ),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_MESSAGE"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FIELD"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_ONEOF"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_ENUM"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_ENUM_ENTRY"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_SERVICE"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_METHOD"),
            ProtoOptionMap(
              name: "feature_support",
              value: {"edition_introduced": "EDITION_2024"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_LEGACY", "value": "STYLE_LEGACY"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_2024", "value": "STYLE2024"},
            ),
          ],
          hasOptionalFlags: true,
        ),
        ProtoFieldConfig.enumType(
          8,
          options: [
            ProtoOptionString(name: "retention", value: "RETENTION_SOURCE"),
            ProtoOptionString(name: "targets", value: "TARGET_TYPE_FILE"),
            ProtoOptionMap(
              name: "feature_support",
              value: {"edition_introduced": "EDITION_2024"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_LEGACY", "value": "EXPORT_ALL"},
            ),
            ProtoOptionMap(
              name: "edition_defaults",
              value: {"edition": "EDITION_2024", "value": "EXPORT_TOP_LEVEL"},
            ),
          ],
          hasOptionalFlags: true,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    fieldPresence,
    enumType,
    repeatedFieldEncoding,
    utf8Validation,
    messageEncoding,
    jsonFormat,
    enforceNamingStyle,
    defaultSymbolVisibility,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'field_presence': fieldPresence?.protoName,
      'enum_type': enumType?.protoName,
      'repeated_field_encoding': repeatedFieldEncoding?.protoName,
      'utf8_validation': utf8Validation?.protoName,
      'message_encoding': messageEncoding?.protoName,
      'json_format': jsonFormat?.protoName,
      'enforce_naming_style': enforceNamingStyle?.protoName,
      'default_symbol_visibility': defaultSymbolVisibility?.protoName,
    };
  }

  factory FeatureSet.fromJson(Map<String, dynamic> json) {
    return FeatureSet(
      fieldPresence: json.valueTo<FeatureSetFieldPresence?, Object?>(
        key: 'field_presence',
        parse: (v) => FeatureSetFieldPresence.from(v),
      ),
      enumType: json.valueTo<FeatureSetEnumType?, Object?>(
        key: 'enum_type',
        parse: (v) => FeatureSetEnumType.from(v),
      ),
      repeatedFieldEncoding: json
          .valueTo<FeatureSetRepeatedFieldEncoding?, Object?>(
            key: 'repeated_field_encoding',
            parse: (v) => FeatureSetRepeatedFieldEncoding.from(v),
          ),
      utf8Validation: json.valueTo<FeatureSetUtf8Validation?, Object?>(
        key: 'utf8_validation',
        parse: (v) => FeatureSetUtf8Validation.from(v),
      ),
      messageEncoding: json.valueTo<FeatureSetMessageEncoding?, Object?>(
        key: 'message_encoding',
        parse: (v) => FeatureSetMessageEncoding.from(v),
      ),
      jsonFormat: json.valueTo<FeatureSetJsonFormat?, Object?>(
        key: 'json_format',
        parse: (v) => FeatureSetJsonFormat.from(v),
      ),
      enforceNamingStyle: json.valueTo<FeatureSetEnforceNamingStyle?, Object?>(
        key: 'enforce_naming_style',
        parse: (v) => FeatureSetEnforceNamingStyle.from(v),
      ),
      defaultSymbolVisibility: json.valueTo<
        FeatureSetVisibilityFeatureDefaultSymbolVisibility?,
        Object?
      >(
        key: 'default_symbol_visibility',
        parse:
            (v) => FeatureSetVisibilityFeatureDefaultSymbolVisibility.from(v),
      ),
    );
  }

  factory FeatureSet.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return FeatureSet(
      fieldPresence: decode.getEnum<FeatureSetFieldPresence?>(
        1,
        FeatureSetFieldPresence.values,
      ),
      enumType: decode.getEnum<FeatureSetEnumType?>(
        2,
        FeatureSetEnumType.values,
      ),
      repeatedFieldEncoding: decode.getEnum<FeatureSetRepeatedFieldEncoding?>(
        3,
        FeatureSetRepeatedFieldEncoding.values,
      ),
      utf8Validation: decode.getEnum<FeatureSetUtf8Validation?>(
        4,
        FeatureSetUtf8Validation.values,
      ),
      messageEncoding: decode.getEnum<FeatureSetMessageEncoding?>(
        5,
        FeatureSetMessageEncoding.values,
      ),
      jsonFormat: decode.getEnum<FeatureSetJsonFormat?>(
        6,
        FeatureSetJsonFormat.values,
      ),
      enforceNamingStyle: decode.getEnum<FeatureSetEnforceNamingStyle?>(
        7,
        FeatureSetEnforceNamingStyle.values,
      ),
      defaultSymbolVisibility: decode
          .getEnum<FeatureSetVisibilityFeatureDefaultSymbolVisibility?>(
            8,
            FeatureSetVisibilityFeatureDefaultSymbolVisibility.values,
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufFeatureSet;
}

/// ===================================================================
/// Optional source code info
/// Encapsulates information about the original source file from which a
/// FileDescriptorProto was generated.
class SourceCodeInfo extends CosmosProtoMessage {
  /// A Location identifies a piece of source code in a .proto file which
  /// corresponds to a particular definition.  This information is intended
  /// to be useful to IDEs, code indexers, documentation generators, and similar
  /// tools.
  ///
  /// For example, say we have a file like:
  /// message Foo {
  /// optional string foo = 1;
  /// }
  /// Let's look at just the field definition:
  /// optional string foo = 1;
  /// ^       ^^     ^^  ^  ^^^
  /// a       bc     de  f  ghi
  /// We have the following locations:
  /// span   path               represents
  /// [a,i)  [ 4, 0, 2, 0 ]     The whole field definition.
  /// [a,b)  [ 4, 0, 2, 0, 4 ]  The label (optional).
  /// [c,d)  [ 4, 0, 2, 0, 5 ]  The type (string).
  /// [e,f)  [ 4, 0, 2, 0, 1 ]  The name (foo).
  /// [g,h)  [ 4, 0, 2, 0, 3 ]  The number (1).
  ///
  /// Notes:
  /// - A location may refer to a repeated field itself (i.e. not to any
  /// particular index within it).  This is used whenever a set of elements are
  /// logically enclosed in a single code segment.  For example, an entire
  /// extend block (possibly containing multiple extension definitions) will
  /// have an outer location whose path refers to the "extensions" repeated
  /// field without an index.
  /// - Multiple locations may have the same path.  This happens when a single
  /// logical declaration is spread out across multiple places.  The most
  /// obvious example is the "extend" block again -- there may be multiple
  /// extend blocks in the same scope, each of which will have the same path.
  /// - A location's span is not always a subset of its parent's span.  For
  /// example, the "extendee" of an extension declaration appears at the
  /// beginning of the "extend" block and is shared by all extensions within
  /// the block.
  /// - Just because a location's span is a subset of some other location's span
  /// does not mean that it is a descendant.  For example, a "group" defines
  /// both a type and a field in a single declaration.  Thus, the locations
  /// corresponding to the type and field and their components will overlap.
  /// - Code which tries to interpret locations should probably be designed to
  /// ignore those that it doesn't understand, as more types of locations could
  /// be recorded in the future.
  final List<SourceCodeInfoLocation> location;

  const SourceCodeInfo({this.location = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [location];

  @override
  Map<String, dynamic> toJson() {
    return {'location': location.map((e) => e.toJson()).toList()};
  }

  factory SourceCodeInfo.fromJson(Map<String, dynamic> json) {
    return SourceCodeInfo(
      location:
          (json.valueEnsureAsList<dynamic>('location', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  SourceCodeInfoLocation,
                  Map<String, dynamic>
                >(value: e, parse: (v) => SourceCodeInfoLocation.fromJson(v)),
              )
              .toList(),
    );
  }

  factory SourceCodeInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SourceCodeInfo(
      location:
          decode
              .getListOfBytes(1)
              .map((b) => SourceCodeInfoLocation.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufSourceCodeInfo;
}

class SourceCodeInfoLocation extends CosmosProtoMessage {
  /// Identifies which part of the FileDescriptorProto was defined at this
  /// location.
  ///
  /// Each element is a field number or an index.  They form a path from
  /// the root FileDescriptorProto to the place where the definition appears.
  /// For example, this path:
  /// [ 4, 3, 2, 7, 1 ]
  /// refers to:
  /// file.message_type(3)  // 4, 3
  /// .field(7)         // 2, 7
  /// .name()           // 1
  /// This is because FileDescriptorProto.message_type has field number 4:
  /// repeated DescriptorProto message_type = 4;
  /// and DescriptorProto.field has field number 2:
  /// repeated FieldDescriptorProto field = 2;
  /// and FieldDescriptorProto.name has field number 1:
  /// optional string name = 1;
  ///
  /// Thus, the above path gives the location of a field name.  If we removed
  /// the last element:
  /// [ 4, 3, 2, 7 ]
  /// this path refers to the whole field declaration (from the beginning
  /// of the label to the terminating semicolon).
  final List<int> path;

  /// Always has exactly three or four elements: start line, start column,
  /// end line (optional, otherwise assumed same as start line), end column.
  /// These are packed into a single field for efficiency.  Note that line
  /// and column numbers are zero-based -- typically you will want to add
  /// 1 to each before displaying to a user.
  final List<int> span;

  /// If this SourceCodeInfo represents a complete declaration, these are any
  /// comments appearing before and after the declaration which appear to be
  /// attached to the declaration.
  ///
  /// A series of line comments appearing on consecutive lines, with no other
  /// tokens appearing on those lines, will be treated as a single comment.
  ///
  /// leading_detached_comments will keep paragraphs of comments that appear
  /// before (but not connected to) the current element. Each paragraph,
  /// separated by empty lines, will be one comment element in the repeated
  /// field.
  ///
  /// Only the comment content is provided; comment markers (e.g. //) are
  /// stripped out.  For block comments, leading whitespace and an asterisk
  /// will be stripped from the beginning of each line other than the first.
  /// Newlines are included in the output.
  ///
  /// Examples:
  ///
  /// optional int32 foo = 1;  // Comment attached to foo.
  /// // Comment attached to bar.
  /// optional int32 bar = 2;
  ///
  /// optional string baz = 3;
  /// // Comment attached to baz.
  /// // Another line attached to baz.
  ///
  /// // Comment attached to moo.
  /// //
  /// // Another line attached to moo.
  /// optional double moo = 4;
  ///
  /// // Detached comment for corge. This is not leading or trailing comments
  /// // to moo or corge because there are blank lines separating it from
  /// // both.
  ///
  /// // Detached comment for corge paragraph 2.
  ///
  /// optional string corge = 5;
  /// /* Block comment attached
  /// * to corge.  Leading asterisks
  /// * will be removed. */
  /// /* Block comment attached to
  /// * grault. */
  /// optional int32 grault = 6;
  ///
  /// // ignored detached comments.
  final String? leadingComments;

  final String? trailingComments;

  final List<String> leadingDetachedComments;

  const SourceCodeInfoLocation({
    this.path = const [],
    this.span = const [],
    this.leadingComments,
    this.trailingComments,
    this.leadingDetachedComments = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v2,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.int32,
          options: [ProtoOptionBool(name: "packed", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.int32,
          options: [ProtoOptionBool(name: "packed", value: true)],
        ),
        ProtoFieldConfig.string(3, hasOptionalFlags: true),
        ProtoFieldConfig.string(4, hasOptionalFlags: true),
        ProtoFieldConfig.repeated(
          fieldNumber: 6,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    path,
    span,
    leadingComments,
    trailingComments,
    leadingDetachedComments,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'path': path.map((e) => e).toList(),
      'span': span.map((e) => e).toList(),
      'leading_comments': leadingComments,
      'trailing_comments': trailingComments,
      'leading_detached_comments':
          leadingDetachedComments.map((e) => e).toList(),
    };
  }

  factory SourceCodeInfoLocation.fromJson(Map<String, dynamic> json) {
    return SourceCodeInfoLocation(
      path:
          (json.valueEnsureAsList<dynamic>(
            'path',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsInt<int>(e)).toList(),
      span:
          (json.valueEnsureAsList<dynamic>(
            'span',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsInt<int>(e)).toList(),
      leadingComments: json.valueAsString<String?>(
        'leading_comments',
        acceptCamelCase: true,
      ),
      trailingComments: json.valueAsString<String?>(
        'trailing_comments',
        acceptCamelCase: true,
      ),
      leadingDetachedComments:
          (json.valueEnsureAsList<dynamic>(
            'leading_detached_comments',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory SourceCodeInfoLocation.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SourceCodeInfoLocation(
      path: decode.getListOrEmpty<int>(1),
      span: decode.getListOrEmpty<int>(2),
      leadingComments: decode.getString<String?>(3),
      trailingComments: decode.getString<String?>(4),
      leadingDetachedComments: decode.getListOrEmpty<String>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufSourceCodeInfoLocation;
}
