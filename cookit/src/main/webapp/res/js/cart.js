{
    console.log('장바구니');
    let price = 0;
    const cartslist = () =>{
        let carts = decodeURIComponent(escape(getCookie(`carts`))).replaceAll('},{', '} . {');
        let arrcart = carts.split(' . ')
        console.log(carts)
        console.log(arrcart)
        for(let i = 0; i < arrcart.length; i++){
            let jsoncarts = JSON.parse(arrcart[i]);
            console.log(jsoncarts)
        }
        const carts_list = document.querySelector('.carts_list');

        arrcart.forEach(cart =>{
            let jsoncart = JSON.parse(cart);
            let liElem = document.createElement('li');
            price += Number(jsoncart.price)
            liElem.innerHTML = `
                <div><input type="checkbox"></div>
                <div class="cart_list_img">
                    <img src="http://via.placeholder.com/132x132" alt="상품이미지">
                </div>
                <div class="cart_list_gnm" data-gnum="${jsoncart.gnum}">${jsoncart.gnm}</div>
                <div class="cart_list_quantity">
                    <span>-</span><span class="cart_list_quant">01</span><span>+</span>
                </div>
                <div class="cart_list_pri">${Number(jsoncart.price).toLocaleString()}</div>
                <div class="cart_list_deli">삭제</div>
            `;
            carts_list.appendChild(liElem);
        })

        let product_amount = document.querySelector('.product_amount > span');
        product_amount.innerText = price.toLocaleString()
        let delivery_fee = document.querySelector('.delivery_fee > span');
        let default_delivery_fee = 0;
        if(price < 60000){
            default_delivery_fee = 3000;
            delivery_fee.innerText = default_delivery_fee.toLocaleString();
        } else {
            delivery_fee.innerText = default_delivery_fee.toLocaleString();
        }
        let expected_payment_amount = document.querySelector('.expected_payment_amount > span');
        price += default_delivery_fee
        expected_payment_amount.innerText = price.toLocaleString();
    }
    cartslist()
    const make_payment = document.querySelector('.make_payment');
    make_payment.style.cursor='pointer';
    if(price !== 0) {
        make_payment.addEventListener('click', ()=>{
            localStorage.setItem('price', price);
            location.href='/price';
        })
    }

}