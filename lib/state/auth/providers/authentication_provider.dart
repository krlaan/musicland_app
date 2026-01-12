import 'package:musicland_app/state/auth/models/auth_result.dart';
import 'package:musicland_app/state/auth/models/auth_state.dart';
import 'package:musicland_app/state/user_info/backend/user_info_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:musicland_app/state/auth/backend/authenticator.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  @override
  AuthState build() {
    if (_authenticator.isAlreadyLoggedIn) {
      return AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
    return AuthState.unknown();
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    state = state.copyWith(isLoading: true);

    final result =
    await _authenticator.loginWithEmailAndPassword(email, password);

    // Simulate a network request on slow environments
    //await Future.delayed(const Duration(seconds: 3));

    final userId = _authenticator.userId;

    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  Future<void> logOut() async {
    await _authenticator.logOut();
    state = AuthState.unknown();
  }

  Future<void> registerWithEmailAndPassword(
      {required String name,
        required String email,
        required String password}) async {
    state = state.copyWith(isLoading: true);

    final result =
    await _authenticator.registerWithEmailAndPassword(email, password);

    final userId = _authenticator.userId;

    if (result == AuthResult.success && userId != null) {
      saveUserInfo(userId: userId, email: email, name: name);
    }

    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  Future<void> saveUserInfo(
      {required String userId, String? email, String? name}) {
    return _userInfoStorage.saveOrUpdateUserInfo(
      userId: userId,
      displayName: name,
      email: email,
    );
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(isLoading: true);

    final result = await _authenticator.signInWithGoogle();

    final userId = _authenticator.userId;

    // Save user info if sign-in was successful
    if (result == AuthResult.success && userId != null) {
      // Get name and email from Firebase Auth (Google provides them automatically)
      final displayName = _authenticator.currentUserDisplayName;
      final email = _authenticator.currentUserEmail;
      
      // Create user info so profile setup form appears
      await saveUserInfo(
        userId: userId,
        email: email,
        name: displayName,
      );
    }

    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }
}
