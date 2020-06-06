<img src="https://github.com/arnemolland/water/blob/master/assets/water.png?raw=true" alt="water" style="zoom:1%;float: left;" height="72" />

![water](https://github.com/arnemolland/water/workflows/Flutter%20CI/badge.svg) ![pub](https://img.shields.io/pub/v/water?logo=flutter) [![style: pedantic](https://img.shields.io/badge/style-pedantic-9cf)](https://github.com/dart-lang/pedantic) ![license](https://img.shields.io/github/license/arnemolland/water)

An implementation of HydratedStorage using Hive, a fast and lightweight key-value database

## Usage

```dart
final water = await Water.getInstance();
```

## Example

With HydratedBlocDelegate

```dart
BlocSupervisor.delegate = await WaterDelegate.build();
```
