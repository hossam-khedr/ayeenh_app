import 'package:ayeenh/features/chat_pot/presentation/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../data/models/massage_model.dart';

class BotCubit extends Cubit<BotStates>{
  BotCubit():super(BotStates());
  TextEditingController userMessageController = TextEditingController();
   static const String apiKey = 'AIzaSyAFFdBWUM_Gu0lacwRv1ES3uGSJle8PB2I';
   List<MassageModel> massages = [];
   final model = GenerativeModel(model: 'gemini-pro',apiKey: apiKey);

   Future<void>sendMassage()async{
     final massage = userMessageController.text;
     userMessageController.clear();
     massages.add(MassageModel(true, massage, DateTime.now()));
     emit(state.copyWith(botStatus: BotStatus.userSendMassageSuccess));
     emit(state.copyWith(botStatus: BotStatus.loading));
     final content = [Content.text(massage)];
     final response = await model.generateContent(content);
     massages.add(MassageModel(false, response.text??'', DateTime.now()));
     emit(state.copyWith(botStatus: BotStatus.botSendMassageSuccess));
   }
}