package org.example;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;

public class HttpDownloader { // URL 로 이미지 가저와서 폴더가 없으면 생성후 저장.
    public static void main(String[] args) {
        String url="//img.cjcookit.com/images/file/product/474/20200325091427622.jpg?RS=268x320";
//        String dir="E:\\test\\cookit\\src\\main\\webapp\\res\\img\\product\\";
        String dir="C:\\Users\\HOME\\Desktop\\etc4\\cookit\\src\\main\\webapp\\res\\img\\product\\";
        try {
            HttpDownloader.downloadToDir(url, dir, url);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /** 정해진 디렉토리로 url의 내용을 저장한다. (저장되는 파일명이 url에 따라서 달라짐) **/
    public static void downloadToDir(String url2, String dir , String dir2) throws IOException {
        String url="http:";
        url += url2;
        URL urls =new URL(url);
        dir += dir2.substring(39, 42);

        File folder = new File(dir);

        if (url==null) throw new IllegalArgumentException("url is null.");
        if (dir==null) throw new IllegalArgumentException("directory is null.");
//        if (!dir.exists()) throw new IllegalArgumentException("directory is not existed.");
        if (!folder.exists()) {
            folder.mkdir();
        }
        if (!folder.isDirectory()) throw new IllegalArgumentException("directory is not a directory.");
        downloadTo(urls, folder, true);
    }

    private static void downloadTo(URL url, File targetFile, boolean isDirectory) throws IOException{

        HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
        int responseCode = httpConn.getResponseCode();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            String fileName = "";
            String disposition = httpConn.getHeaderField("Content-Disposition");
            File saveFilePath=null;

            if (isDirectory) {
                if (disposition != null) {
                    int index = disposition.indexOf("filename=");
                    if (index > 0) {
                        fileName = disposition.substring(index + 10,
                                disposition.length() - 1);
                    }
                } else {
                    String fileURL=url.toString();
                    fileName = fileURL.substring(fileURL.lastIndexOf("/") + 1, fileURL.length());
                    int questionIdx=fileName.indexOf("?");
                    if (questionIdx>=0) {
                        fileName=fileName.substring(0, questionIdx);
                    }
                    fileName= URLDecoder.decode(fileName);
                }
                saveFilePath = new File(targetFile, fileName);
            }
            else {
                saveFilePath=targetFile;
            }

            InputStream inputStream = httpConn.getInputStream();

            FileOutputStream outputStream = new FileOutputStream(saveFilePath);

            int bytesRead = -1;
            byte[] buffer = new byte[4096];
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            outputStream.close();
            inputStream.close();
            System.out.println("File downloaded to " + saveFilePath);
        } else {
            System.err.println("No file to download. Server replied HTTP code: " + responseCode);
        }
        httpConn.disconnect();
    }
}
