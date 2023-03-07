import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import'package:equatable/equatable.dart';

class roleEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class setRoleVolunteer extends roleEvent{}
class setRoleElderly extends roleEvent{}



class roleBloc extends Bloc <roleEvent,String>{
  roleBloc():super('volunteer'){
    on<setRoleVolunteer>((event,emit)=>emit('volunteer'));
    on<setRoleElderly>((event,emit)=>emit('elderly'));

  }

}