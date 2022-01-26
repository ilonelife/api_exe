import 'package:api_exe/presentation/pixabay/photo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PixabayScreen extends StatefulWidget {
  const PixabayScreen({Key? key}) : super(key: key);

  @override
  State<PixabayScreen> createState() => _PixabayScreenState();
}

class _PixabayScreenState extends State<PixabayScreen> {
  final _textEditingController = TextEditingController();

  Future _showResult(String query) async {
    context.read<PhotoViewModel>().fetchPhoto(query);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _showResult('car');
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PhotoViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pixabay : 이미지 검색',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    viewModel.fetchPhoto(_textEditingController.text);
                    // _showResult(_textEditingController.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                children: viewModel.pixabays
                    .map((e) => Image.network(e.previewURL))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
