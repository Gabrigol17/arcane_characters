import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'characterbloc_event.dart';
part 'characterbloc_state.dart';

class CharacterblocBloc extends Bloc<CharacterblocEvent, CharacterblocState> {
  CharacterblocBloc() : super(CharacterblocInitial()) {
    on<CharacterblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
