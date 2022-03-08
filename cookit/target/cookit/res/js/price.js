{
    const price = localStorage.getItem('price');
    let goodspkList = [];
    const getGoodspk = () => {
        let carts = decodeURIComponent(escape(getCookie(`carts`))).replaceAll('},{', '} . {');
        let arrcart = carts.split(' . ')
        console.log(arrcart)

        const goods_warp = document.querySelector('.goods_warp');

        arrcart.forEach(cart =>{
            let jsoncart = JSON.parse(cart);
            goodspkList.push(jsoncart.goodspk);

            console.log(jsoncart)
            const divElem = document.createElement('div');
            divElem.innerHTML =`
                <div class="cart_list_gnm" data-gnum="${jsoncart.gnum}">${jsoncart.gnm}</div>
                <div class="cart_list_img">
                    <img src="http://via.placeholder.com/80x80" alt="상품이미지">
                </div>
                <span>
                    <span class="cart_list_pri">${Number(jsoncart.price).toLocaleString()}</span>
                    &#92;
                    <span class="cart_list_quant">01</span>
                </div>
            `;
            goods_warp.appendChild(divElem);
        });
    }
    getGoodspk();
    const priceElem = document.querySelector('.price');
    if(price<60000){
        priceElem.innerText = `${(3000).toLocaleString()} 원`
    } else {
        priceElem.innerText = `0원`

    }

    fetch('/my/userinfo',{
        'method': 'post',
        'headers': {'Content-Type': 'application/json'},
        'body': JSON.stringify({
            'userpk': 0
        })
    }).then(res =>{
        return res.json();
    } ).then(data => {
        console.log(data.userinfo); // 내 정보
        console.log(data.addrinfo);  //배송지 정보
        make_view(data);
        do_requestPay(data)
    }).catch(e => {
        console.log(e);
    });

    let addrpk;
    let addrnm;
    let addrs;
    let detailedaddr;
    let addrtel;
    const make_view = (data) => {
        const price_warp = document.querySelector('.price_warp');
        const addrList = data.addrinfo;
        if(addrList.length !== 0){
            addrList.forEach(addr => {
                if(addr.addrdefault === 0){

                    addrpk = addr.addresspk;
                    addrnm = addr.addrnm;
                    addrs = addr.addr;
                    detailedaddr = addr.detailedaddr;
                    addrtel = addr.addrtel;

                    price_warp.innerHTML=`
                        <div>기본배송지</div>
                        <div><input type="text" value="${addrnm}"></div>
                        <div><input type="text" value="${addrs}"></div>
                        <div><input type="text" value="${detailedaddr}"></div>
                        <div><input type="text" value="${addrtel}"></div>
                    `;
                }
            });
        } else {
            price_warp.innerHTML=`
                <input type="hidden" class="new_value" value="1">
                <div>
                    <input type="text" class="addrnm_value" placeholder="받는사람" value="${data.userinfo.nm}">
                    <label><input type="checkbox" class="addrdefault_value" value="0">기본 배송지</label>
                </div>
                <div><input type="text" class="addr_value" placeholder="주소"></div>
                <div><input type="text" class="detailedaddr_value" placeholder="상세주소"></div>
                <div><input type="text" class="addrtel_value" placeholder="연락처"></div>
            `;
        }
        setAddr();
    }
    const setAddr = () => {
        let addr_value = document.querySelector('.addr_value');

        if(addr_value){
            addr_value.addEventListener('click', () => {
                console.log('a')
                const detailedaddr_value = document.querySelector('.detailedaddr_value');

                new daum.Postcode({
                    oncomplete: function(data) {
                        //data는 사용자가 선택한 주소 정보를 담고 있는 객체이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                        if(data.sido !== '서울' || data.sidoEnglish !== 'Seoul' ){
                            alert('배송불가 지역입니다.');
                        }else {
                            addr_value.value = data.address;
                            detailedaddr_value.focus()
                        }
                    }
                }).open();
            });
        }
    }

    const pay_warp = document.querySelector('.pay_warp');
    pay_warp.innerHTML=`
        <div>결제금액</div>
        <div>${Number(price).toLocaleString()}</div>
        <div class="kakaoPay">kakao pay 결제</div>
    `;

    const do_requestPay = (data) =>{
        const userdata = data.userinfo
        const addrdata = data.addrinfo
        console.log(addrdata);
        const IMP = window.IMP; // 생략 가능
        IMP.init("imp78003467"); // Example: imp00000000 // 가맹점 식별 코드

        function requestPay(item) {
            console.log(item.uid);
            // IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({ // param
                pg: "kakaoPay",
                pay_method: "card",
                merchant_uid: item.uid,
                name: "cookit 포폴 상품 결제",
                amount: price,
                buyer_email: userdata.email,
                buyer_name: addrnm ,
                buyer_tel: addrtel ,
                buyer_addr: addrs + detailedaddr
                // buyer_postcode: "01181"
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp)
                    console.log(rsp.imp_uid)
                    // 결제 성공 시 로직,
                    jQuery.ajax({
                        url: "/price", // 예: https://www.myservice.com/payments/complete
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        data: JSON.stringify({
                            paymentpk: item.paymentpk,
                            imp_uid: rsp.imp_uid,
                            merchant_uid: rsp.merchant_uid,
                            pg_provider: rsp.pg_provider,
                            pg_tid: rsp.pg_tid,
                            goodspkList: goodspkList,
                        })
                    }).done(function (data) {
                        // 가맹점 서버 결제 API 성공시 로직
                        console.log(data)
                    })
                } else {
                    // 결제 실패 시 로직,
                    alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
                }
            });
        }


        let kakaoPay = document.querySelector('.kakaoPay');
        kakaoPay.addEventListener('click', () => {
            const new_value = document.querySelector('.new_value');
            let param = null;
            if(new_value){
                if(new_value.value === '1'){
                    const addrnm_value = document.querySelector('.addrnm_value');
                    const addr_value = document.querySelector('.addr_value');
                    const detailedaddr_value = document.querySelector('.detailedaddr_value');
                    const addrtel_value = document.querySelector('.addrtel_value');
                    const addrdefault_value = document.querySelector('.addrdefault_value');
                    console.log('1')
                    param = {
                        addrnm: addrnm_value.value,
                        addr:addr_value.value,
                        detailedaddr:detailedaddr_value.value,
                        addrtel:addrtel_value.value,
                        addrdefault:addrdefault_value.value
                    }
                }
            }

            //getGoodspk();
            // merchant_uid 미리 만들기.
            fetch('/price/ins',{
                'method': 'post',
                'headers': {'Content-Type': 'application/json'},
                'body': JSON.stringify({
                    addresspk: addrpk,
                    amount: price,
                    goodspkList: goodspkList,
                    addrdto: param
                })
            })
                .then(res => res.json())
                .then(data => {
                    console.log(data);
                    // requestPay(data)
                })
        });
    }
}