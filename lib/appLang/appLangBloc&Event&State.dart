
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


class appLangEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
class setEN extends appLangEvent{}
class setZH extends appLangEvent{}
class setMS extends appLangEvent{}
class setTA extends appLangEvent{}


class appLangBloc extends Bloc<appLangEvent,String>{
  appLangBloc():super('en'){
    on<setEN>((event, emit) => emit('en'));
    on<setZH>((event, emit) => emit('zh'));
    on<setMS>((event, emit) => emit('ms'));
    on<setTA>((event, emit) => emit('ta'));

  }


}

