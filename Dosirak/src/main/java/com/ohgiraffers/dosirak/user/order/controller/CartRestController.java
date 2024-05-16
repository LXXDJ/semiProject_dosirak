package com.ohgiraffers.dosirak.user.order.controller;

import com.ohgiraffers.dosirak.user.order.model.dto.CartDTO;
import com.ohgiraffers.dosirak.user.order.model.service.CartService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@RestController
@RequestMapping("/user/*")
public class CartRestController {

    private final CartService cartService;

    public CartRestController(CartService cartService) {
        this.cartService = cartService;
    }
    Map<String, Object> response = new HashMap<>();

    @PostMapping("cart/update-quantity")
    public ResponseEntity<Map<String, Object>> cartUpdateQuantity(@RequestBody CartDTO cartDTO) {
        try {
            cartService.cartUpdateQuantity(cartDTO);
            response.put("success", true);
            response.put("message", "수량이 업데이트 되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "수량 업데이트 중 오류 발생");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }
    @PostMapping("cart/update-quantity/suit-box")
    public ResponseEntity<Map<String, Object>> cartUpdateQuantitySuitbox(@RequestBody Map<String, String> suitBox) {
        try {
            cartService.cartUpdateQuantitySuitbox(suitBox);
            response.put("success", true);
            response.put("message", "수량이 업데이트 되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "수량 업데이트 중 오류 발생");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }

    @PostMapping("cart/delete-product")
    public ResponseEntity<Map<String, Object>> cartDeleteProductList(@RequestBody CartDTO productCode) {
        try {
            cartService.cartDeleteProductList(productCode);
            response.put("success", true);
            response.put("message", "일반 상품 선택 삭제");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "일반 상품 삭제 중 오류 발생");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }
    @PostMapping("cart/delete-suitbox")
    public ResponseEntity<Map<String, Object>> cartDeleteSuitboxList(@RequestBody CartDTO suitboxCode) {
        try {
            cartService.cartDeleteSuitboxList(suitboxCode);
            response.put("success", true);
            response.put("message", "맞춤 상품 선택 삭제");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "맞춤 상품 삭제 중 오류 발생");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
    }

//    /* 카카오페이 서버 통신 */
//    @PostMapping("payment/kakao-pay")
//    public String paymentKakaoPay() {
//        try {
//            URL kakaoPayUrl = new URL("https://open-api.kakaopay.com/online/v1/payment/ready");
//            HttpURLConnection kakaoConnection = (HttpURLConnection) kakaoPayUrl.openConnection();
//            kakaoConnection.setRequestMethod("POST");
//            kakaoConnection.setRequestProperty("Authorization", "KakaoAK {YOUR_SECRET_KEY}");
//            kakaoConnection.setRequestProperty("Content-Type", "application/json");
//            kakaoConnection.setDoOutput(true);
//
//            String kakaoParameter = "cid = TC0ONETIME" +
//                    "&partner_order_id=partner_order_id" +
//                    "&partner_user_id=partner_user_id" +
//                    "&item_name=초코파이" +
//                    "&total_amount=2200" +
//                    "&vat_amount=200" +
//                    "&tax_free_amount=0" +
//                    "&approval_url=https://developers.kakao.com/success" +
//                    "&fail_url=https://developers.kakao.com/fail" +
//                    "&cancel_url=https://developers.kakao.com/cancel";
//
//
//            OutputStream kakaoOutput = kakaoConnection.getOutputStream();
//            DataOutputStream kakaoData = new DataOutputStream(kakaoOutput);
//
//            kakaoData.writeBytes(kakaoParameter);
//            kakaoData.flush();
//            kakaoData.close();
//
//            int responseCode = kakaoConnection.getResponseCode();
//
//            InputStream inputStream;
//            if (responseCode == 200) {
//                inputStream = kakaoConnection.getInputStream();
//            } else {
//                inputStream = kakaoConnection.getErrorStream();
//            }
//
//            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
//            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
//
//            return bufferedReader.readLine();
//        } catch (MalformedURLException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return "redirect:/user/main";
//    }
}
