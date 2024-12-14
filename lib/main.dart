import 'package:dummy_project/ui/login_screen/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/local_storage/storage_services.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();

  // await StorageServiceMixin.initHive();
  runApp(
    MaterialApp(
      home:ProviderScope(child: LoginScreen()),
    ),
  );
}
