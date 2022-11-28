import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:exercise_app/chest.dart';
import 'package:exercise_app/chestapi.dart';

class DetailPage extends StatefulWidget {
  final String? name;
  final String? type;
  final String? equipment;
  final String? instructions;
  const DetailPage({super.key, this.name,this.type,this.equipment,this.instructions});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getChests();
  }

  Future<void> getChests() async {
    setState(() {
      _isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Detail'),
      ),
      body: _isLoading
      ? Center(child: CircularProgressIndicator(color: Color(0xAAFD4556),))
      : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name.toString(), style: 
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Text('Type: '+widget.type.toString()),
                Text('Equipment: '+widget.equipment.toString()),
                SizedBox(height: 20),
                Expanded(child: Text(widget.instructions.toString()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}