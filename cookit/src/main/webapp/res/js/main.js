{
    // 슬라이더 이미지 삽입
    let ul = document.querySelector('.slideWrap').childNodes.item(1)
    let li = ul.children
    for(let i = 0; i < li.length; i++){
        // console.log(li[i].childNodes[1])
        li[i].style.backgroundImage = 'url(/res/img/main/slide/s'+(i+1)+'.jpg)'
    }
    // 추천 메뉴 넓이
    let section3 = document.querySelectorAll('.section3 article ul')
    //let section3liW = section3[1].children.item(1)
    for(let i = 0; i < section3.length; i++){
        console.log(((section3[i].children.item(0)).offsetWidth))
        section3[i].style.width = (section3[i].children.length * (section3[i].children.item(0)).offsetWidth)+'px'
    }

    //left main 슬라이드
    let ulElem;
    const lslide = () =>{
        ulElem = document.querySelector('.slide');
        ulElem.removeEventListener('animationend', ra);
        //console.log(ulElem)
        ulElem.addEventListener('animationend', la);
        ulElem.classList.add('leftslidein');
    }

    let la = function () {
        let firstliElem = ulElem.firstElementChild;
        console.log(firstliElem)
        ulElem.appendChild(firstliElem);
        ulElem.classList.remove('rightslidein');
        ulElem.classList.remove('leftslidein');
        ulElem.offsetWidth;
    }

    let leftslides = setInterval(lslide, 6500);

    let leftbtn = document.querySelector('.left > a');

    leftbtn.addEventListener('click', (e)=>{
        clearInterval(leftslides);
        lslide();
        leftslides = setInterval(lslide, 6500);
        e.preventDefault();
    });

    //right main 슬라이드
    const rslide = () =>{
        ulElem = document.querySelector('.slide');
        let lastElem = ulElem.lastElementChild;
        ulElem.prepend(lastElem);
        console.log(lastElem)
        ulElem.removeEventListener('animationend', la);
        ulElem.addEventListener('animationend', ra);
        ulElem.classList.add('rightslidein');
    }
    let ra = function () {
        ulElem.classList.remove('rightslidein');
        ulElem.offsetWidth;
        ulElem.addEventListener('animationend', la);
    }

    let rightbtn = document.querySelector('.right > a');
    rightbtn.addEventListener('click', (e)=>{
        clearInterval(leftslides);
        rslide();
        leftslides = setInterval(lslide, 6500);
        e.preventDefault();
    });

    // slide 추천메뉴
    let bestleftElem = document.querySelector('.bestleft');

    let menuSlideListElem;
    let menuSlideListElemfirst;
    bestleftElem.addEventListener('click', (e)=>{
        menuSlideListElem = document.querySelector('.menuSlideList');
        menuSlideListElemfirst = menuSlideListElem.firstElementChild;
        e.preventDefault();

        menuSlideListElem.style.transition = 3 + "s";
        menuSlideListElem.style.transform = "translate(-" + (menuSlideListElemfirst.offsetWidth) + "px, 0px)";
        menuSlideListElem.removeEventListener('transitionend',r);
        menuSlideListElem.addEventListener('transitionend', l)
        // ++startNum;
    });
    function l() {


        menuSlideListElem.style.transition = 0 + "ms";
        menuSlideListElem.style.transform = "translate(0px, 0px)"
        menuSlideListElem.appendChild(menuSlideListElemfirst);
    }

    //
    let bestrightElem = document.querySelector('.bestright');
    bestrightElem.addEventListener('click', (e)=>{
        menuSlideListElem = document.querySelector('.menuSlideList');
        let menuSlideListElemlast = menuSlideListElem.lastElementChild;
        e.preventDefault();
        menuSlideListElem.prepend(menuSlideListElemlast);
        console.log(menuSlideListElemlast)
        menuSlideListElem.style.transition = 1+ "ms";
        menuSlideListElem.style.transform = "translate(-" + (menuSlideListElemlast.offsetWidth) + "px, 0px)";
        menuSlideListElem.removeEventListener('transitionend', l)
        menuSlideListElem.addEventListener('transitionend', r)
    });
    const r = function () {
        menuSlideListElem.style.transition = 4 + "s";
        menuSlideListElem.style.transform = "translate(0px, 0px)";
    }

    //ad slide 이벤트

    const adslideElem = document.querySelector('.adslide');
    const adLeft = () =>{
        adslideElem.style.transition = 4 + "s";
        adslideElem.style.transform = "translate(-" + (adslideElem.firstElementChild.offsetWidth) + "px, 0px)";
        adslideElem.removeEventListener('transitionend', adright);
        adslideElem.addEventListener('transitionend', adleft)

    };
    const adleft = function () {
        const adslidelifirstElem = adslideElem.firstElementChild;
        // console.log(adslidelifirstElem.dataset.adchoose)
        adslideElem.style.transition = 0 + "ms";
        adslideElem.style.transform = "translate(0px, 0px)"
        adslideElem.appendChild(adslidelifirstElem);
        adchoose(Number(adslidelifirstElem.dataset.adchoose) + 1);
    }
    const adchoose = (num) => {
        const adchooseChildrenElem = document.querySelector('.adchooseWarp').children;
        console.log(num);
        console.log(adchooseChildrenElem)
        if (num ===3){
            num =0;
        }
        for(let i = 0; i<adchooseChildrenElem.length; i ++){
            adchooseChildrenElem.item(i).classList.remove('adchoose');
            adchooseChildrenElem.item(num).classList.add('adchoose');
        }
    }

    let adsetInterval = setInterval(adLeft,7000)

    const adRight = () =>{
        let adslidelilastElem = adslideElem.lastElementChild;
        adslideElem.prepend(adslidelilastElem);
        adslideElem.style.transition = 1+ "ms";
        adslideElem.style.transform = "translate(-" + (adslidelilastElem.offsetWidth) + "px, 0px)";
        adslideElem.removeEventListener('transitionend', adleft);
        adslideElem.addEventListener('transitionend', adright);
        adchoose(Number(adslidelilastElem.dataset.adchoose));
    }
    const adright = function () {
        adslideElem.style.transition = 4 + "s";
        adslideElem.style.transform = "translate(0px, 0px)";
    }

    const adleftbtnElem = document.querySelector('.adleft > a');
    adleftbtnElem.addEventListener('click',(e)=>{
        clearInterval(adsetInterval);
        adLeft();
        adsetInterval = setInterval(adLeft,7000)
        e.preventDefault();
    })

    const adrightbtnElem = document.querySelector('.adright > a');
    adrightbtnElem.addEventListener('click',(e)=>{
        clearInterval(adsetInterval);
        adRight();
        adsetInterval = setInterval(adLeft,7000)
        e.preventDefault();
    })

    // 공지사항 슬라이드
    const noticeSlideElem = document.querySelector('.noticeSlide');
    const noticeTop = () =>{
        let noticeslideliElem = noticeSlideElem.firstElementChild;
        noticeSlideElem.style.transition = 4 + "s";
        noticeSlideElem.style.transform = "translate(0px, -"+ noticeslideliElem.offsetHeight +"px)";
        noticeSlideElem.addEventListener('transitionend',  function () {
            noticeSlideElem.style.transition = 0 + "ms";
            noticeSlideElem.style.transform = "translate(0px, 0px)"
            noticeSlideElem.appendChild(noticeslideliElem);
        });
    };
    setInterval(noticeTop, 8000)

    // 배송지검색
    const addrSearch = document.querySelector('.section2').firstElementChild;
    addrSearch.style.cursor= 'pointer';
    addrSearch.addEventListener('click', ()=>{
        console.log(addrSearch);
        new daum.Postcode({
            oncomplete: function(data) {
                //data는 사용자가 선택한 주소 정보를 담고 있는 객체이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                if(data.sido !== '서울' || data.sidoEnglish !== 'Seoul' ){
                    alert('배송불가 지역입니다.')
                    // window.open('http://dmaps.daum.net/map_js_init/postcode.v2.js');

                }else{
                    alert('배송가능 거주지 입니다');
                }
            }
        }).open();
    });

    // 시간 계산.
    const dateElem = document.querySelector('.date');
    const dateTimeElem = document.querySelector('.date_time');

    let a = new Date();
    let t1 = new Date(a.getFullYear(), a.getMonth(), a.getDate()+2, 0, 0, 59);

    dateElem.innerHTML = `${("00"+(t1.getMonth()+1).toString()).slice(-2)}월 ${t1.getDate()}일`

    // let h = ((t1.getDate()-a.getDate())*24)-1;
    let h = 23 + (24 - t1.getHours());
    let m = t1.getMinutes();
    m = 59 - a.getMinutes();
    let aa = () => {
        let t2 = new Date();
        let s = t1.getSeconds()-t2.getSeconds();
        let ss = ("00"+s.toString()).slice(-2);
        if(ss === '00'){
            m -= 1;
        }
        if(m === 0){
            h--;
            m = 59;
        }
        // console.log(typeof m);
        // document.write(`${h} : ${("00"+m.toString()).slice(-2)} : ${ss}`+'<br>')
        dateTimeElem.innerHTML='';
        dateTimeElem.innerHTML=`${("00"+(h-t2.getHours())).slice(-2)} : ${("00"+m.toString()).slice(-2)} : ${ss}`;
    }
    setInterval(aa,1000)
}
