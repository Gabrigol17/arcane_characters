part of 'characterbloc_bloc.dart';

sealed class CharacterblocEvent extends Equatable {
  const CharacterblocEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacterEvent extends CharacterblocEvent{}