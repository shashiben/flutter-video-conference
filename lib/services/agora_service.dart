import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AgoraService {
  joinChannel(String token, String channelId, String info, int uid) async {
    await AgoraRtcEngine.joinChannel(token, channelId, info, uid);
  }
  
}
