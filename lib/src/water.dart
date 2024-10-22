import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

/// Implementation of [HydratedStorage] which uses `PathProvider` and `Hive`
/// to persist and retrieve state changes from the local device.
class Water implements HydratedStorage {
  static Water _instance;
  final Box _box;

  /// Returns an instance of [Water].
  /// [storageDirectory] can optionally be provided.
  /// By default, [Directory.current] is used.
  static Future<Water> getInstance({
    Directory storageDirectory,
  }) async {
    if (_instance != null) {
      return _instance;
    }
    if (!kIsWeb) {
      final directory = storageDirectory ?? await getTemporaryDirectory();
      Hive.init(directory.path);
    }

    final box = await Hive.openBox('water');

    _instance = Water._(box);
    return _instance;
  }

  Water._(this._box);

  @override
  Future<void> clear() async {
    if (_box.isOpen) {
      _instance = null;
      return await _box.deleteFromDisk();
    } else {
      return null;
    }
  }

  @override
  Future<void> delete(String key) {
    if (_box.isOpen) {
      return _box.delete(key);
    } else {
      return null;
    }
  }

  @override
  dynamic read(String key) {
    if (_box.isOpen) {
      return _box.get(key);
    } else {
      return null;
    }
  }

  @override
  Future<void> write(String key, dynamic value) {
    if (_box.isOpen) {
      return _box.put(key, value);
    } else {
      return null;
    }
  }
}
