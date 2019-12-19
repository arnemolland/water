import 'dart:io';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'water.dart';

class WaterDelegate extends HydratedBlocDelegate {
  WaterDelegate(HydratedStorage storage) : super(storage);

  static Future<WaterDelegate> build({Directory storageDirectory}) async =>
      WaterDelegate(
          await Water.getInstance(storageDirectory: storageDirectory));
}
