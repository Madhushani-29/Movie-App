import 'package:flutter/material.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({Key? key}) : super(key: key);

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
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      searchQuery = value;
                    },
                    controller: searchQueryController,
                    keyboardType: TextInputType.name,
                    style: TextStyle(fontSize: 12),
                    autofocus: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
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
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Clicked");
                    print(searchQuery);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: const Size(100, 30),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
