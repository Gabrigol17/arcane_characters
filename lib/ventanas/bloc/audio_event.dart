part of 'audio_bloc.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object> get props => [];
}
enum AudioAction { play, pause}

class AudioControlEvent extends AudioEvent {
  AudioAction accion;
  AudioControlEvent(this.accion);
  @override
  List<Object> get props => [accion];
}

