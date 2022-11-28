import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:exercise_app/chest.dart';
import 'package:exercise_app/chestapi.dart';
import 'package:exercise_app/chestdetail.dart';

class ChestPage extends StatefulWidget {
  const ChestPage({super.key});

  @override
  State<ChestPage> createState() => _ChestPageState();
}

class _ChestPageState extends State<ChestPage> {
  late List<Chest> _chests;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getChests();
  }

  Future<void> getChests() async {
    _chests = await ChestApi.getChest();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chest Exercise'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _chests.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      color: Color.fromARGB(255, 22, 118, 196),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        title: Text(_chests[index].name.toString()),
                        subtitle:
                            Text('Type: ${_chests[index].type.toString()}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  name: _chests[index].name.toString(),
                                  type: _chests[index].type.toString(),
                                  equipment:
                                      _chests[index].equipment.toString(),
                                  instructions: _chests[index]
                                      .instructions!
                                      .split('.')
                                      .toString()),
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
