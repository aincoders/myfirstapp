import 'package:flutter/material.dart';
import 'api_data_model_file.dart';
import 'api_try_file.dart'; // This file contains CountryInfo model

class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  late Future<List<CountryInfo>> countryListFuture;

  @override
  void initState() {
    super.initState();
    countryListFuture = getCountryListApiRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country List'),
      ),
      body: FutureBuilder<List<CountryInfo>>(
        future: countryListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            final countryList = snapshot.data!;
            return ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (context, index) {
                final country = countryList[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Text(
                      country.emoji ?? '🌎',
                      style: TextStyle(fontSize: 24),
                    ),
                    title: Text(country.name ?? 'Unknown'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (country.currency != null)
                          Text('Currency: ${country.currency}'),
                        if (country.phonecode != null)
                          Text('Phone Code: +${country.countryId}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
