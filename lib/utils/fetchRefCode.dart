
import 'package:install_referrer/install_referrer.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> fetchReferrerCode() async {
  try {
    // This directly fetches the install referrer string
    final String referrerUrl = (await InstallReferrer.referrer) as String;

    if (referrerUrl != null && referrerUrl.contains("refId=")) {
      // Trick to parse query parameters from referrer string
      final Uri uri = Uri.parse("https://dummy.com/?" + referrerUrl);
      final String? refId = uri.queryParameters['refId'];

      if (refId != null && refId.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("refId", refId);
        print("Referral ID saved: $refId");
      }
    } else {
      print("No referral ID found in referrer string.");
    }
  } catch (e) {
    print("Error fetching referrer: $e");
  }
}
