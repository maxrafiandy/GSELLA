package com.g.sella;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

public class Dialup implements Runnable{

    private Activity m_activity;
    private Uri m_ussd_code;

    public Dialup(Activity activity, String ussd_code) {
        m_activity = activity;
        m_ussd_code = Uri.parse("tel:" + ussd_code.replace("#", Uri.encode("#")));
    }

    // this method is called on Android Ui Thread
    @Override
    public void run() {
        Intent intent = new Intent(Intent.ACTION_CALL);
        intent.setData(m_ussd_code);
        m_activity.startActivity(intent);
    }
}
