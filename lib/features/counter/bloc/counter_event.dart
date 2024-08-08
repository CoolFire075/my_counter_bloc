part of 'counter_bloc.dart';

sealed class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterZeroPressed extends CounterEvent {}
