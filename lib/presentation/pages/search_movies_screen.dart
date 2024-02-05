import 'package:flutter/material.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? searchQuery;
    TextEditingController searchQueryController = TextEditingController();

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                TextField(
                  controller: searchQueryController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 12),
                  autofocus: true,
                  cursorColor: Colors.green[400],
                  decoration: InputDecoration(
                    fillColor: Colors.purple[50],
                    filled: true,
                    prefixIcon: Icon(Icons.location_city),
                    hintText: "Enter Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size(100, 30),
                  ),
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
