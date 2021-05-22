package pdf.co.ir.sportapplication;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService;

import com.yandex.metrica.YandexMetrica;
import com.yandex.metrica.YandexMetricaConfig;

public class Application extends FlutterApplication implements PluginRegistrantCallback {

  @Override
  public void onCreate() {
    super.onCreate();
    YandexMetricaConfig config = YandexMetricaConfig.newConfigBuilder("1451967f-186b-415d-9ac3-ec01e78a57a2").build();
    YandexMetrica.activate(getApplicationContext(), config);
    YandexMetrica.enableActivityAutoTracking(this);
   FlutterFirebaseMessagingService.setPluginRegistrant(this);
  }

  @Override
  public void registerWith(PluginRegistry registry) {
    FirebaseCloudMessagingPluginRegistrant.registerWith(registry);
  }
}