import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/property_model.dart';
import '../repositories/property_repository.dart';

// Events
abstract class PropertyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProperties extends PropertyEvent {}

class AddProperty extends PropertyEvent {
  final Property property;

  AddProperty(this.property);

  @override
  List<Object?> get props => [property];
}

class UpdateProperty extends PropertyEvent {
  final Property property;

  UpdateProperty(this.property);

  @override
  List<Object?> get props => [property];
}

class DeleteProperty extends PropertyEvent {
  final int id;

  DeleteProperty(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class PropertyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PropertyLoading extends PropertyState {}

class PropertyLoaded extends PropertyState {
  final List<Property> properties;

  PropertyLoaded(this.properties);

  @override
  List<Object?> get props => [properties];
}

class PropertyError extends PropertyState {
  final String message;

  PropertyError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRepository repository;

  PropertyBloc(this.repository) : super(PropertyLoading()) {
    on<LoadProperties>((event, emit) async {
      try {
        final properties = await repository.fetchProperties();
        emit(PropertyLoaded(properties));
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    });

    on<AddProperty>((event, emit) async {
      try {
        await repository.addProperty(event.property);
        add(LoadProperties());
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    });

    on<UpdateProperty>((event, emit) async {
      try {
        await repository.updateProperty(event.property);
        add(LoadProperties());
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    });

    on<DeleteProperty>((event, emit) async {
      try {
        await repository.deleteProperty(event.id);
        add(LoadProperties());
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    });
  }
}
