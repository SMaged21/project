import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shopping/bloc/cubitProfile/CubitProfileState.dart';
import 'package:online_shopping/firebase/firestore.dart';

class CubitProfile extends Cubit<ProfileState> {
  static CubitProfile get(context) => BlocProvider.of(context);

  CubitProfile() : super(InitialState());

  Future<void> AddUser(String name, String phoneNumber, String age) async {
    emit(LoadingState());
    try {
      await FireStore.AddUserInfo(name, phoneNumber, age);
      emit(SuccessState());
    } catch (e) {
      print(e);
      emit(ErrorState(message: e.toString()));
    }
  }
}
