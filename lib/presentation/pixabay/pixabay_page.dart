import 'package:api_exe/data/pixabay_api.dart';
import 'package:api_exe/model/pixabay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    _showResult('car');
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showResult(_textEditingController.text);
                    },
                    icon: Icon(Icons.search),
                  ),
                  //     border: UnderlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: StaggeredGridView.countBuilder(
                  itemCount: 30,
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  itemBuilder: (context, idx) => Image.network(
                    _pixabay[idx % 4].previewURL,
                    fit: BoxFit.cover,
                  ),
                  staggeredTileBuilder: (idx) =>
                      (idx % 6 == 0 || (idx - 4) % 6 == 0)
                          ? const StaggeredTile.count(2, 2)
                          : const StaggeredTile.count(1, 1),
                ),
              ),
            )
            // Expanded(
            //   child: StaggeredGrid.count(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 2,
            //     mainAxisSpacing: 2,
            //     children: _pixabay
            //         .map(
            //           (e) => Image.network(
            //             e.previewURL,
            //             fit: BoxFit.cover,
            //           ),
            //         )
            //         .toList(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
