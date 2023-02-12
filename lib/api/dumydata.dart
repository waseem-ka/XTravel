// import 'package:bookingbus/api/api_provider.dart';
// import 'package:bookingbus/api_url.dart';
// import 'package:bookingbus/models/data_post.dart';

// class DumydataProvider {
//   final APIProvider apiProvider = APIProvider();

//   Future<List<DataPost>?> getPosts() async {
//     final res = await apiProvider.get(APIUrl.post);
//     if (res != null) {
//       final data = List.from(res);
//       return List<DataPost>.from(data.map((e) => DataPost.fromJson(e)));
//     }
//     return null;
//   }

//   Future<List<DataPost>?> postUser(String name, String password) async {
//     final data = {
//       "name": name,
//       "password": password,
//     };
//     final res = await apiProvider.post(APIUrl.post, data);
//     if (res != null) {
//       final data = List.from(res);
//       return List<DataPost>.from(data.map((e) => DataPost.fromJson(e)));
//     }
//     return null;
//   }
// }
