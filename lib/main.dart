import 'package:alpha_store/app.dart';
import 'package:alpha_store/core/util/injection_container.dart';
import 'package:alpha_store/core/services/supabase_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await SupabaseService.initializeService();
  runApp(const App());
}
