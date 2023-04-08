import 'package:equatable/equatable.dart';
import 'package:test_app/repo_layer/data.dart';

abstract class PetListStates extends Equatable {}

class InitialPetListState extends PetListStates {
  @override
  List<Object?> get props => [];
}

class LoadingPetListState extends PetListStates {
  @override
  List<Object?> get props => [];
}

class LoadedPetListState extends PetListStates {
  List<Pet> petList = [];
  LoadedPetListState(this.petList);

  @override
  List<Object?> get props => [petList];
}

class ErrorPetListState extends PetListStates {
  @override
  List<Object?> get props => [];
}
