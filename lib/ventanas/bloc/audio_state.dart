part of 'audio_bloc.dart';

abstract class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object> get props => [];
}

class AudioPlay extends AudioState {}

class AudioInitial extends AudioState {}

class AudioPause extends AudioState {}


class AudioFailure extends AudioState {
  final String mensajeError;

  const AudioFailure(this.mensajeError);

  @override
  List<Object> get props => [mensajeError];
}
