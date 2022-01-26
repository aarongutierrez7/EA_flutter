// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_project/components/card.dart';
import 'package:flutter_project/models/API/flats_response_model.dart';
import 'package:flutter_project/screens/Flats/flats_logic.dart';
import 'package:flutter_project/screens/SideBar/sidebar_UI.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class FlatsScreen extends StatefulWidget {
  const FlatsScreen({Key? key}) : super(key: key);

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
    _flats = await FlatsService.getFlats();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: HexColor("#1C3144"),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.bedroom_child_outlined),
                  SizedBox(width: 10),
                  Text(
                    'List of available flats',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/add-flats');
            }),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _flats.length,
                itemBuilder: (context, index) {
                  return FlatsCard(
                      name: _flats[index].name!,
                      creator: _flats[index].creator!,
                      price: _flats[index].price.toString(),
                      picture: _flats[index].picture!,
                      description: _flats[index].description!);
                },
              ));
  }
}
