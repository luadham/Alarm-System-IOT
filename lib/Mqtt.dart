import 'package:alarmsystem/service/local_notification_service.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

//** This Class Implement The main Functionality For Connecting with MQTT */
class MQTTConnection {
  final String serverIp;
  final int connectionPort;
  final String topic;
  final LocalNotificationService _notificationService =
      LocalNotificationService();
  // ! Setting Flase in Production
  bool kDebugMode = true;

  MQTTConnection(this.serverIp, this.connectionPort, this.topic);

  var messages = {
    "1": 'Device Is Connected',
    "2": 'Someone enter Wrong Password',
    "3": 'Someone Enter Correct Password'
  };

  // Connect to Broker
  Future<MqttServerClient> connect() async {
    MqttServerClient client =
        _createConnection(serverIp, kDebugMode, _onConnect, _onSubscribed);

    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    client.subscribe(topic, MqttQos.atLeastOnce);

    client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);
      _notificationService.showNotification(0, 'Device Say', messages[payload]);
      if (kDebugMode) {
        print('Received message:$payload from topic: ${c[0].topic}>');
      }
    });

    return client;
  }

  //**
  //  @params { String } serverIp
  //  @params { boolean } logging for enable logging Mode
  //  @params { function } conCallBack Connection CallBack Function
  //  @params { function } subCallBack Subscribed CallBack Function
  //  @return {MqttServerClient} Configured Client
  //*/
  MqttServerClient _createConnection(
      serverIp, logging, conCallBack, subCallBack) {
    MqttServerClient client =
        MqttServerClient.withPort(serverIp, 'application', connectionPort);

    final connMessage = MqttConnectMessage()
        .withWillTopic(topic)
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    client.connectionMessage = connMessage;
    client.logging(on: logging);
    client.onConnected = conCallBack;
    client.onSubscribed = subCallBack;
    client.keepAlivePeriod = 60;
    return client;
  }

  //** Log To Console if Subscribed */
  void _onSubscribed(String topic) {
    if (kDebugMode) {
      print("===[ Subscribed to $topic ]===");
    }
  }

  //** Log To Console if Connected */
  void _onConnect() {
    if (kDebugMode) {
      print("===[ Connected Successfully ]===");
    }
  }
}
