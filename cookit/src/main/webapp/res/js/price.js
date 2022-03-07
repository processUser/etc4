{
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

    const price = localStorage.getItem('price');
    let addrpk;
    let addrnm;
    let addrs;
    let detailedaddr;
    let addrtel;
    const make_view = (data) => {
        const price_warp = document.querySelector('.price_warp');
        const addrList = data.addrinfo;
        addrList.forEach(addr => {
            if(addr.addrdefault === 0){

                addrpk = addr.addresspk;
                addrnm = addr.addrnm;
                addrs = addr.addr;
                detailedaddr = addr.detailedaddr;
                addrtel = addr.addrtel;

                price_warp.innerHTML=`
                <div>배송지</div>
                <div><input type="text" value="${addrs}"></div>
                <div><input type="text" value="${detailedaddr}"></div>
                <div><input type="text" value="${addrnm}"></div>
                <div><input type="text" value="${addrtel}"></div>
                <div>결제금액</div>
                <div>${Number(price).toLocaleString()}</div>
                <div class="kakaoPay">kakao pay 결제</div>
                `;
            }
        });
    }

    const do_requestPay = (data) =>{
        const userdata = data.userinfo
        const addrdata = data.addrinfo

        const IMP = window.IMP; // 생략 가능
        IMP.init(""); // Example: imp00000000 // 가맹점 식별 코드

        function requestPay(item) {
            // IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({ // param
                pg: "kakaoPay",
                pay_method: "card",
                merchant_uid: item,
                name: "cookit 포폴 상품 결제",
                amount: price,
                buyer_email: userdata.email,
                buyer_name: addrdata.addrnm ,
                buyer_tel: addrdata.addrtel ,
                buyer_addr: `${addrdata.addr + addrdata.detailedaddr}`
                // buyer_postcode: "01181"
            }, function (rsp) { // callback
                if (rsp.success) {
                    // 결제 성공 시 로직,
                    jQuery.ajax({
                        url: "/price", // 예: https://www.myservice.com/payments/complete
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        data: JSON.stringify({
                            imp_uid: rsp.imp_uid,
                            merchant_uid: rsp.merchant_uid
                        })
                    }).done(function (data) {
                        // 가맹점 서버 결제 API 성공시 로직
                    })
                } else {
                    // 결제 실패 시 로직,
                    alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
                }
            });
        }
        let goodspkList = [];
        const getGoodspk = () => {
            let carts = decodeURIComponent(escape(getCookie(`carts`))).replaceAll('},{', '} . {');
            let arrcart = carts.split(' . ')
            console.log(arrcart)

            arrcart.forEach(cart =>{
                let jsoncart = JSON.parse(cart);
                goodspkList.push(jsoncart.gnum);

            });
            console.log(goodspkList);
        }

        let kakaoPay = document.querySelector('.kakaoPay');
        kakaoPay.addEventListener('click', () => {
            getGoodspk();
            console.log(JSON.stringify({
                addresspk: addrpk,
                amount: Number(price),
                goodspkList: goodspkList
            }));
            // merchant_uid 미리 만들기.
            fetch('/price/ins',{
                'method': 'post',
                'headers': {'Content-Type': 'application/json'},
                'body': JSON.stringify({
                    addresspk: addrpk,
                    amount: price,
                    goodspkList: goodspkList
                })
            })
                .then(res => res.text())
                .then(data => {
                    console.log(data);
                    // requestPay(data)
                })
        });
    }
}