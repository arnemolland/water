import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:water/water.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SampleBlocDelegate(
    await Water.getInstance(),
  );

  runApp(Example());
}

class SampleBlocDelegate extends HydratedBlocDelegate {
  SampleBlocDelegate(HydratedStorage storage) : super(storage);
}

class SampleBloc extends HydratedBloc<int, int> {
  @override
  int get initialState => super.initialState ?? 0;

  @override
  int fromJson(Map<String, dynamic> json) => json['state'];

  @override
  Stream<int> mapEventToState(int event) async* {
    yield event;
  }

  @override
  Map<String, dynamic> toJson(int state) => {'state': state};
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: MaterialApp(
        home: BlocBuilder<SampleBloc, int>(
          builder: (context, state) {
            return Scaffold(
              body: Center(
                child: Text('$state'),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () =>
                    BlocProvider.of<SampleBloc>(context).add(state + 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
