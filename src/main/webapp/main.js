/**
 * 
 */

const swiper = new Swiper( '.swiper', {
    autoplay: true,
    loop: true,
    pagination: { // 호출(pager) 여부
        el: ".swiper-pagination", //버튼을 담을 태그 설정
        clickable: true, // 버튼 클릭 여부
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
} );


const spyEls = document.querySelectorAll('.spy'); //요소를 전부 찾아서
// 요소들 반복 처리!
spyEls.forEach(function (spyEl) {
    new ScrollMagic
        .Scene({ // 감시할 장면(Scene)을 추가
            triggerElement: spyEl, // 보여짐 여부를 감시할 요소를 지정
            triggerHook: .6 // 화면의 80% 지점에서 보여짐 여부 감시
        })
        .setClassToggle(spyEl, 'show') // 요소가 화면에 보이면 show 클래스 추가
        .addTo(new ScrollMagic.Controller()) // 컨트롤러에 장면을 할당(필수!)
})
