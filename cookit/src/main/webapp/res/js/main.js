window.onload = () => {
    // 슬라이더 이미지 삽입
    let ul = document.querySelector('.slideWrap').childNodes.item(1)
    let li = ul.children
    for(let i = 0; i < li.length; i++){
        // console.log(li[i].childNodes[1])
        li[i].style.backgroundImage = 'url(/res/img/main/slide/s'+(i+1)+'.jpg)'
    }
    // 추천 메뉴 넓이
    let section3 = document.querySelectorAll('.section3 article ul')
    let section3liW = section3[1].children.item(1)
    console.log(section3)
    for(let i = 0; i < section3.length; i++){
        console.log(((section3[i].children.item(0)).offsetWidth))
        section3[i].style.width = (section3[i].children.length * (section3[i].children.item(0)).offsetWidth)+'px'
    }

    //left 슬라이드
    const leftslide = () =>{
        let ulElem = document.querySelector('.slide')
        let firstliElem = ul.children[0];

        ulElem.addEventListener('animationend', () => {
            ulElem.append(firstliElem);
            ulElem.classList.remove('leftslidein');
            ulElem.offsetWidth;
            ulElem.classList.add('leftslidein');
        });
    }

    setInterval(leftslide, 6500);

    // let leftbtn = document.querySelector('.left > a');
    // console.log(leftbtn)
    // let val = true;
    //
    // leftbtn.addEventListener('click', (e)=>{
    //     e.preventDefault();
    //     if(val){
    //         clearInterval(leftslides);
    //         sli();
    //         setTimeout(leftslides = setInterval(sli, 6500),6500)
    //         val = !val;
    //     } else{
    //         clearInterval(leftslides);
    //         sli();console.log("클릭거절")
    //         setTimeout(leftslides = setInterval(sli, 6500),6500)
    //         val = !val;
    //     }
    // });
}
