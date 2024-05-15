import 'package:keeyosk/data/services/http_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService {
  static final _socket = SocketService._sharedInstance();
  late Socket socket;
  factory SocketService() => _socket;
  SocketService._sharedInstance();
  void init() {
    socket = io(
      // 'https://keeyosk-api.onrender.com',
      url,
      OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
    );
    socket.connect();
  }

  void emit(String event, data) {
    socket.emit(event, [data]);
  }


}
