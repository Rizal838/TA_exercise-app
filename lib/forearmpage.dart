import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:exercise_app/forearm.dart';
import 'package:exercise_app/forearmapi.dart';
import 'package:exercise_app/forearmdetail.dart';

class ForearmPage extends StatefulWidget {
  const ForearmPage({super.key});

  @override
  State<ForearmPage> createState() => _ForearmPageState();
}

class _ForearmPageState extends State<ForearmPage> {
  late List<Forearm> _forearms;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getForearms();
  }

  Future<void> getForearms() async {
    _forearms = await ForearmApi.getForearm();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forearm Exercise'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _forearms.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      color: Color.fromARGB(255, 22, 118, 196),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        title: Text(_forearms[index].name.toString()),
                        subtitle:
                            Text('Type: ${_forearms[index].type.toString()}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  name: _forearms[index].name.toString(),
                                  type: _forearms[index].type.toString(),
                                  equipment:
                                      _forearms[index].equipment.toString(),
                                  instructions:
                                      _forearms[index].instructions.toString()),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
