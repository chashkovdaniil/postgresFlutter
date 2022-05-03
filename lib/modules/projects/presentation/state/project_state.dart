import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default(false) bool isAllowedAdmin,
    Project? currentProject,
  }) = _ProjectState;
}
