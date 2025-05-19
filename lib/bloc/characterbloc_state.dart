part of 'characterbloc_bloc.dart';

sealed class CharacterblocState extends Equatable {
  const CharacterblocState();
  
  @override
  List<Object> get props => [];
}

class CharacterblocInitial extends CharacterblocState {}
class CharacterblocLoading extends CharacterblocState {}
class CharacterblocSuccess extends CharacterblocState {
  Character? personaje;
  CharacterblocSuccess(this.personaje);
}
class CharacterblocFailure extends CharacterblocState {
  String? mensajeError;
  CharacterblocFailure(this.mensajeError);
}

