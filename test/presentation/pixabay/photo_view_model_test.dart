import 'package:api_exe/data/data_source/result.dart';
import 'package:api_exe/domain/model/pixabay.dart';
import 'package:api_exe/domain/repository/photo_api_repository.dart';
import 'package:api_exe/domain/use_case/get_photos_use_case.dart';
import 'package:api_exe/presentation/pixabay/photo_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Stream 동작 확인', () async {
    final viewModel =
        PhotoViewModel(GetPhotosUseCase(FakePhotoApiRepository()));

    await viewModel.fetchPhoto('iphone');

    final List<Pixabay> result =
        fakeJson.map((e) => Pixabay.fromJson(e)).toList();

    expect(viewModel.state.pixabays, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Pixabay>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return Result.success(fakeJson.map((e) => Pixabay.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 256261,
    "pageURL":
        "https://pixabay.com/photos/apple-books-still-life-fruit-food-256261/",
    "type": "photo",
    "tags": "apple, books, still life",
    "previewURL":
        "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256261_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g6e3e1b2a287abb15d83738da33a50a4213cd4be50b5cbad72c61604f5dfe2a69ce29ba511024938e9aa6c347f8b1c6fb_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 423,
    "largeImageURL":
        "https://pixabay.com/get/gca28e34214c86565890071defd3580c40bcfb617493475120419aa72c6ced66f5a759f0dff4b7c8b9b7c26be11514d7564c5398632035bec6c962a415a8ba6a3_1280.jpg",
    "imageWidth": 4928,
    "imageHeight": 3264,
    "imageSize": 2987083,
    "views": 401129,
    "downloads": 192288,
    "collections": 3813,
    "likes": 980,
    "comments": 220,
    "user_id": 143740,
    "user": "jarmoluk",
    "userImageURL":
        "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
  },
  {
    "id": 1122537,
    "pageURL":
        "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
    "type": "photo",
    "tags": "apple, water droplets, fruit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/g3e26135363ff8320b02ac28195b8a6333e7341ddb4106df6d84714419be52efb4dce095f588506e3ded062431f00e81d464002c0ce879a7accde245ce9780476_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 409,
    "largeImageURL":
        "https://pixabay.com/get/gd8eb912100bf602b24c9e0aef96967e288e37a590d88664439fccb4d08e8ae850d45d264df3ce9042a7c0db3191f5514bc18b7204277dbc56083c5d48e9a5171_1280.jpg",
    "imageWidth": 4752,
    "imageHeight": 3044,
    "imageSize": 5213632,
    "views": 241481,
    "downloads": 136107,
    "collections": 3415,
    "likes": 1020,
    "comments": 160,
    "user_id": 1445608,
    "user": "mploscar",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/gf94a895d43f4c8bfa64b83fb038dd8a2c14f3fbe7708033b46a237f5e53646df96cec0b1e364ccb2dff34c9d293bdea1d63037a40cc7578c3a859aa2c05d6eaf_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gf9c887a5a5a68b34bb06cfd0291800685e5f76ab4f592942f157e62cbbce7d842aebd1a03ea7b99205a4a09105d799f63b6c929aac1eb5cdd7cf959c15688621_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 515171,
    "downloads": 379120,
    "collections": 6099,
    "likes": 869,
    "comments": 230,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  }
];
