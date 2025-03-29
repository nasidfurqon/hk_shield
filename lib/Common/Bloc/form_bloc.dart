import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:equatable/equatable.dart';

abstract class HKFormEvent extends Equatable {
  const HKFormEvent();

  @override
  List<Object?> get props => [];
}

class CreateHKFormEvent extends HKFormEvent {
  final GlobalKey<FormBuilderState> formKey;
  const CreateHKFormEvent(this.formKey);
}

class UpdateHKFormEvent extends HKFormEvent {
  final GlobalKey<FormBuilderState> formKey;
  const UpdateHKFormEvent(this.formKey);
}

class ReadHKFormEvent extends HKFormEvent {
  final GlobalKey<FormBuilderState> formKey;
  const ReadHKFormEvent(this.formKey);
}

abstract class HKFormState extends Equatable {
  const HKFormState();

  @override
  List<Object?> get props => [];
}

class HKFormInitial extends HKFormState {}

class HKFormLoading extends HKFormState {}

class HKFormSuccess extends HKFormState {
  final String message;
  const HKFormSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class HKFormFailure extends HKFormState {
  final String error;
  const HKFormFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class HKFormBloc extends Bloc<HKFormEvent, HKFormState> {
  HKFormBloc() : super(HKFormInitial()) {
    on<CreateHKFormEvent>(_onCreate);
    on<UpdateHKFormEvent>(_onUpdate);
    on<ReadHKFormEvent>(_onRead);
  }

  void _onCreate(CreateHKFormEvent event, Emitter<HKFormState> emit) {
    emit(HKFormLoading());
    Future.delayed(Duration(seconds: 1), () {
      emit(HKFormSuccess("Form created successfully!"));
    });
  }

  void _onUpdate(UpdateHKFormEvent event, Emitter<HKFormState> emit) {
    emit(HKFormLoading());
    Future.delayed(Duration(seconds: 1), () {
      emit(HKFormSuccess("Form updated successfully!"));
    });
  }

  void _onRead(ReadHKFormEvent event, Emitter<HKFormState> emit) {
    emit(HKFormLoading());
    Future.delayed(Duration(seconds: 1), () {
      emit(HKFormSuccess("Form read successfully!"));
    });
  }
}
