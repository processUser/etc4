package org.example;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

public class Utils {
    public static void main(String[] args) {
        try {
            getJson();

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static String getJson() throws IOException, ParseException { // json 에서 필요한 부분을 html태그를 뿌림
        URL url = new URL("https://www.cjcookit.com/pc/menu/menuProdList.json");

        InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
        JSONParser jsonParser = new JSONParser();
        JSONObject object = (JSONObject) jsonParser.parse(isr);

//        JSONObject head = (String) object.get("html");

        System.out.println((String) object.get("html"));
        return (String) object.get("html");
    }
//        String reqStr = null;
//        StringBuilder stringBuilder = new StringBuilder();
//        BufferedReader bufferedReader = null;
//
//        try {
//            InputStream inputStream = request.getInputStream();
//            if (inputStream != null) {
//                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
//                char[] charBuffer = new char[128];
//                int bytesRead = -1;
//                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
//                    stringBuilder.append(charBuffer, 0, bytesRead);
//                }
//            } else {
//                stringBuilder.append("");
//            }
//        } catch (IOException ex) {
//            throw ex;
//        } finally {
//            if (bufferedReader != null) {
//                try {
//                    bufferedReader.close();
//                } catch (IOException ex) {
//                    throw ex;
//                }
//            }
//        }
//
//        reqStr = stringBuilder.toString();
//        return reqStr;}
}
