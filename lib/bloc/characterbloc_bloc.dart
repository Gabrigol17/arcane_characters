import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'characterbloc_event.dart';
part 'characterbloc_state.dart';

class CharacterblocBloc extends Bloc<CharacterblocEvent, CharacterblocState>{
  CharacterblocBloc() : super(CharacterblocInitial()){}
    }
  

