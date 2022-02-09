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
    public static void getdata() throws IOException { // 크롤링 해서 DB저장 함
        final String URL = "http://localhost:8090/aaaa";
        Connection conn = Jsoup.connect(URL);
        Document document = conn.get();

//        Elements title = document.select("div[class=\"tit_info\"]");
        Elements title = document.getElementsByClass("tit");
        Elements price = document.getElementsByClass("price");
        Elements review_num = document.getElementsByClass("review_num");
        Elements img_src = document.getElementsByTag("img");

        for (int i = 0; i < title.size(); i++){
            System.out.println(img_src.get(i).attr("src"));
            HttpDownloader.downloadToDir(img_src.get(i).attr("src").toString(), "C:\\Users\\HOME\\Desktop\\etc4\\cookit\\src\\main\\webapp\\res\\img\\product\\", img_src.get(i).attr("src").toString());
        }

        for (int i = 0; i < title.size(); i++){
            Goods goods = new Goods();
            String ss =String.format("%d%04d",2202,i+1);
            goods.setGnum(ss);
            goods.setGnm(title.get(i).html());
            goods.setPrice(Integer.parseInt(price.get(i).html().substring(0,5)));
            goods.setImg(img_src.get(i).attr("src").substring(39,60));

            InsGoods.insgoods(goods);

            goods.setGoodspk(i+1);
            InsGoods.insimg(goods);

//            System.out.println(title.get(i).html());
//            System.out.println(price.get(i).html().substring(0,5));
//            System.out.println(review_num.get(i).html().substring(3));
//            System.out.println(img_src.get(i).attr("src").substring(39,60));
        }
//        for (Element element : title){
//            System.out.println(element.html());
//        }
    }

}
