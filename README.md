# restaurant_order
```
과목명 :소프트웨어공학_캡스톤디자인 
기간 2주
개발자 : Won Chi Hyeon.
사용한 데이터베이스 : sqflite
개발 플랫폼 : flutter
개발 언어 : dart
```

## 개발할 증분 (메뉴관리 패키지)
![image](https://user-images.githubusercontent.com/58906858/236522967-eb19aafb-8ff2-43a0-9df2-935a3e108955.png)


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
![image](https://user-images.githubusercontent.com/58906858/236523130-46eec7d1-adcc-4b42-b7b1-552c224cc66f.png)
```
textController로 id, pw에 연결해서 V&V를 구현해보았다.
차후에 UI 수정이 들어갈 예정.. 오른쪽으로 
```

## 신규 메뉴 등록 화면
![image](https://user-images.githubusercontent.com/58906858/236523270-a30c243f-8c07-46ad-bddc-1817ee224a44.png)
```
등록할 메뉴의 이름을 TextField에 입력하고 최하단의 Floating Button을 클릭하면 시스템 메인화면으로 이동하는 기능과
Sqflite데이터베이스에 메뉴의 이름(name)을 등록한다(SQL 쿼리문으로).
```

## 시스템 메인 화면
![image](https://user-images.githubusercontent.com/58906858/236523658-6e6756e0-bfc1-42cc-b20e-13c7b0705137.png)
```
신규 메뉴 등록 화면에서 피자를 입력하고 버튼을 클릭한 후의 시스템 메인 화면이다.
등록한 메뉴가 하단 리스트에 추가되어 보여지게 된다.

역시 향후에 UI를 변경할 예정..
```

## 시스템 메인 화면 (수정하기 기능)
![image](https://user-images.githubusercontent.com/58906858/236523457-ac76c7f3-5297-41e4-82cb-e944dee60995.png)
```
수정하기 기능은 수정하는 화면을 따로 배치하려 했으나 .. 기술적인 측면에서 한계를 느낀 나머지
메인화면에 구현하였다. 수정하고자하는 메뉴를 탭 한후 TextField의 메뉴이름을 다른 메뉴로 수정한 후 수정하기 버튼을
누르면 해당하는 메뉴이름으로 수정이 된다.

양념치킨을 슈프림치킨으로 변경하였다.
```
