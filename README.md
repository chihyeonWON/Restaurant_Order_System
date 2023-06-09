# restaurant_order
```
과목명 :소프트웨어공학_캡스톤디자인 
기간 2주
개발자 : Won Chi Hyeon.
사용한 데이터베이스 : sqflite
개발 플랫폼 : flutter
개발 언어 : dart
```

## 앱 아이콘 설정
![image](https://user-images.githubusercontent.com/58906858/236525440-d42bd131-65ed-40e9-bef9-b163d8b721c5.png)


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

## 관리자 로그아웃 기능
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/5210bc73-b089-4993-adc7-f5110c6aedae)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/c2d82e93-d1de-4327-b190-4e35241f7c93)

```
시스템 관리자 페이지에서 로그아웃 버튼을 누르면 사용자 메뉴 화면으로 돌아가능 기능을 추가
```

## 결제 화면 (menuPayment.dart)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/a11e764b-3ed5-4700-993c-84c7d33328e5)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/01f5d649-77a5-46d2-9323-5bcb1a6a089e)
```
사용자 메뉴 화면에서 선택한 메뉴의 이름을 생성자로 넘겨받은 menuPayment 클래스에서 가격, 메뉴 설명, 결제 창으로 이동하는
버튼을 추가하였습니다.
```


## 결제 방법을 PG 일반 (PG 대행사) (default_payment.dart)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/ee05afea-9350-4b83-a45a-30a5f4401603)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/47ed7d82-a8f8-4cfe-8aaf-f59d4e435e7c)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/a795b500-cb14-48c2-912f-c66dc03a052d)
```
pg 일반으로 선택했을 때의 결제 창입니다. 약관에 모두 동의하면 카드사를 선택할 수 있는 화면으로 전환됩니다.
최종적으로 주문하는 메뉴를 확인하고 확인 버튼을 누르면 주문이 성공하였다는 페이지로 넘어가게 됩니다.
```

## default_payment.dart 
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/fe7c3ba2-a29b-44c5-8858-335d5af0ed17)
```
pg일반 결제 상품명, 가격을 수정하였습니다.
```

## 결제 진짜 되는구나..?
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/94da9ce3-bba5-4c7b-8883-47707d544012)
```
정말로 결제되나 테스트하고자 내 농협 카드로 테스트 했는데 NICE 결제 대행으로 1000원이 결제가 되었다..?
이게 뭘까..............
```

## 2차 증분 구현 및 릴리즈
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/089e54cf-0bcf-40fc-89fd-56e00de5f275)
```
메뉴 결제 방식을 선택할 수 있는 페이지 paymentMethod 클래스를 생성하였습니다.
카드로 결제할 것인지, 토스, 카카오 외부 결제를 사용할 것인지 선택할 수 있습니다.
```
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/5f5c8993-a332-4185-868e-1e61a3408403)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/1c0e52a5-aa11-4c33-a0de-8066b6c2d58a)
```
메뉴 결제에 성공한 후에 주문 내역을 보여주는 페이지를 추가하였습니다.
onCancel (결제 취소하기), onError (결제 중 오류) 일 때는 paymentMethod 클래스로 돌아가도록 하고
onClose, onConfirm (결제가 성공되어 다음 화면으로 갈 때는 payList 클래스로 돌아가도록 설정하였습니다.
```

## 구글 플레이 출시 릴리즈(배포)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/62da10d7-5bde-484b-881c-93b296bdbbd2)

## 5조레스토랑 패키지 이름 변경
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/b263f39e-0074-464c-a9f8-037b477ca3cd)

## 릴리즈(데모 배포)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/35458d29-b898-4c43-9c44-c8fff7680a24)
```
릴리즈 배포를 위한 release용 앱 번들을 생성
```
## 구글 플레이에 프로덕션 (올리기 완료)
![image](https://github.com/chihyeonWON/Restaurant_Order_System/assets/58906858/cd834142-bd98-419e-a152-b3436113c223)
```
임시로 프로덕션이 올라가서 일주일 안에 게시 or 게시불가 앱 통지올 예정
```
