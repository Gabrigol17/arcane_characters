part of 'characterbloc_bloc.dart';

sealed class CharacterblocState extends Equatable {
  const CharacterblocState();
  
  @override
  List<Object> get props => [];
}

final class CharacterblocInitial extends CharacterblocState {}
