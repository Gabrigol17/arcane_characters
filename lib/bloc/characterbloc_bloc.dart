import 'package:arcane_characters/personajes/personaje.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'characterbloc_event.dart';
part 'characterbloc_state.dart';

class CharacterblocBloc extends Bloc<CharacterblocEvent, CharacterblocState>{
  CharacterblocBloc() : super(CharacterblocInitial()){
    on<LoadCharacterEvent>(event, emit) async {
      emit(CharacterblocLoading());
      try { //Aqui uso el Try para tratar de obtener el personaje, si da error, entonces para no dañar el codigo o q no se detenga pasa a el catch
        final personaje = await buscarpersonaje();
        if (personaje != null) {
          emit(CharacterblocSuccess(personaje));
        } else {
          emit(CharacterblocFailure('No se pudo cargar el personaje'));
        }
      } catch (error) // si da error entonces emite el error
      {
        emit(CharacterblocFailure('Error al cargar el personaje: $error'));
       }
    }
  }
}

