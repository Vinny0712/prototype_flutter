import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'package:eldtech_sos/userRepo.dart';

abstract class spokenLangEvent extends Equatable{}

class addSpokenLang extends spokenLangEvent{
  String spokenLang;

  addSpokenLang(this.spokenLang);
  @override
  List<Object> get props => [];
}

class deleteSpokenLang extends spokenLangEvent{
  String spokenLang;

  deleteSpokenLang(this.spokenLang);
  @override
  List<Object> get props => [];
}
class submitSpokenLang extends spokenLangEvent{

  @override
  List<Object> get props => [];
}

abstract class spokenLangState {


}

/*class initialSpokenLangState extends spokenLangState{
  @override
  List<Object?> get props => [];
}*/

class updatedSpokenLang extends spokenLangState{
   List<String>selectedLang;
   List<String>unselectedLang;
  updatedSpokenLang(this.selectedLang,this.unselectedLang);

}

/*class SpokenLangSubmitted extends spokenLangState{
  @override
  List<Object?> get props => [];
}*/



class spokenLangBloc extends Bloc <spokenLangEvent,spokenLangState> {
  static List<String>selected=[];
  static List<String>unselected=[
    'English',
    '中文',
    'melayu',
    'தமிழ்',
    'Hokkien',
    'Cantonese',
    'Teochew',
    'Hakka'
  ];

  spokenLangBloc():super(updatedSpokenLang(selected,unselected)) {
    on<addSpokenLang>((event, emit) {
      selected.add(event.spokenLang);
      unselected.remove(event.spokenLang);
      print(selected.toString());
      print(unselected.toString());
      emit(updatedSpokenLang(selected, unselected));
    });
    on<deleteSpokenLang>((event, emit) {
      unselected.add(event.spokenLang);
      selected.remove(event.spokenLang);
      emit(updatedSpokenLang(selected, unselected));
    });
    on<submitSpokenLang>((event,emit){

        userRepo.setInitialSLang(selected);



    });
  }

}