<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
이벤트 모델은 DOM의 구조를 두 번 순회합니다. 

이벤트가 호출되면 최상위 루트에서 자식 엘리멘트들을 타고 이벤트 타깃까지 내려가는 캡쳐 단계가 일어나고 다시 반대로 이벤트의 타킷으로부터 최상위 루트까지 올라가는 버블 단계가 일어납니다.

이러한 이벤트 전파 과정을 통해서 예상치 못한 결과가 발생하는 경우가 있는데 예를 들어 부모 요소와 자식 요소 두 곳에 click 이벤트를 생성한 후 자식 요소를 클릭하여 이벤트를 호출할 때 클릭하지 않은 부모 요소에서 클릭이 발생하게 됩니다.

이런 의도치 않은 반응이 일어나 문제가 발생되는 것은 이벤트 모델의 전파과정 중 버블링 단계에서 이벤트를 발생하기 때문입니다.

하지만 event 객체에 stopPropagation() 메소드를 호출하면 이 단계가 진행되지 않도록 사전에 차단할 수 있습니다.









이벤트를 중단할 때 사용되는 방법에 대한 정리는 아래와 같습니다.

event.preventDefault();
// 현재 이벤트의 기본 동작을 중단합니다.


event.stopPropagation();
// 현재 이벤트가 상위로 전파되지 않도록 중단합니다.


event.stopImmediatePropagation();
// 현재 이벤트가 상위뿐 아니라 현재 레벨에 걸린 다른 이벤트도 동작하지 않도록 합니다.


return false;
// jQuery를 사용한 코드내에서는  위의 preventDefault, stopPropagation 두개 모두를 수행한 것과 같고,

// jQuery를 사용하지 않고 return false 를 작성할 경우에는
// event.preventDefault() 와 같습니다.






출처: https://webclub.tistory.com/186 [Web Club]
</pre>
</body>
</html>