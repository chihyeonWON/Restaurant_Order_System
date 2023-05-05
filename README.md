# restaurant_order
```
과목명 :소프트웨어공학_캡스톤디자인 
기간 2주
개발자 : Won Chi Hyeon.
```

## 개발할 증분 (메뉴관리 패키지)
![image](https://user-images.githubusercontent.com/58906858/236520848-6712ef38-d6c0-4171-a9c7-77fb14fd5aae.png)


## 플러터 앱 설계(4개의 UI)

#### 시스템 메인 UI
```
화면 전환해야 할 버튼 UI 3개 (로그인, 등록, 수정)
sqlite 데이터베이스에서 바로 삭제시킬 삭제버튼 UI & 로그아웃 버튼

시스템 메인 UI에는 삭제 버튼 5개, Future builder 형식의 List build.
```

#### How to V&V (Verification & Validation)
```
어디서 소프트웨어의 확인 및 검증을 구현할 것인가?
-> 로그인 페이지와 메뉴  페이지에서 데이터 형식을 확인 및 검증할 예정 
예) 로그인 ID는 문자열 ~자리 비밀번호는 ~자리, 메뉴에서 메뉴 이름은 ~자리, 메뉴 가격은 ~자리, 메뉴 설명은 ~자리
```

## 시스템 관리자 로그인 화면
![image](https://user-images.githubusercontent.com/58906858/236513319-52c6fabe-a5aa-4c0a-b068-f61b5f3eba9f.png)
![image](https://user-images.githubusercontent.com/58906858/236514490-c02472b9-33e3-4048-b41f-adc8946cd93e.png)

```
textController로 id, pw에 연결해서 V&V를 구현해보았다.
차후에 UI 수정이 들어갈 예정.. 오른쪽으로 
```

## 신규 메뉴 등록 화면
![image](https://user-images.githubusercontent.com/58906858/236514913-12ce6dd5-11d8-4b45-91ef-262dd95db98b.png)
```
등록할 메뉴의 이름을 TextField에 입력하고 최하단의 Floating Button을 클릭하면 시스템 메인화면으로 이동하는 기능과
Sqflite데이터베이스에 메뉴의 이름(name)을 등록한다(SQL 쿼리문으로).
```

## 시스템 메인 화면
![image](https://user-images.githubusercontent.com/58906858/236515336-3277fb3c-5bf6-4d26-9a9f-d181b2b29830.png)
```
신규 메뉴 등록 화면에서 피자를 입력하고 버튼을 클릭한 후의 시스템 메인 화면이다.
등록한 메뉴가 하단 리스트에 추가되어 보여지게 된다.

역시 향후에 UI를 변경할 예정..
```

## 시스템 메인 화면 (수정하기 기능)
![image](https://user-images.githubusercontent.com/58906858/236515848-26b3848f-a875-4a38-8c31-894c75278e8c.png)
```
수정하기 기능은 수정하는 화면을 따로 배치하려 했으나 .. 기술적인 측면에서 한계를 느낀 나머지
메인화면에 구현하였다. 수정하고자하는 메뉴를 탭 한후 TextField의 메뉴이름을 다른 메뉴로 수정한 후 수정하기 버튼을
누르면 해당하는 메뉴이름으로 수정이 된다.

피자를 치킨으로 수정하였다.
```
