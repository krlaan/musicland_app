import 'package:musicland_app/state/auth/models/auth_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicland_app/typedef/user_id.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthResult? result,
    required bool isLoading,
    required UserId? userId,
  }) = _AuthState;

  const AuthState._();

  factory AuthState.unknown() => const AuthState(
    result: null,
    isLoading: false,
    userId: null,
  );
}
