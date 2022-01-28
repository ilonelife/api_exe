import 'package:api_exe/data/data_source/pixabay_api.dart';
import 'package:api_exe/data/repository/photo_api_repository_impl.dart';
import 'package:api_exe/domain/repository/photo_api_repository.dart';
import 'package:api_exe/domain/use_case/get_photos_use_case.dart';
import 'package:api_exe/presentation/pixabay/photo_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// 1. Provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

// 2. 독립적인 객체
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  ),
];

// 3.  2번에 의존성 있는 객체
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PixabayApi>(
    update: (context, client, _) => PixabayApi(client),
  ),
  ProxyProvider<PixabayApi, PhotoApiRepository>(
    update: (context, api, _) => PhotoApiRepositoryImpl(api),
  ),
  ProxyProvider<PhotoApiRepository, GetPhotosUseCase>(
    update: (context, repository, _) => GetPhotosUseCase(repository),
  ),
];

// 4. ViewModels
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<PhotoViewModel>(
    create: (context) => PhotoViewModel(context.read<GetPhotosUseCase>()),
  )
];
