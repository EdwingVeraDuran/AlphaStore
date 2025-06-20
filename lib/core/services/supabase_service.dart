import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initializeService() async {
    await Supabase.initialize(
      url: 'https://cyxlxbdlbbkqwvneipmu.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5eGx4YmRsYmJrcXd2bmVpcG11Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkyMjk3NjksImV4cCI6MjA2NDgwNTc2OX0.4OyNZ4hHhDaEPNkJHWkvA3phE_Zubp-aj-0-0qWNXdM',
    );
  }
}
