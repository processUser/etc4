
window.onload = () =>{
    const menuList = (categorypk, defaultimage, desc, countscore) => {
        fetch('http://localhost:8090/goodslist',{
            'method': 'post',
            'headers': {'Content-Type': 'application/json'},
            'body': JSON.stringify({
                categorypk, defaultimage, desc, countscore
            })
        }).then(res =>{
            return res.json();
        } ).then(data => {
            console.log(data)
            goodsList(data)
        }).catch(e => {
            console.log(e);
        });
    }

    menuList()

    const menuChooseElem = document.querySelector('.menuChoose');
    console.log(menuChooseElem);
    menuChooseElem.addEventListener('click', (e) =>{
        console.log(e.target.dataset.category);
        if(e.target.dataset.category === '0'){
            menuList();
        } else if(e.target.dataset.price === '0'){
            menuList(0,0,2,0);
        } else if(e.target.dataset.price === '1'){
            menuList(0,0,1,0);
        } else if(e.target.dataset.countscore === '1'){
            menuList(0,0,0,1);
        }

    })

    //http://placehold.it/150x150 - 이미지 대체

    function goodsList(data) {
        let jsonlist = data.list;
        
        const listwarpElem = document.getElementById('listwarp');
        listwarpElem.innerHTML='';
        jsonlist.forEach((items) => {  // 전체 수 만큼 반복.
            // console.log('items : ' + items)
            const articleElem = document.createElement('article');
            const imgElem = document.createElement('img');
            const divElem = document.createElement('div');
            const spanElem1 = document.createElement('span');
            const starElem = document.createElement('span');
            const spanElem2 = document.createElement('span');
            const pElem1 = document.createElement('p');
            const pElem2 = document.createElement('p');

            const avgscore = items.reviewvo.avgscore;

            articleElem.style.cursor='pointer'

            //imgElem.src = 'http://placehold.it/268x320'
            imgElem.src = "/res/img/product/"+items.img+".jpg"
            imgElem.alt = "사진"

            pElem1.classList.add('menutitle');
            pElem1.innerText = items.gnm;
            pElem1.dataset.gnum = items.gnum;
            pElem1.dataset.gnm = items.gnm;
            pElem2.innerText = items.price.toLocaleString()+'원';
            pElem2.dataset.price = items.price;
            pElem2.classList.add('menuprice');
            divElem.style.position = 'relative';
            divElem.style.marginTop = '10px';
            // spanElem1.innerText = avgscore;
            spanElem1.classList.add('nostar');
            starElem.classList.add('star');
            spanElem2.innerText = '리뷰 ' + items.reviewvo.countscore;
            spanElem2.style.marginLeft = '15px'

            listwarpElem.append(articleElem);
            articleElem.append(imgElem)
            articleElem.append(pElem1)
            articleElem.append(pElem2)
            articleElem.append(divElem)
            divElem.append(spanElem1);
            divElem.append(spanElem2);

            // console.log(avgscore)
            starElem.style.width = (spanElem1.offsetWidth/5) * items.reviewvo.avgscore +'px';
            divElem.append(starElem);

            articleElem.addEventListener('click',() => {
                location.href=`/goods?gnum=${items.gnum}`
            })

        });
        // console.log(data.list);
        /*
        let jsonlist = data.list[1];
        for(var val in jsonlist) {
            console.log(jsonlist[val]);
        }
        */
    }
}