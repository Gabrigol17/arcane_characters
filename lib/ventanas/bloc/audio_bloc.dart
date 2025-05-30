import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer audioPlayer = AudioPlayer();

  AudioBloc() : super(AudioPause()) {
    on<AudioControlEvent>((event, emit) async {
      try {
        if (event.accion == AudioAction.play) {
          await audioPlayer.play(AssetSource('audio/enemy.mp3'));
          emit(AudioPlay());
        } else if (event.accion == AudioAction.pause) {
          await audioPlayer.pause();
          emit(AudioPause());
        }
      } catch (error) {
        emit(AudioFailure('Error: $error'));
      }
    });
  }
  }

