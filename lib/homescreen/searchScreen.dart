// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.white,
//       statusBarIconBrightness: Brightness.dark,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;

//     const data = [
//       {'name': 'Education'},
//       {'name': 'Food'},
//       {'name': 'Old age homes'},
//       {'name': 'Organs'},
//     ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.fromLTRB(w * 0.05, w * 0.15, w * 0.05, w * 0.06),
//               child: TextField(
//                 textAlignVertical: TextAlignVertical.center,
//                 decoration: InputDecoration(
//                   hintText: "Search...",
//                   prefixIcon: Padding(
//                     padding: EdgeInsets.all(w * 0.04),
//                     child: Image.asset(
//                       "assets/icons/search_icon.png",
//                       color: Colors.black,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[300],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(w * 0.05, 0, w * 0.05, w * 0.05),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Donation Campaigns',
//                   style: TextStyle(
//                     fontSize: w * 0.045,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: w * 0.05),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Wrap(
//                   spacing: w * 0.03,
//                   runSpacing: h * 0.016,
//                   children: data.map((item) {
//                     return Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: h * 0.03, vertical: w * 0.03),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Color(0XFFC9C9C9), width: 1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text(
//                         item['name']!,
//                         style: TextStyle(
//                           fontSize: w * 0.038,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'dart:convert';
// import 'package:adhisree_foundation/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

// import 'donation_model/donation_details_screen.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   List campaigns = [];

//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.white,
//       statusBarIconBrightness: Brightness.dark,
//     ));
//   }

//   // API call function
//   Future<void> fetchCampaigns(String category) async {
//     final url = Uri.parse("${baseUrl}/active-campaign?category=$category");

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final List data = json.decode(response.body);
//         setState(() {
//           campaigns = data;
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("API error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;

//     const data = [
//       {'name': 'Education', 'value': 'education'},
//       {'name': 'Food', 'value': 'food'},
//       {'name': 'Old age homes', 'value': 'old_age'},
//       {'name': 'Organs', 'value': 'oragans'},
//     ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding:
//                   EdgeInsets.fromLTRB(w * 0.05, w * 0.15, w * 0.05, w * 0.06),
//               child: TextField(
//                 textAlignVertical: TextAlignVertical.center,
//                 decoration: InputDecoration(
//                   hintText: "Search...",
//                   prefixIcon: Padding(
//                     padding: EdgeInsets.all(w * 0.04),
//                     child: Icon(Icons.search, color: Colors.black),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[300],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: w * 0.05),
//               child: Text(
//                 'Donation Campaigns',
//                 style: TextStyle(
//                   fontSize: w * 0.045,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: w * 0.05, vertical: h * 0.015),
//               child: Wrap(
//                 spacing: w * 0.03,
//                 runSpacing: h * 0.016,
//                 children: data.map((item) {
//                   return GestureDetector(
//                     onTap: () {
//                       fetchCampaigns(item['value']!);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: h * 0.03, vertical: w * 0.03),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Color(0XFFC9C9C9), width: 1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text(
//                         item['name']!,
//                         style: TextStyle(
//                           fontSize: w * 0.038,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             Divider(),
//             Expanded(
//               child: campaigns.isEmpty
//                   ? Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.sentiment_dissatisfied,
//                               size: 60, color: Colors.grey),
//                           SizedBox(height: 10),
//                           Text(
//                             "No Active Campaigns",
//                             style: TextStyle(fontSize: 16, color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: campaigns.length,
//                       padding: EdgeInsets.symmetric(horizontal: w * 0.05),
//                       itemBuilder: (context, index) {
//                         final campaign = campaigns[index];
//                         return GestureDetector(
//                           onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DonationDetailsScreen(
//                                 id: campaign['id'],
//                                 golePrice: campaign['goal_price'],
//                                 totalDonation: double.parse(campaign['total_donation']).toInt(),
//                               ),
//                             ),
//                           );
//                         }, 
//                           child:  Card(
//                           elevation: 2,
//                           margin: EdgeInsets.symmetric(vertical: 8),
//                           child: ListTile(
//                             leading: Image.network(
//                               campaign['image'],
//                               width: 50,
//                               height: 50,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) =>
//                                   Icon(Icons.image_not_supported),
//                             ),
//                             title: Text(campaign['name'] ?? '' ,maxLines: 1,),
//                             subtitle: Text("Goal: ₹${campaign['goal_price']}"),
//                           ),
//                         ),);
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'dart:convert';
import 'package:adhisree_foundation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'donation_model/donation_details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List campaigns = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  // API: Search by text
  Future<void> searchCampaigns(String query) async {
    if (query.isEmpty) {
      setState(() {
        campaigns = [];
      });
      return;
    }

    final url = Uri.parse(
        "${baseUrl}/search-campaign?search=$query");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        setState(() {
          campaigns = data;
        });
      } else {
        print("Search error: ${response.statusCode}");
      }
    } catch (e) {
      print("Search API error: $e");
    }
  }

  // API: Fetch by category
  Future<void> fetchCampaigns(String category) async {
    final url = Uri.parse("${baseUrl}/active-campaign?category=$category");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        setState(() {
          campaigns = data;
        });
      } else {
        print("Category error: ${response.statusCode}");
      }
    } catch (e) {
      print("Category API error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    const categories = [
      {'name': 'Education', 'value': 'education'},
      {'name': 'Food', 'value': 'food'},
      {'name': 'Old age homes', 'value': 'old_age'},
      {'name': 'Organs', 'value': 'oragans'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.05, w * 0.15, w * 0.05, w * 0.06),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  searchCampaigns(value.trim());
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(w * 0.04),
                    child: Icon(Icons.search, color: Colors.black),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Text(
                'Donation Campaigns',
                style: TextStyle(
                  fontSize: w * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.015),
              child: Wrap(
                spacing: w * 0.03,
                runSpacing: h * 0.016,
                children: categories.map((item) {
                  return GestureDetector(
                    onTap: () {
                      fetchCampaigns(item['value']!);
                      searchController.clear();
                      setState(() {
                        campaigns = []; // clear current list before new fetch
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: h * 0.03, vertical: w * 0.03),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFFC9C9C9), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        item['name']!,
                        style: TextStyle(
                          fontSize: w * 0.038,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Divider(),
            Expanded(
              child: campaigns.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sentiment_dissatisfied,
                              size: 60, color: Colors.grey),
                          SizedBox(height: 10),
                          Text(
                            "No Active Campaigns",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: campaigns.length,
                      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                      itemBuilder: (context, index) {
                        final campaign = campaigns[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DonationDetailsScreen(
                                  id: campaign['id'],
                                  golePrice: campaign['goal_price'],
                                  totalDonation: double.parse(
                                          campaign['total_donation']
                                              .toString())
                                      .toInt(),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: Image.network(
                                campaign['image'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.image_not_supported),
                              ),
                              title:
                                  Text(campaign['name'] ?? '', maxLines: 1),
                              subtitle:
                                  Text("Goal: ₹${campaign['goal_price']}"),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
