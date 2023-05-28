package com.example.nfctest;

import android.app.Activity;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.IsoDep;
import android.nfc.tech.MifareClassic;
import android.nfc.tech.MifareUltralight;
import android.nfc.tech.Ndef;
import android.nfc.tech.NdefFormatable;
import android.nfc.tech.NfcA;
import android.nfc.tech.NfcB;
import android.nfc.tech.NfcF;
import android.nfc.tech.NfcV;
import android.nfc.tech.TagTechnology;
import android.os.Build;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.io.IOException;
import java.lang.Exception;
import java.util.*;
import androidx.annotation.NonNull;

// import com.github.devnied.emvnfccard.parser.EmvTemplate;
// import com.github.devnied.emvnfccard.parser.IProvider;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
// import io.flutter.plugin.common.MethodChannel;
// import io.flutter.plugin.common.MethodCall;

public class MainActivity extends FlutterActivity {
    // private static final String CHANNEL = "emvreader";
    // private MethodChannel channel;
    // private Activity activity;
    // private Tag tag;
    // private NfcAdapter adapter;
    // private TagTechnology connectedTech;

    // @Override
    // public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        // super.configureFlutterEngine(flutterEngine);
        // System.out.println("configure flutter engine");
        // adapter = NfcAdapter.getDefaultAdapter(getApplicationContext());
        // activity = this;
        //  new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),
        //  CHANNEL)
        //  .setMethodCallHandler((MethodCall call, MethodChannel.Result result) -> {
            //  if (call.method.equals("getTag")) {
                //  onDiscovered(result);
            //  }
        //  });
    // }

    // public void onDiscovered(MethodChannel.Result result) {
        // String res = "";
        // if (Build.VERSION.SDK_INT < Build.VERSION_CODES.KITKAT) {
            // result.success("Requires API level 19.");
        //    result.error("unavailable", "Requires API level 19.", null);
        // } else {
            // try {
                // adapter.enableReaderMode(activity, (t) -> {
                    // tag = t;
                    // IProvider provider = new EmvProvider();
// Define config
                    // EmvTemplate.Config config = EmvTemplate.Config()
                            // .setContactLess(true) // Enable contact less reading (default: true)
                            // .setReadAllAids(true) // Read all aids in card (default: true)
                            // .setReadTransactions(true) // Read all transactions (default: true)
                            // .setReadCplc(false) // Read and extract CPCLC data (default: false)
                            // .setRemoveDefaultParsers(false) // Remove default parsers for GeldKarte and EmvCard (default: false)
                            // .setReadAt(true) // Read and extract ATR/ATS and description
                            // ;
// Create Parser
                    // EmvTemplate parser = EmvTemplate.Builder() //
                            // .setProvider(provider) // Define provider
                            // .setConfig(config) // Define config
                            // .setTerminal(terminal) (optional) you can define a custom terminal implementation to create APDU
                            // .build();

// Read card
                    // EMVCard card = parser.readEmvCard();
                    // result.success(t.toString());
                // }, NfcAdapter.FLAG_READER_NFC_A |
                        // NfcAdapter.FLAG_READER_NFC_B |
                        // NfcAdapter.FLAG_READER_NFC_F |
                        // NfcAdapter.FLAG_READER_NFC_V |
                        // NfcAdapter.FLAG_READER_NFC_BARCODE |
                        // NfcAdapter.FLAG_READER_SKIP_NDEF_CHECK, null);
            //    result.success(tag.getTechList());
            //    result.success(tag.toString());
            //    return tag.toString();
            //    return tag.getTechList()[0];
            // } catch (Exception e) {
                // result.success(e.getMessage());
            //    return "NFC is not available for device.";
            //    result.error("unavailable", "NFC is not available for device.", null);
            // }
        // }

    // }

}