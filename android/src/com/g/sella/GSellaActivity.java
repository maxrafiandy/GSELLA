package com.g.sella;

import android.content.Context;
import android.content.Intent;
import org.qtproject.qt5.android.bindings.QtActivity;
import android.net.Uri;

public class GSellaActivity extends QtActivity
{
    public void makeCall(String ussd_code)
    {
        runOnUiThread(new Dialup(this,ussd_code));
    }
}
