{
    const view_warp = document.querySelector('.myinfo_view_warp');
    const myinfo_category_list = document.querySelectorAll('.myinfo_category_list ul li');

    const urllist =[
        // '/my/like',
        '/my/userinfo',
        '/my/pwchange',
        '/my/payhistory',
        '/my/delete'
    ]

    /*
    const urllist =[
        {like: '/my/like'},
        {userinfo: '/my/userinfo'},
        {passwordchange: '/my/pwchange'},
        {paymenthistory: '/my/payhistory'},
        {userdelete: '/my/delete'}
    ]
    */

    // 처음 페이지 열릴때 기본 화면
    const like = () => {
        fetch('/my/userinfo')
            .then(res => res.text())
            .then(data =>{
                view_warp.innerHTML = data;
            }).catch(err =>{
                //console.log(err)
            })
    }
    setTimeout(like(),1000);

    // 리스트별 이벤트 걸기
    for(let i = 0; i < myinfo_category_list.length; i++){
       myinfo_category_list[i].addEventListener('click', () => {
           fetch( urllist[i])
               .then(res => res.text())
               .then(data =>{
                   if(urllist[i] === '/my/userinfo'){
                       myinfo_view();
                   }
                   myinfo_category_list_click(urllist[i], i)
                   view_warp.innerHTML = data;
                   if(urllist[i] === '/my/pwchange'){
                       check_pw();
                       pwbutton();
                   }
               }).catch(err =>{
                  console.log(err)
               });
       })
    }
    const myinfo_category_list_click = (url , i) =>{
        for(let i = 0; i < myinfo_category_list.length; i++) {
            myinfo_category_list[i].classList.remove('myclick');
        }
            if(url ==='/my/userinfo'){
                myinfo_category_list[i].classList.add('myclick');

            } else if(url ==='/my/pwchange'){
                myinfo_category_list[i].classList.add('myclick');
            } else if(url ==='/my/payhistory'){
                myinfo_category_list[i].classList.add('myclick');

            } else if(url ==='/my/delete') {
                myinfo_category_list[i].classList.add('myclick');

            }
    }
    myinfo_category_list_click('/my/userinfo',0)

    const myinfo_view = () => {
        fetch('/my/userinfo',{
            'method': 'post',
            'headers': {'Content-Type': 'application/json'},
            'body': JSON.stringify({
                'userpk': 0
            })
        }).then(res =>{
            return res.json();
        } ).then(data => {
            setMyinfoValue(data.userinfo); // 내 정보
            setaddrValue(data.addrinfo);  //배송지 정보
            myinfo_click()
            addrSearch()
        }).catch(e => {
            console.log(e);
        });
    }
    myinfo_view()

    const setMyinfoValue = (data) => {
        const email = document.querySelector('.email');
        const nm = document.querySelector('.nm');
        const gender = document.querySelector('.gender');
        const birthdaymm = document.querySelector('.birthdaymm');
        const birthdaydd = document.querySelector('.birthdaydd');
        email.value = data.email;
        nm.value = data.nm;
        for(var i=0; i<gender.length; i++){
            if(gender[i].value == data.gender){
                gender[i].selected = true;
            }
        }
        birthdaymm.value = data.birthdaymm;
        birthdaydd.value = data.birthdaydd;
    }

    // 배송지 정보 받아와서 뿌리기
    const setaddrValue = (data) => {
        let i =0;
        const secListElem =  document.querySelectorAll('.cart_list')[1];
        secListElem.innerHTML='';
        data.forEach((item) => {
            let addrWarpElem = document.createElement('div');
            addrWarpElem.classList.add('addrWarp');
            secListElem.appendChild(addrWarpElem);

            let divElem1 = document.createElement('div');
            let divElem2 = document.createElement('div');
            let divElem3 = document.createElement('div');

            addrWarpElem.innerHTML = `
                <div>
                    <label><input type="checkbox" class="addrdefault">기본배송지</label>
                </div>
                <div class="addrsearch">
                    <span>주소</span>
                    <input type="text" class="addr" name="addr" value="${item.addr}">
                    <input type="text" class="detailedaddr" value="${item.detailedaddr}" name="detailedaddr" placeholder="상세주소">
                </div>
                <div>
                    <span>연락처</span><input type="text" value="${item.addrtel}" class="addrtel" name="addrtel">
                </div>
                <div>
                    <span>이름</span><input type="text" class="addrnm" value="${item.addrnm}" name="addrnm">
                </div>
            `;
            if(`${item.addrdefault}`=== '0'){
                const addrdefaultElem = document.querySelector('.addrdefault');
                addrdefaultElem.checked = true;
            }

            divElem1.classList.add('deladdr');
            divElem1.innerText='삭제';
            addrWarpElem.prepend(divElem1);

            divElem1.addEventListener('click', () =>{
                fetch('/my/userinfo/del',{
                    'method': 'post',
                    'headers': {'Content-Type': 'application/json'},
                    'body': JSON.stringify({
                        'userpk': `${item.userpk}`,
                        'addresspk': `${item.addresspk}`
                    })
                })
                    .then(res => res.json())
                    .then(data => {
                        //console.log(data);
                    }).catch(err => {
                        console.log(err);
                })
            });
            divElem2.classList.add('info_button');
            divElem2.innerText='정보수정';
            addrWarpElem.appendChild(divElem2);
            const addrdefaultElem = document.querySelector('.addrdefault');
            // const addrValue = document.querySelector('.addr');
            // const detailedaddrValue = document.querySelector('.detailedaddr');
            // const addrtelValue = document.querySelector('.addrtel');
            // const addrnmValue = document.querySelector('.addrnm');

            divElem2.addEventListener('click', () =>{
                console.log(addrdefaultElem);
                let addrdefault=1;
                if(addrdefaultElem.checked){
                    addrdefault = 0;
                } else {
                    addrdefault = 1;
                }

                const addrValue = document.querySelectorAll('.addr');
                const detailedaddrValue = document.querySelectorAll('.detailedaddr');
                const addrtelValue = document.querySelectorAll('.addrtel');
                const addrnmValue = document.querySelectorAll('.addrnm');
                console.log(addrValue.value);
                console.log({
                    'addresspk': `${item.addresspk}`,
                    'addr': addrValue[i].value,
                    'detailedaddr': detailedaddrValue[i].value,
                    'addrtel': addrtelValue[i].value,
                    'addrnm': addrnmValue[i].value,
                    'addrdefault': addrdefault
                })
                fetch('/my/addrinfo/upd',{
                    'method': 'post',
                    'headers': {'Content-Type': 'application/json'},
                    'body': JSON.stringify({
                        'addresspk': `${item.addresspk}`,
                        'addr': addrValue.value,
                        'detailedaddr': detailedaddrValue.value,
                        'addrtel': addrtelValue.value,
                        'addrnm': addrnmValue.value,
                        'addrdefault': addrdefault
                    })
                })
                    .then(res => res.json())
                    .then(data => {
                        if(data.result){
                            // location.href = location.href;
                        }else {
                            alert('수정 실패!')
                        }
                    }).catch(err => {
                    console.log(err);
                })
            });
            i++;
        }); //for 문종료



    }


    // 회원정보 배송지 선택 버튼
    const myinfo_click = () => {
        const cart_check_click = document.querySelector('.cart_check');
        cart_check_click.firstElementChild.addEventListener('click', () => {
            myinfo_view();
            cart_check_click.firstElementChild.classList.add('myclick');
            cart_check_click.lastElementChild.classList.remove('myclick');
            const cart_list = document.querySelectorAll('.cart_list');
            cart_list[1].classList.add('display_none');
            cart_list[0].classList.remove('display_none');
        })
        cart_check_click.lastElementChild.addEventListener('click', () => {
            myinfo_view();
            cart_check_click.lastElementChild.classList.add('myclick');
            cart_check_click.firstElementChild.classList.remove('myclick');
            const cart_list = document.querySelectorAll('.cart_list');
            cart_list[0].classList.add('display_none');
            cart_list[1].classList.remove('display_none');


        })
    }

    //배송지 검색 이벤트
    const addrSearch = () => {
        // 배송지검색
        const addrElem = document.querySelectorAll('.addr');
        const detailedaddrElem = document.querySelectorAll('.detailedaddr');
        for(let i = 0; i < addrElem.length; i++){
            // console.log(addrElem[i]);
            // console.log(detailedaddrElem[i]);
            // addrElem.style.cursor= 'pointer';
            addrElem[i].addEventListener('click', ()=>{
                // console.log(addrElem[i]);
                addrElem[i].value='';
                detailedaddrElem[i].value='';
                new daum.Postcode({
                    oncomplete: function(data) {
                        //data는 사용자가 선택한 주소 정보를 담고 있는 객체이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                        if(data.sido !== '서울' || data.sidoEnglish !== 'Seoul' ){
                            alert('배송불가 지역입니다.');
                        }else{
                            // console.log(data);
                            addrElem[i].value = data.address;

                            detailedaddrElem[i].focus()
                        }
                    }
                }).open();
            });
        }

    }

    // 현재 비밀번호 확인
    const pwbutton = () => {
        const change_buttonElem = document.querySelector('.change_button');
        // console.log(change_buttonElem);
        change_buttonElem.addEventListener('click',()=>{
            const beforepw = document.querySelector('.beforepw').value;
            const pw = document.querySelector('.upw').value;

            const param = {
                beforepw, pw
            }

            fetch('/my/pwchange/upd',{
                'method': 'post',
                'headers': {'Content-Type': 'application/json'},
                'body': JSON.stringify(param)
            })
                .then(res => res.json())
                .then(data => {
                    //console.log(data);
                    
                }).catch(err => {
                console.log(err);
            })
        });

    }
}