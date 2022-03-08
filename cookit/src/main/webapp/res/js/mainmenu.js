{
    let categorylistElem = document.querySelector('.category_list');

    for (let i =0; i < categorylistElem.children.length;i++){
        categorylistElem.children.item(i).style.cursor = 'pointer';
    }

    categorylistElem.addEventListener('mouseenter', () => {
        // categorylistElem.style.
        categorylistElem.classList.remove('over_hidden');
        categorylistElem.classList.add('iconT');
    })
    categorylistElem.addEventListener('mouseleave', () => {
        categorylistElem.classList.add('over_hidden');
        categorylistElem.classList.remove('iconT');
    })
    categorylistElem.addEventListener('click', (e) => {
        let categorypk = e.target.dataset.category;
        let defaultimage = e.target.dataset.defaultimage;

        console.log( e.target.dataset.defaultimage)
        categoryList(categorypk, defaultimage);
    })

    const categoryList = (categorypk, defaultimage) => {
        fetch('/goodslist',{
            'method': 'post',
            'headers': {'Content-Type': 'application/json'},
            'body': JSON.stringify({
                categorypk, defaultimage
            })
        }).then(res =>{
            return res.json();
        } ).then(data => {
            // console.log(data)
            makeCategoryList(data.list);
        }).catch(e => {
            console.log(e);
        });
    }
    categoryList(1, 52);

    const makeCategoryList = (data) => {
        const section3Elem = document.querySelector('.section3');
        section3Elem.lastElementChild.remove();

        const articlesElem = document.createElement('article');
        const ulElem = document.createElement('ul');

        ulElem.classList.add('menuSlideList');
        articlesElem.classList.add('over_hidden');

        articlesElem.appendChild(ulElem);
        section3Elem.appendChild(articlesElem);

        data.forEach(item => {
            const liElem = document.createElement('li');
            const divElem = document.createElement('div');
            const pElem1 = document.createElement('p');
            const pElem2 = document.createElement('p');
            const spanElem = document.createElement('span');
            const aElem = document.createElement('a');

            liElem.innerHTML = `
<!--                <a href="">-->
<!--                    <img src="/res/img/main/product/520/20210901132409761.png" alt="눈꽃치즈닭갈비">-->
                    <img src="/res/img/main/product/520/${item.categorypk}/${item.img}.png" alt="${item.gnm}">
                    
<!--                </a>-->
<!--                <div>-->
<!--                    <p >상품명</p>-->
<!--                    <p class="cartBtnWarp">-->
<!--                        <span></span>-->
<!--                    </p>-->
<!--                </div>-->
            `;

            pElem1.innerText = `${item.gnm}`;
            spanElem.innerText = `${item.price}원`;

            aElem.style.cursor = 'pointer';

            ulElem.appendChild(liElem);
            liElem.appendChild(divElem);
            divElem.appendChild(pElem1);
            divElem.appendChild(pElem2);
            pElem2.appendChild(spanElem);
            pElem2.appendChild(aElem);

            const param = JSON.stringify({
                'goodspk': `${item.goodspk}`,
                'gnum': `${item.gnum}`,
                'gnm': `${item.gnm}`,
                'price': `${item.price}`
            });
            aElem.addEventListener('click', (e) =>{
                // console.log('aaa')
                setCookie('carts', param);
                e.preventDefault();
            })

        })

    }

    // 하단 메뉴 리스트
    const bottomMenuList = (categorypk, defaultimage) => {
        fetch('/goodslist',{
            'method': 'post',
            'headers': {'Content-Type': 'application/json'},
            'body': JSON.stringify({
                categorypk, defaultimage
            })
        }).then(res =>{
            return res.json();
        } ).then(data => {
            console.log(data)
            makeBottomMenuList(data.list);
        }).catch(e => {
            console.log(e);
        });
    }
    bottomMenuList(0, 13);

    const makeBottomMenuList = (data) => {
        const bottom_menu_list = document.querySelector('.bottom_menu_list');
        bottom_menu_list.innerHTML='';
        data.forEach(item => {
            const dlElem = document.createElement('dl');
            const dtElem = document.createElement('dt');
            const ddElem = document.createElement('dd');
            const aElem = document.createElement('a');

            dtElem.innerHTML = `
                <img src="/res/img/main/product/132/${item.img}.png" alt="${item.gnm}">
            `;

            ddElem.innerHTML = `
                <p>${item.gnm}</p>
                <p>${item.price}<span>원</span></p>
            `;
            ddElem.appendChild(aElem);
            dlElem.appendChild(dtElem);
            dlElem.appendChild(ddElem);
            bottom_menu_list.appendChild(dlElem);
            const param = JSON.stringify({
                'goodspk': `${item.goodspk}`,
                'gnum': `${item.gnum}`,
                'gnm': `${item.gnm}`,
                'price': `${item.price}`
            });
            aElem.addEventListener('click', (e) =>{
                setCookie('carts', param);
                e.preventDefault();
            });
        });
    }
}