{
    //best 리뷰 리스트
    const bestReviewList = () => {
        fetch('/reviewlist')
            .then(res => res.json())
            .then((data) => {
                console.log(data.list);
                make_best_review_list(data.list)
            })
            .catch((err) => {
                console.log(err);
            });
    }
    bestReviewList();

    let best_review_listElem = document.querySelector('.best_review_list');
    best_review_listElem.innerHTML='';
    const make_best_review_list = (data) => {
        data.forEach((item) => {
            const divElem = document.createElement('div');
            divElem.innerHTML = `
                <img src="http://placehold.it/240x260" class="best_review_img" alt="${item.gnm}">
                <p>${item.gnm}</p>
                <div class="star_warp">
                    <span class="nostar"></span>
                    <span class="star" data-avgscore="${item.avgscore}"></span>
                </div>
                <p class="ellipsis">${item.revctnt}</p>
            `;
            best_review_listElem.appendChild(divElem);
        });

        best_review_listElem.style.width = 290 * data.length +'px';

        const nostarElemList = document.querySelectorAll('.nostar');
        const starElemList = document.querySelectorAll('.star');
        console.log(starElemList)
        starElemList.forEach((star) => {
            star.style.width = (nostarElemList[0].offsetWidth/5) * star.dataset.avgscore +'px';
        })
    }

    // const best_review_listElem = document.querySelector('.best_review_list');
    const reviewSlide = () =>{
        best_review_listElem = document.querySelector('.best_review_list');
        console.log(best_review_listElem.firstElementChild)
        best_review_listElem.style.transition = 4 + "s";
        best_review_listElem.style.transform = "translate(-" + 280 + "px, 0px)";

        best_review_listElem.addEventListener('transitionend', () => {
            let firstDivElem = best_review_listElem.firstElementChild;
            console.log(firstDivElem)
            best_review_listElem.style.transition = 0 + "ms";
            best_review_listElem.style.transform = "translate(0px, 0px)"
            best_review_listElem.appendChild(firstDivElem);
        });
    }
    // setInterval(reviewSlide, 6000);

    const ReviewList = (page) => {
        fetch('http://localhost:8090/reviewlist',{
            'method': 'post',
            'headers': {'Content-Type': 'application/json'},
            'body': JSON.stringify({
                page
            })
        })
            .then(res => res.json())
            .then((data) => {
                console.log(data.list);
                make_review_list(data);
            })
            .catch((err) => {
                console.log(err);
            });
    }
    ReviewList(0);

    const make_review_list = (data) => {
        const review_listElem = document.querySelector('.review_list');
        review_listElem.innerHTML='';
        data.list.forEach((item) => {
            const liElem = document.createElement('li');
            let imgElem = `<div><img src="http://placehold.it/150x170" alt="이미지 자리"></div>`;
            if (!item.revimg){
                imgElem = `<div><img src="http://placehold.it/140x160" alt="이미지 자리"></div>`;
                // liElem.innerHTML = ;
                // review_listElem.appendChild(imgElem)
            }
            liElem.innerHTML = `
                ${imgElem}
                <div>
                    <div>
                        <p>${item.gnm}</p>
                        <div style="position: relative">
                            <span class="nostar"></span>
                            <span class="star" data-revscore="${item.revscore}"></span>
                        </div>
                        <p>${item.rdt}</p>
                    </div>
                    <div>
                        <p class="ellipsis6">${item.revctnt}</p>
                    </div>
                </div>
            `;
            review_listElem.appendChild(liElem);
            const nostarElemList = document.querySelectorAll('.nostar');
            const starElemList = document.querySelectorAll('.star');
            // console.log(starElemList)
            starElemList.forEach((star) => {
                star.style.width = (nostarElemList[0].offsetWidth/5) * star.dataset.revscore +'px';
            })
        });
        const pagebuttonElem = document.querySelector('.pagebutton');
        pagebuttonElem.innerHTML ='';

        for(let i = 0; i <= data.page; i++){
            const divElem = document.createElement('div');
            divElem.innerText = i+1;
            divElem.addEventListener('click', ()=>{
                ReviewList(i * 10);
                // window.scrollTo({top:document.querySelector('.review_list_wrap'), behavior:'smooth'});
                window.scrollTo({top:document.querySelector('.review_list_wrap')});
            })
            pagebuttonElem.appendChild(divElem);
        }

    }

}