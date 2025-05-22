import 'package:arcane_characters/personajes/personaje.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

part 'characterbloc_event.dart';
part 'characterbloc_state.dart';

class CharacterblocBloc extends Bloc<CharacterblocEvent, CharacterblocState> {
  CharacterblocBloc() : super(CharacterblocInitial()) {
    on<LoadCharacterEvent>((event, emit) async {
      emit(CharacterblocLoading());
      try {
        final personaje = await buscarpersonaje(event.id);
        if (personaje != null) {
          emit(CharacterblocSuccess(personaje));
        } else {
          emit(CharacterblocFailure('No se pudo cargar el personaje'));
        }
      } catch (error) {
        emit(CharacterblocFailure('Error al cargar el personaje: $error'));
      }
    });
  }
}
