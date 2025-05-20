import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioBloc() : super(AudioStop()) {
    on<AudioControlEvent>((event, emit) async {
      try {
        if (event.action == AudioAction.play) {
          await _audioPlayer.play(AssetSource('audio/enemy.mp3'));
          emit(AudioPlay());
        } else if (event.action == AudioAction.pause) {
          await _audioPlayer.pause();
          emit(AudioPause());
        } else if (event.action == AudioAction.stop) {
          await _audioPlayer.stop();
          emit(AudioStop());
        }
      } catch (error) {
        emit(AudioFailure('Error: $error'));
      }
    });
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
