import 'package:flutter/material.dart';
import 'package:flutter_project/components/card.dart';
import 'package:flutter_project/models/flats_response_model.dart';
import 'package:flutter_project/services/api_service.dart';

class FlatsScreen extends StatefulWidget {
  @override
  _FlatsScreenState createState() => _FlatsScreenState();
}

class _FlatsScreenState extends State<FlatsScreen> {
  late List<FlatsResponseModel> _flats;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getFlats();
  }

  Future<void> getFlats() async {
    _flats = await APIService.getFlats();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.house_rounded),
              SizedBox(width: 10),
              Text('List of available falts')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _flats.length,
                itemBuilder: (context, index) {
                  return FlatsCard(
                      name: _flats[index].name,
                      creator: _flats[index].creator,
                      price: _flats[index].price.toString(),
                      picture: _flats[index].picture);
                },
              ));
  }
}
