
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  final base_url = '${dotenv.env['BASE_URL']}';
  final apiToken = '${dotenv.env['API_TOKEN']}';
}