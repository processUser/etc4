{
    const view_warp = document.querySelector('.myinfo_view_warp');
    const myinfo_category_list = document.querySelectorAll('.myinfo_category_list ul li');
    console.log(myinfo_category_list)

    const urllist =[
        '/my/like',
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
        fetch('/my/like')
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
           fetch( 'http://localhost:8090'+urllist[i])
               .then(res => res.text())
               .then(data =>{
                   console.log(urllist[i])
                   view_warp.innerHTML = data;
               }).catch(err =>{
                  console.log(err)
               })
       })
    }

}