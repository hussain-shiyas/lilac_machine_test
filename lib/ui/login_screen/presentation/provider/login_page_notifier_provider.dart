import 'package:dummy_project/ui/login_screen/domain/provider/login_domain_provider.dart';
import 'package:dummy_project/ui/login_screen/presentation/state/login_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier/login_page_notifier.dart';

final loginPageNotifierProvider=StateNotifierProvider<LoginPageNotifier,LoginPageState>((ref){
  final repo =ref.read(repositoryProvider);
  return LoginPageNotifier(repo);
});