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
        let category = e.target.dataset.category;
        categoryList(category);
    })

    const categoryList = (category) => {
        fetch('http://localhost:8090/goodslist',{
            'method': 'post',
            'headers': {'Content-Type': 'application/json'},
            'body': JSON.stringify({
                categorypk: category
            })
        }).then(res =>{
            return res.json();
        } ).then(data => {
            makeCategoryList(data.list);
        }).catch(e => {
            console.log(e);
        });
    }
    categoryList(1);

    const makeCategoryList = (data) => {
        const section3Elem = document.querySelector('.section3');
        const articlesElem = document.createElement('article');
        const ulElem = document.createElement('ul');
        ulElem.classList.add('menuSlideList')

        data.forEach(item => {
            const liElem = document.createElement('li');
            liElem.innerHTML = `
<!--                <a href="">-->
<!--                    <img src="/res/img/main/product/520/20210901132409761.png" alt="눈꽃치즈닭갈비">-->
                    <img src="/res/img/product/${item.img}.jpg" alt="눈꽃치즈닭갈비">
<!--                </a>-->
                <div>
                    <p data-gnum="${item.gnum}" data-goodspk="${item.goodspk}">${item.gnm}</p>
                    <p>
                        <span>${item.price}원</span>
                        <a>
                            <span class="hide">장바구니</span>
                        </a>
                    </p>
                </div>
            `;
            ulElem.appendChild(liElem);
        })
        articlesElem.appendChild(ulElem);
        section3Elem.appendChild(articlesElem);
    }
}