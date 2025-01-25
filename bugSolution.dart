```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      //More specific error handling
      throw HttpException('HTTP request failed with status: ${response.statusCode}', uri: Uri.parse('https://api.example.com/data'));
    }
  } on SocketException catch (e) {
    print('SocketException: $e');
    //Handle network errors specifically
  } on FormatException catch (e) {
    print('JSON format error: $e');
    //Handle JSON decoding errors specifically
  } on HttpException catch(e){
    print('HTTP error: ${e.message} at ${e.uri}');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```