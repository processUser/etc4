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

    const like = () => {
        fetch('/my/like')
            .then(res => res.text())
            .then(data =>{
                view_warp.innerHTML = data;
            }).catch(err =>{
                console.log(err)
            })
    }
    like();

   for(let i = 0; i < myinfo_category_list.length; i++){
       myinfo_category_list[i].addEventListener('click', () => {
           fetch(urllist[i])
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