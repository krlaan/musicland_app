import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/authentication_provider.dart';
import 'package:musicland_app/typedef/user_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_id_provider.g.dart';

@riverpod
UserId? userId(Ref ref) {
  return ref.watch(authenticationProvider).userId;
}

//Same as UserId? userId(Ref ref) => ref.watch(authenticationProvider).userId;
