import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data.dart';

import 'list_states.dart';

class PetListCubit extends Cubit<PetListStates> {
  PetListCubit() : super(InitialPetListState()) {
    getPetList();
  }

  void getPetList() {
    emit(LoadingPetListState());
    List<Pet> data = getPetListData();

    emit(LoadedPetListState(data));
  }

  void error() {
    emit(ErrorPetListState());
  }
}
