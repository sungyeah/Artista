package com.mulcam.artista.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	
	@GetMapping({"main","/"})
	public String main() {
		
//		String uuid = UUID.randomUUID().toString();
		
		return "main";
	}
	
	@GetMapping("artista")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@GetMapping("exhibitionapi")
	public String exhibitionapi() {
		System.out.println("테스트 버튼 클릭 됨");
		String result = null;
		
		try {
		//변수 serviceKey에 인증키를 넣어주고
		String serviceKey = "73466438-a9ff-4d32-a2f1-6ccb080e3c91";
		
		//각각의 정보를 넣어줍니다.
		StringBuilder urlBuilder = new StringBuilder("http://api.kcisa.kr/openapi/service/rest/meta10/get20150046"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /* page 출력 수 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
		 
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		System.out.println("Response code: " + conn.getResponseCode());
		
		BufferedReader rd;
		 
		//getResponseCode가 200이상 300이하일때는 정상적으로 작동합니다.
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
		    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}		
		StringBuffer sb = new StringBuffer();

		String line;
		while ((line = rd.readLine()) != null) {
		    sb.append(line);
		}
		rd.close();
		conn.disconnect();
		url =null;
		//StringBuilder로 위에 파라미터 더 한값을 toString으로 불러옵니다.
		//그리고 println으로 확인을 하면 xml형식이 나오게됩니다.
		
		JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	    
		
		JSONArray response = xmlJSONObj.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
		
		for (Object item : response) {
			System.out.println(((JSONObject)item).getString("title"));
		}
		
		result = response.toString();
		// String xmlJSONObjString = xmlJSONObj.toString();
	    
	    
		} catch (Exception e) {
			e.printStackTrace();
			result ="에러발생";
		}
		
		return result;
	}
	
	@GetMapping("test")
	public String test() {
		return "test";
	}
}