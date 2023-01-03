import 'package:http/http.dart' as http; // as keyword used to tap into the package http
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;

      // var longitude =jsonDecode(data)['coord']['lon']; // square brackets hold the key, as per the json decoded tree on chrome which was accesses using the above website
      // print(longitude);
      //
      // var weatherDescription = jsonDecode(data)['weather'][0]['description']; // 0 is used here to indicate the index of the list as weather doesn't directly contain description
      // print(weatherDescription);
      // // we can use json viewer to directly copy the path from the gutter

      var decodedData = jsonDecode(
          data); // we use var keyword here instead of a data type because output of jsonDecode is of the type dynamic, it doesn't know what the output is going to be until it is processed
      return decodedData;
    }
    else {
      print(response.statusCode);
    }
  }
}