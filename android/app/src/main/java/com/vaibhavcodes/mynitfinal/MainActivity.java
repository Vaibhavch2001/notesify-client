package com.vaibhavcodes.mynitfinal;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;

import java.io.File;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
//    private Context mContext;
    private static final String CHANNEL = "notesify.vaibhav.dev/open";

//    public static void registerWith(io.flutter.plugin.common.PluginRegistry.Registrar registrar) {
//        instance.onAttachedToEngine(registrar.context(), registrar.messenger());
//    }
//    @Override
//    public void onAttachedToEngine(FlutterPluginBinding binding) {
//        onAttachedToEngine(binding.getApplicationContext(), binding.getBinaryMessenger());
//    }
//
//    private void onAttachedToEngine(Context applicationContext, BinaryMessenger messenger) {
//        mContext = applicationContext;
////        methodChannel = new MethodChannel(messenger, "plugins.flutter.io/battery");
////        eventChannel = new EventChannel(messenger, "plugins.flutter.io/charging");
////        eventChannel.setStreamHandler(this);
////        methodChannel.setMethodCallHandler(this);
//    }
//    @Override
//    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//        super.configureFlutterEngine(flutterEngine);
//        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//                .setMethodCallHandler(
//                        (call, result) -> {
//                            // Note: this method is invoked on the main thread.
//                            // TODO
//                            if(call.method.equals("openFile")){
//                                    try {
//                                        String url = call.argument("path");
////                                        Uri uri = FileProvider.getUriForFile(MainActivity.this,
////                                                BuildConfig.APPLICATION_ID + ".provider",
////                                                new File(url));
//                                        Uri.fromFile(new File(url));
//                                        Intent intent = new Intent(Intent.ACTION_VIEW);
//                                        if (url.toString().contains(".doc") || url.toString().contains(".docx")) {
//                                            // Word document
//                                            intent.setDataAndType(uri, "application/msword");
//                                        } else if (url.toString().contains(".pdf")) {
//                                            // PDF file
//                                            intent.setDataAndType(uri, "application/pdf");
//                                        } else if (url.toString().contains(".ppt") || url.toString().contains(".pptx")) {
//                                            // Powerpoint file
//                                            intent.setDataAndType(uri, "application/vnd.ms-powerpoint");
//                                        } else if (url.toString().contains(".xls") || url.toString().contains(".xlsx")) {
//                                            // Excel file
//                                            intent.setDataAndType(uri, "application/vnd.ms-excel");
//                                        } else if (url.toString().contains(".zip")) {
//                                            // ZIP file
//                                            intent.setDataAndType(uri, "application/zip");
//                                        } else if (url.toString().contains(".rar")){
//                                            // RAR file
//                                            intent.setDataAndType(uri, "application/x-rar-compressed");
//                                        } else if (url.toString().contains(".rtf")) {
//                                            // RTF file
//                                            intent.setDataAndType(uri, "application/rtf");
//                                        } else if (url.toString().contains(".wav") || url.toString().contains(".mp3")) {
//                                            // WAV audio file
//                                            intent.setDataAndType(uri, "audio/x-wav");
//                                        } else if (url.toString().contains(".gif")) {
//                                            // GIF file
//                                            intent.setDataAndType(uri, "image/gif");
//                                        } else if (url.toString().contains(".jpg") || url.toString().contains(".jpeg") || url.toString().contains(".png")) {
//                                            // JPG file
//                                            intent.setDataAndType(uri, "image/jpeg");
//                                        } else if (url.toString().contains(".txt")) {
//                                            // Text file
//                                            intent.setDataAndType(uri, "text/plain");
//                                        } else if (url.toString().contains(".3gp") || url.toString().contains(".mpg") ||
//                                                url.toString().contains(".mpeg") || url.toString().contains(".mpe") || url.toString().contains(".mp4") || url.toString().contains(".avi")) {
//                                            // Video files
//                                            intent.setDataAndType(uri, "video/*");
//                                        } else {
//                                            intent.setDataAndType(uri, "*/*");
//                                        }
//                                        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
//                                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//                                        this.startActivity(intent);
//                                    } catch (ActivityNotFoundException e) {
////                                        Toast.makeText(context, "No application found which can open the file", Toast.LENGTH_SHORT).show();
//                                    }
//                            }
//                        }
//                );
//    }
}
