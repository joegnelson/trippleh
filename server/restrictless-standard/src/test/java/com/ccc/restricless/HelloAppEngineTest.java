package com.ccc.restricless;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.SocketTimeoutException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.impl.client.HttpClientBuilder;
import org.junit.Assert;
import org.junit.Test;

public class HelloAppEngineTest {

  public void test() throws IOException {
    MockHttpServletResponse response = new MockHttpServletResponse();
    new HelloAppEngine().doGet(null, response);
    Assert.assertEquals("text/plain", response.getContentType());
    Assert.assertEquals("UTF-8", response.getCharacterEncoding());
    Assert.assertEquals("Hello App Engine!\r\n", response.getWriterContent().toString());
  }
  @Test
  public void httpTest() throws SocketTimeoutException, ConnectTimeoutException {
	 if(false) {
		  MyHttpResponse login_response =get("https://ccc-restrictless-login-t1.appspot.com/"
		  		+ "login"
		  		+ "?username=joe"
				+ "&pass=apple"
				  );
		  System.out.println(login_response);
	 }
	 if(true) {
		  MyHttpResponse response =get("https://ccc-restrictless-login-t1.appspot.com/"
		  		+ "resetpassword"
		  		+ "?email=joegnelson@gmail.com"
				+ "&pass=joe1"
				+ "&code=3971"
		  		//+ "	"
				  );
		  System.out.println(response);
	 }
  }
	public static MyHttpResponse get(String url) throws SocketTimeoutException,ConnectTimeoutException{
		return get(url,null);
	}
	public static class MyHttpResponse{
		public MyHttpResponse(String msg,int code) {
			this.msg=msg;
			this.code=code;
		}
		public String msg;
		public int code;
		public String toString() {
			return code+"\t:\t"+msg;
		}
	}
	public static MyHttpResponse get(String url,String token) throws SocketTimeoutException,ConnectTimeoutException{
		System.out.println(url);
//		if(bUseSimpleCache){
//			String cacheJson = httpCache.get(url);
//			if(cacheJson!=null){
//				cacheHitCount++;
//				return cacheJson;
//			}
//		}
//		cacheMissCount++;
		RequestConfig.Builder requestBuilder = RequestConfig.custom();
		requestBuilder = requestBuilder.setConnectTimeout(60*1000);
		requestBuilder = requestBuilder.setConnectionRequestTimeout(60*1000);

		HttpClientBuilder builder = HttpClientBuilder.create();     
		builder.setDefaultRequestConfig(requestBuilder.build());
		HttpClient client = builder.build();
		//System.out.println(baseurl+id);
		HttpGet request = new HttpGet(url);

		// add request header
		request.addHeader(HttpHeaders.ACCEPT, "application/json");
		if(token!=null)request.addHeader(HttpHeaders.AUTHORIZATION, token);
		try {
			
			HttpResponse response = client.execute(request);
			StatusLine statusline =response.getStatusLine();
			BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}
			String ret=result.toString();
	        //System.out.println(ret);
//			httpCache.put(url, ret);
			return new MyHttpResponse(ret,statusline.getStatusCode());
			
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (java.net.SocketTimeoutException e) {
			e.printStackTrace();
			throw e;
		} catch (org.apache.http.conn.ConnectTimeoutException e) {
			e.printStackTrace();
			throw e;
			
		

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
}
