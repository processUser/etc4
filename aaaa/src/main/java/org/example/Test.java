package org.example;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;


public class Test {
    public static void main(String[] args) {

        try{
            getdata();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void getdata () throws IOException {
        final String URL = "https://www.cjcookit.com/pc/menu/menuProdList.json";
        Connection conn = Jsoup.connect(URL);
        Document document = conn.get();
        System.out.println(document.toString());

//        Elements title = document.select("div[class=\"tit_info\"]");
//        Elements title = document.getElementsByClass("span[class=\"tit\"]");
//
//        for (Element element : title){
//            System.out.println(element.html());
//        }
    }

}
