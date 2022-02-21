const check_pw = () => {
    const pw_changeElem = document.querySelectorAll('.pw_change');
    console.log(pw_changeElem);
    const beforepwElem = document.querySelector('.beforepw');
    const upwElem = document.querySelector('.upw');
    const chkpwElem = document.querySelector('.chkpw');

    // 비밀번호
    beforepwElem.addEventListener('blur', () => {
        if(!reg.pw.test(beforepwElem.value)){ // 일치하면 false
            if(!pw_changeElem[0].querySelector('.err')){
                const divElem = document.createElement('div');
                beforepwElem.classList.add('errBorder');
                divElem.innerHTML = '영문, 숫자, 특수문자(!, @, _) 각 1회 이상 사용<br> 8자리 이상 12자리이하';
                divElem.classList.add('err');
                //divElem.style.color = 'red'
                pw_changeElem[0].append(divElem)
            }
        } else{
            const divElem = pw_changeElem[0].querySelector('.err');
            beforepwElem.classList.remove('errBorder');
            if(divElem)
                divElem.remove();
        }
        console.log(reg.pw.test(beforepwElem.value))
    });

    // 비밀번호
    upwElem.addEventListener('blur', () => {
        if(!reg.pw.test(upwElem.value)){ // 일치하면 false
            if(!pw_changeElem[1].querySelector('.err')){
                const divElem = document.createElement('div');
                upwElem.classList.add('errBorder');
                divElem.innerHTML = '영문, 숫자, 특수문자(!, @, _) 각 1회 이상 사용<br> 8자리 이상 12자리이하';
                divElem.classList.add('err');
                //divElem.style.color = 'red'
                pw_changeElem[1].append(divElem)
            }
        } else{
            const divElem = pw_changeElem[1].querySelector('.err');
            upwElem.classList.remove('errBorder');
            if(divElem)
                divElem.remove();
        }
        console.log(reg.pw.test(upwElem.value))
    });

    upwElem.addEventListener('keydown', () => {
        if(chkpwElem.value === ''){
            if(!pw_changeElem[2].querySelector('.err')){
                const divElem = document.createElement('div');
                chkpwElem.classList.add('errBorder');
                divElem.innerHTML = '비밀번호를 확인하세요.';
                divElem.classList.add('err');
                //divElem.style.color = 'red'
                pw_changeElem[2].append(divElem)
            }
        }
    });

    // 비밀번호 확인
    chkpwElem.addEventListener('blur', () => {
        if(chkpwElem.value !== upwElem.value){
            if(!pw_changeElem[2].querySelector('.err')){
                const divElem = document.createElement('div');
                chkpwElem.classList.add('errBorder');
                divElem.innerHTML = '비밀번호를 확인하세요.';
                divElem.classList.add('err');
                //divElem.style.color = 'red'
                pw_changeElem[2].append(divElem)
            }
        } else{
            const divElem = pw_changeElem[2].querySelector('.err');
            chkpwElem.classList.remove('errBorder');
            if(divElem)
                divElem.remove();
        }
    });
}