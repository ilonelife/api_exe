import 'package:api_exe/data/pixabay_api.dart';
import 'package:api_exe/model/pixabay.dart';
import 'package:flutter/material.dart';

class PixabayPage extends StatefulWidget {
  const PixabayPage({Key? key}) : super(key: key);

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  List<Pixabay> _pixabay = [];

  final _api = PixabayApi();
  final _textEditingController = TextEditingController();

  Future _showResult(String query) async {
    List<Pixabay> pixabay = await _api.fetchPixabay(query);
    setState(() {
      _pixabay = pixabay;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _showResult('iphone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pixabay : 이미지 검색',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
              onPressed: () {
                _showResult(_textEditingController.text);
              },
              icon: Icon(Icons.search),
            )),
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            children: _pixabay.map((e) => Image.network(e.previewURL)).toList(),
          ))
        ],
      ),
    );
  }
}
