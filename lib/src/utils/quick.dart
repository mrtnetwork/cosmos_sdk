import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:blockchain_utils/utils/numbers/utils/int_utils.dart';
import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

typedef ONQUICKMAPFAILED = DartCosmosSdkPluginException Function(bool notfound);

extension QuickMap on Map<String, dynamic> {
  static const Map<String, dynamic> _map = {};
  static const List _list = [];
  T as<T>(String key, {ONQUICKMAPFAILED? onError}) {
    final value = this[key];
    if (value == null) {
      if (null is T) {
        return null as T;
      }
      if (onError != null) {
        throw onError(true);
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      return value as T;
    } on TypeError {
      if (onError != null) {
        throw onError(false);
      }
      throw DartCosmosSdkPluginException(
        'Incorrect value.',
        details: {
          'key': key,
          'expected': '$T',
          'value': value.runtimeType,
          'data': this,
        },
      );
    }
  }

  T asBigInt<T>(String key, {bool sign = true, ONQUICKMAPFAILED? onError}) {
    final value = this[key];
    if (value == null) {
      if (null is T) {
        return null as T;
      }
      if (onError != null) {
        throw onError(true);
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      final v = BigintUtils.parse(value);
      if (!sign && v.isNegative) {
        if (onError != null) {
          throw onError(false);
        }
        throw DartCosmosSdkPluginException(
          'Incorrect Unsigned value.',
          details: {
            'key': key,
            'expected': '$T',
            'value': v.runtimeType,
            'data': this,
          },
        );
      }
      return v as T;
    } catch (_) {
      if (onError != null) {
        throw onError(false);
      }
      throw DartCosmosSdkPluginException(
        'Incorrect value.',
        details: {
          'key': key,
          'expected': '$T',
          'value': value.runtimeType,
          'data': this,
        },
      );
    }
  }

  T asInt<T>(String key) {
    final value = this[key];
    if (value == null) {
      if (null is T) {
        return null as T;
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      return IntUtils.parse(value) as T;
    } on TypeError {
      throw DartCosmosSdkPluginException(
        'Incorrect value.',
        details: {
          'key': key,
          'expected': '$T',
          'value': value.runtimeType,
          'data': this,
        },
      );
    }
  }

  E asMap<E>(String key, {ONQUICKMAPFAILED? onError}) {
    if (_map is! E) {
      throw const DartCosmosSdkPluginException(
        'Invalid map casting. only use `asMap` method for casting Map<String,dynamic>.',
      );
    }
    final Map? value = as(key);
    if (value == null) {
      if (null is E) {
        return null as E;
      }
      if (onError != null) {
        throw onError(true);
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      return value.cast<String, dynamic>() as E;
    } on TypeError {
      if (onError != null) {
        throw onError(false);
      }
      throw DartCosmosSdkPluginException(
        'Incorrect value.',
        details: {
          'key': key,
          'expected': '$E',
          'value': value.runtimeType,
          'data': this,
        },
      );
    }
  }

  List<int>? asBytes(String key, {bool throwOnNull = false}) {
    final value = as<String?>(key);
    if (value == null) {
      if (throwOnNull) {
        throw DartCosmosSdkPluginException(
          'Key not found.',
          details: {'key': key, 'data': this},
        );
      }
      return null;
    }
    try {
      return CosmosUtils.toBytes(value);
    } on TypeError {
      throw DartCosmosSdkPluginException(
        'Incorrect value .',
        details: {'key': key, 'data': this},
      );
    }
  }

  List<Map<String, dynamic>>? asListOfMap(
    String key, {
    ONQUICKMAPFAILED? onError,
    bool throwOnNull = false,
  }) {
    final List? value = as(key);
    if (value == null) {
      if (!throwOnNull) {
        return null;
      }
      if (onError != null) {
        onError(true);
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      return value.map((e) => (e as Map).cast<String, dynamic>()).toList();
    } catch (e, s) {
      if (onError != null) {
        onError(false);
      }
      throw DartCosmosSdkPluginException(
        'Incorrect value.',
        details: {
          'key': key,
          'value': value.runtimeType,
          'data': this,
          'error': e.toString(),
          'stack': s.toString(),
        },
      );
    }
  }

  List<String>? asListOfString(String key, {bool throwOnNull = true}) {
    final List? value = as(key);
    if (value == null) {
      if (!throwOnNull) {
        return null;
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      return value.cast<String>();
    } catch (e, s) {
      throw DartCosmosSdkPluginException(
        'Incorrect value.',
        details: {
          'key': key,
          'value': value.runtimeType,
          'data': this,
          'error': e.toString(),
          'stack': s.toString(),
        },
      );
    }
  }

  List<List<int>>? asListOfBytes(String key, {bool throwOnNull = true}) {
    final List? value = as(key);
    if (value == null) {
      if (!throwOnNull) {
        return null;
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      return value.map((e) => (e as List).cast<int>()).toList();
    } catch (e, s) {
      throw DartCosmosSdkPluginException(
        'Incorrect value.',
        details: {
          'key': key,
          'value': value.runtimeType,
          'data': this,
          'error': e.toString(),
          'stack': s.toString(),
        },
      );
    }
  }

  E _valueAsList<T, E>(String key) {
    if (_list is! E) {
      throw const DartCosmosSdkPluginException(
        'Invalid list casting. only use `valueAsList` method for list casting.',
      );
    }
    final List? value = as(key);
    if (value == null) {
      if (null is E) {
        return null as E;
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      if (_map is T) {
        return value.map((e) => (e as Map).cast<String, dynamic>()).toList()
            as E;
      }
      return value.cast<T>() as E;
    } on TypeError {
      throw DartCosmosSdkPluginException(
        'Incorrect value.',
        details: {
          'key': key,
          'expected': '$T',
          'value': value.runtimeType,
          'data': this,
        },
      );
    }
  }

  E? maybeAs<E, T>({required String key, required E Function(T e) onValue}) {
    if (this[key] != null) {
      if (_map is T) {
        return onValue(asMap(key));
      }

      if (_list is T) {
        return onValue(_valueAsList(key));
      }
      return onValue(as(key));
    }
    return null;
  }

  A asAddress<A extends CosmosBaseAddress?>(String key) {
    final value = this[key];
    if (value == null) {
      if (null is A) {
        return null as A;
      }
      throw DartCosmosSdkPluginException(
        'Key not found.',
        details: {'key': key, 'data': this},
      );
    }
    try {
      return CosmosBaseAddress(value) as A;
    } catch (_) {
      throw DartCosmosSdkPluginException(
        "Invalid cosmos address.",
        details: {"key": key, "value": value.toString()},
      );
    }
  }
}
