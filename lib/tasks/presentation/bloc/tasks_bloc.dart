

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managing_app/tasks/data/data/local/model/task_model.dart';
import 'package:task_managing_app/tasks/data/repository/task_repository.dart';


part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskRepository taskRepository;

  TasksBloc(this.taskRepository) : super(FetchTasksSuccess(tasks: const [])) {
    on<AddNewTaskEvent>(_addNewTask);
    on<FetchTaskEvent>(_fetchTasks);
    on<UpdateTaskEvent>(_updateTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<SortTaskEvent>(_sortTasks);
    on<SearchTaskEvent>(_searchTasks);
  }

  _addNewTask(AddNewTaskEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoading());
    try {
      if (event.taskModel.title.trim().isEmpty) {
        return emit(AddTaskFailure(error: 'Task title cannot be blank'));
      }
      if (event.taskModel.description.trim().isEmpty) {
        return emit(AddTaskFailure(error: 'Task description cannot be blank'));
      }
      if (event.taskModel.startDateTime == null) {
        return emit(AddTaskFailure(error: 'Missing task start date'));
      }
      if (event.taskModel.stopDateTime == null) {
        return emit(AddTaskFailure(error: 'Missing task stop date'));
      }
      await taskRepository.createNewTask(event.taskModel);
      emit(AddTasksSuccess());
      final tasks = await taskRepository.getTasks();
      return emit(FetchTasksSuccess(tasks: tasks));
    } catch (exception) {
      emit(AddTaskFailure(error: exception.toString()));
    }
  }

  void _fetchTasks(FetchTaskEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoading());
    try {
      final tasks = await taskRepository.getTasks();
      return emit(FetchTasksSuccess(tasks: tasks));
    } catch (exception) {
      emit(LoadTaskFailure(error: exception.toString()));
    }
  }

  _updateTask(UpdateTaskEvent event, Emitter<TasksState> emit) async {
    try {
      if (event.taskModel.title.trim().isEmpty) {
        return emit(UpdateTaskFailure(error: 'Task title cannot be blank'));
      }
      if (event.taskModel.description.trim().isEmpty) {
        return emit(
            UpdateTaskFailure(error: 'Task description cannot be blank'));
      }
      if (event.taskModel.startDateTime == null) {
        return emit(UpdateTaskFailure(error: 'Missing task start date'));
      }
      if (event.taskModel.stopDateTime == null) {
        return emit(UpdateTaskFailure(error: 'Missing task stop date'));
      }
      emit(TasksLoading());
      final tasks = await taskRepository.updateTask(event.taskModel);
      emit(UpdateTaskSuccess());
      return emit(FetchTasksSuccess(tasks: tasks));
    } catch (exception) {
      emit(UpdateTaskFailure(error: exception.toString()));
    }
  }

  _deleteTask(DeleteTaskEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoading());
    try {
      final tasks = await taskRepository.deleteTask(event.taskModel);
      return emit(FetchTasksSuccess(tasks: tasks));
    } catch (exception) {
      emit(LoadTaskFailure(error: exception.toString()));
    }
  }

  _sortTasks(SortTaskEvent event, Emitter<TasksState> emit) async {
    final tasks = await taskRepository.sortTasks(event.sortOption);
    if(event.sortOption == 2 && tasks.isEmpty){
      add(SortTaskEvent(sortOption: 1));
      return emit(NoTaskCompletedYet());
    }

     if(event.sortOption == 3 && tasks.isEmpty){
      add(SortTaskEvent(sortOption: 1));
      return emit(NoPendingTasksRightNow());
    }
    return emit(FetchTasksSuccess(tasks: tasks));
  }

  _searchTasks(SearchTaskEvent event, Emitter<TasksState> emit) async {
    final tasks = await taskRepository.searchTasks(event.keywords);
    
    return emit(FetchTasksSuccess(tasks: tasks, isSearching: true));
  }
}
