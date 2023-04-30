# restaurant_order

## 개발할 증분 (메뉴관리 패키지)
![image](https://user-images.githubusercontent.com/58906858/235354473-43ae6cef-1fed-4c0c-9270-31266ecaf453.png)

## 플러터 앱 설계(4개의 UI)

#### 시스템 메인 UI
![image](https://user-images.githubusercontent.com/58906858/235354653-31a48061-356b-4bfb-90ac-b854fb2883f5.png)
```
화면 전환해야 할 버튼 UI 3개 (로그인, 등록, 수정)
sqlite 데이터베이스에서 바로 삭제시킬 삭제버튼 UI & 로그아웃 버튼

시스템 메인 UI에는 삭제 버튼 5개, Future builder 형식의 List build.
```

#### How to V&V (Verification & Validation)
```
어디서 소프트웨어의 확인 및 검증을 구현할 것인가?
-> 로그인 페이지와 메뉴 수정 페이지에서 데이터 형식을 확인 및 검증할 예정 
예) 로그인 ID는 문자열 ~자리 비밀번호는 ~자리, 메뉴에서 메뉴 이름은 ~자리, 메뉴 가격은 ~자리, 메뉴 설명은 ~자리
```
