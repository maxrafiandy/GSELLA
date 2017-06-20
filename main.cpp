#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QSettings>
#include <QStandardPaths>
#include <QThread>
#include <QDebug>

#include "buttonlistener.h"
#include "qenum.h"

#ifdef Q_OS_ANDROID
#include <QtAndroid>
#include <QAndroidJniObject>
#include <QAndroidJniEnvironment>
#include <jni.h>


#include "firebase/admob.h"
#include "firebase/admob/types.h"
#include "firebase/app.h"
#include "firebase/future.h"
#include "firebase/admob/banner_view.h"

#endif

void initDefaultConfiguration()
{
    QFile new_file(app_config);
    QSettings settings(app_config, QSettings::NativeFormat);

    new_file.open(QIODevice::ReadWrite);
    settings.setValue("pulsa", "*777*NOHP*NOMINAL*PIN#");
    settings.setValue("kuota", "*369*2*NOHP*NOMINAL*PIN#");
    settings.setValue("stok", "*776*PIN#");
    settings.setValue("pin", "1234");
    new_file.close();
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    ButtonListener btn_listener;
    ConfigListener cfg_listener;

    QQmlContext *ctx = engine.rootContext();
    ctx->setContextProperty("btn_listener", &btn_listener);
    ctx->setContextProperty("cfg_listener", &cfg_listener);
    QEnum::registerToQml();


    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    // Create data storage
    if(!QDir(app_path).exists())
    {
        QDir().mkdir(app_path);
        initDefaultConfiguration();
    }
    else
    {
        QFileInfo check_file(app_config);
        if (!check_file.exists()) initDefaultConfiguration();
    }

#ifdef Q_OS_ANDROID
    QAndroidJniEnvironment env;
    QAndroidJniObject activity = QAndroidJniObject::callStaticObjectMethod("org/qtproject/qt5/android/QtNative", "activity", "()Landroid/app/Activity;");
    firebase::App* frbase_app = firebase::App::Create(firebase::AppOptions(),
                                                    env, activity.object<jobject>());
    const char* kAdMobAppID = "ca-app-pub-XXXXXXXXXXXXXXXX~NNNNNNNNNN";
    const char* kBannerAdUnit = "ca-app-pub-3940256099942544/6300978111";

    firebase::admob::Initialize(*frbase_app, kAdMobAppID);

    firebase::admob::BannerView* banner_view;
    banner_view = new firebase::admob::BannerView();

    firebase::admob::AdSize ad_size;
    ad_size.ad_size_type = firebase::admob::kAdSizeStandard;
    ad_size.width = 320;
    ad_size.height = 50;
    // my_ad_parent is a reference to an iOS UIView or an Android Activity.
    // This is the parent UIView or Activity of the banner view.
    banner_view->Initialize(static_cast<firebase::admob::AdParent>(activity.object<jobject>()), kBannerAdUnit, ad_size);

    // Initialize all the AdRequest struct member values to zero.
    firebase::admob::AdRequest my_ad_request = {};
    // If the app is aware of the user's gender, it can be added to the
    // targeting information. Otherwise, "unknown" should be used.
    my_ad_request.gender = firebase::admob::kGenderUnknown;

    // The user's birthday, if known. Note that months are indexed from one.
    my_ad_request.birthday_day = 10;
    my_ad_request.birthday_month = 11;
    my_ad_request.birthday_year = 1976;

    // Additional keywords to be used in targeting.
    static const char* kKeywords[] = {"AdMob", "C++", "Fun"};
    my_ad_request.keyword_count = sizeof(kKeywords) / sizeof(kKeywords[0]);
    my_ad_request.keywords = kKeywords;

    // "Extra" key value pairs can be added to the request as well.
    static const firebase::admob::KeyValuePair kRequestExtras[] = {
        {"the_name_of_an_extra", "the_value_for_that_extra"}};
    my_ad_request.extras_count = sizeof(kRequestExtras) / sizeof(kRequestExtras[0]);
    my_ad_request.extras = kRequestExtras;

    // Register the device IDs associated with any devices that will be used to
    // test your app. Below are sample test device IDs used for making the ad request.
    static const char* kTestDeviceIDs[] =
        {"2077ef9a63d2b398840261c8221a0c9b",
         "098fe087d987c9a878965454a65654d7"};
    my_ad_request.test_device_id_count =
        sizeof(kTestDeviceIDs) / sizeof(kTestDeviceIDs[0]);
    my_ad_request.test_device_ids = kTestDeviceIDs;

    qDebug() << "Sleep";
    QThread::usleep(1000);
    if (banner_view->ShowLastResult().status() ==
        firebase::kFutureStatusComplete &&
        banner_view->ShowLastResult().error() ==
        firebase::admob::kAdMobErrorNone)
    {
        qDebug() << "Ad loaded";
        banner_view->LoadAd(my_ad_request);
    }

#endif

    return app.exec();
}
