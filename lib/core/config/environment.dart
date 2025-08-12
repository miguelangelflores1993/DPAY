import 'package:flutter_dotenv/flutter_dotenv.dart';

enum ENV { production, development, qa, local, staging }

String apiUrlCatalog = dotenv.env['API_URL_CATALOG'] ?? 'API_URL_NOT_SET';
String apiUrlSales = dotenv.env['API_URL_SALES'] ?? 'API_URL_NOT_SET';
String apiUrlIdentity = dotenv.env['API_URL_IDENTITY'] ?? 'API_URL_NOT_SET';
String apiUrlDoofinder = "${dotenv.env['DOOFINDER_SEARCH_API_URL']}";
String apiKeyDoofinder = dotenv.env['DOOFINDER_API_KEY'] ?? 'API_URL_NOT_SET';
String apiKeyCms = dotenv.env['BEARER_CMS_TOKEN'] ?? 'API_URL_NOT_SET';
String googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? 'GOOGLE_MAPS_API_KEY_NOT_SET';
String apiUrlDoofinderManagement = "${dotenv.env['DOOFINDER_MANAGEMENT_API_URL']}";
String apiUrlCms = dotenv.env['API_CMS_URL'] ?? 'API_CMS_URL_NOT_SET';
String sentryDns = dotenv.env['SENTRY_DNS'] ?? 'SENTRY_DNS_NOT_SET';

Future<void> initEnvironment(ENV env) async {
  switch (env) {
    case ENV.production:
      await dotenv.load(fileName: '.env.prod');
    case ENV.development:
      await dotenv.load(fileName: '.env.dev');
    case ENV.staging:
      await dotenv.load(fileName: '.env.stg');
    case ENV.qa:
      await dotenv.load(fileName: '.env.qa');
    case ENV.local:
      await dotenv.load(fileName: '.env.local');
  }
}
