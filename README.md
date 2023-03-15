<a name="readme-top"></a>




<!-- PROJECT LOGO -->
<br />
<div align="left">
  <h1 >한글행맨  </h1>
   <img width="800" alt="한글행맨" src="https://user-images.githubusercontent.com/104295833/225217404-fb468da6-4a8a-4767-a5d9-6673720ec55c.png">
   <p align ="right"><a href="https://apps.apple.com/kr/app/한글행맨/id1666526562" ><strong >App Store » </strong></a></p>
   
</div>

다양한 K-문화로 인한 한글의 관심도가 높아지고 있으며, 게임을 통해 다양한 사용자가 쉽게 단어를 습득 할 수 있는 한글 퍼즐 게임 서비스 **한글행맨** 입니다. 5칸의 자음 + 모음을 통해 낱말을 추리하여 맞추며 점수를 쌓아 실시간으로 랭킹이 업데이트 되어 경쟁 할 수 있습니다. 

<br />

- - -
<br />

## 목차
#### <a href="#팀 & 프로젝트">&nbsp;&nbsp;&nbsp;&nbsp;1. 팀 & 프로젝트</a>
#### <a href="#아키텍쳐 및 사용기술">&nbsp;&nbsp;&nbsp;&nbsp;2. 아키텍쳐 및 사용기술</a>
#### <a href="#담당 업무">&nbsp;&nbsp;&nbsp;&nbsp;3. 담당 업무</a>
#### <a href="#스크린 샷">&nbsp;&nbsp;&nbsp;&nbsp;4. 스크린샷</a>
<br />

- - -
<br />

## 팀 & 프로젝트

앱 서비스 배포 및 협업 경험을 위한 온라인 사이드 프로젝트 팀에서 iOS 파트 참여

</br>

서버 백엔드 ( 2 ) , 안드로이드 파트 ( 2 )  , **iOS 파트 ( 2 )** , 기획자 ( 1 )  
 
</br>

• 앱스토어 퀴즈 부분 최고 순위 **64등** 및 **통합 사용자 100명** 달성

• 버그 수정 및 기능 추가 **지속적인 업데이트**

</br>


- - -
</br>

## 아키텍쳐 및 사용기술

**MVVM , Singleton , CodeBase UI , Observable Object**

**Alamofire , CoreData**
 
</br>

- - -
</br>

## 담당 업무

• MVVM 패턴을 학습하여 MVC 패턴을 거쳐 MVVM 패턴을 적용하였습니다. 기존 Controller 에 집중 된 로직을 UI로직은 View에 비즈니스 로직은 ViewModel 나눔으로써 ViewController 코드의 양을 50퍼 정도 줄임으로써 가독성 및 확장성, 단위 테스트하는데 용이했습니다. MVVM 패턴 적용을 위한 Observable 구현해봄으로써 RxSwfit의 원리를 알 수 있었습니다.

<a href="https://github.com/KimCookk/KrHangman-iOS-Project/blob/main/KrHangMan-iOS/View/ObservableObject.swift"><strong >ObservableObject </strong></a>

• Alamofire를 활용해 재사용 가능하게 APIService 을 구현하여, 네트워크 통신을 진행하였습니다. 싱글톤 패턴을 통해 구현하여, 서비스 인스턴스를 공유하여 접근하도록 하였습니다. 해당 서비스는 타 프로젝트에서도 활용 할 수 있었습니다.

<a href="https://github.com/KimCookk/KrHangman-iOS-Project/blob/main/KrHangMan-iOS/AppService/APIServcie.swift"><strong >APIService</strong></a>

• CodeBase UI를 통해 Custom Keyboard 및 Main View, Game View, Help Popup을 구현하였습니다. 효율적인 UI 수정이 가능했습니다.

<a href="https://github.com/KimCookk/KrHangman-iOS-Project/tree/main/KrHangMan-iOS/View/Component"><strong >View Component</strong></a>

• 게임 로직을 수행하는 HangManGame을 객체화하여 구현하였습니다. 차후 난이도 및 단어 수 확장 시 전달인자를 통해 변경이 가능합니다.

<a href="https://github.com/KimCookk/KrHangman-iOS-Project/blob/main/KrHangMan-iOS/Model/HangManGame.swift"><strong >HangManGame</strong></a>

• 기획자, 백엔드, 안드로이드 타 파트 인원들과 의사소통하며 프로젝트를 진행함으로써 협업 경험을 할 수 있었습니다. git, notion, slack 협업 툴 역량을 쌓을 수 있었습니다.


</br>

- - -
</br>

## 스크린 샷
</br>
   <img width="300" alt="capture1" src="https://user-images.githubusercontent.com/104295833/225244450-ffff54c8-9473-4236-8475-e9d136bafdd2.png">
   &nbsp;&nbsp;&nbsp;&nbsp;
   <img width="300" alt="capture2" src="https://user-images.githubusercontent.com/104295833/225245003-0e368b34-71f2-46b9-96df-2135d61325b9.png">
   &nbsp;&nbsp;&nbsp;&nbsp;
   <img width="300" alt="capture3" src="https://user-images.githubusercontent.com/104295833/225245003-0e368b34-71f2-46b9-96df-2135d61325b9.png">

</br>

   <img width="300" alt="capture4" src="https://user-images.githubusercontent.com/104295833/225245705-c1004421-cf7d-4d4e-911e-484543cc14a0.png">
 &nbsp;&nbsp;&nbsp;&nbsp;
   <img width="300" alt="capture5" src="https://user-images.githubusercontent.com/104295833/225245739-0039fbeb-fc59-4442-a568-c46b12a7805b.png">
&nbsp;&nbsp;&nbsp;&nbsp;
   <img width="300" alt="capture6" src="https://user-images.githubusercontent.com/104295833/225245765-4185d8be-3439-4c94-93db-0e0f23c2f704.png">

</br>
 <img width="300" alt="capture7" src="https://user-images.githubusercontent.com/104295833/225246208-ac554122-0b64-4270-abd7-29a3496897b0.png">
 &nbsp;&nbsp;&nbsp;&nbsp;
   <img width="300" alt="capture8" src="https://user-images.githubusercontent.com/104295833/225246267-7e30e543-6b82-442f-8408-8a952290c999.png">
 &nbsp;&nbsp;&nbsp;&nbsp;
   <img width="300" alt="capture9" src="https://user-images.githubusercontent.com/104295833/225246343-86f3ffd3-6f1b-4f49-bbdb-f8dd0b20c932.png">


</br>



<p align="right">(<a href="#readme-top">back to top</a>)</p>

- - -

