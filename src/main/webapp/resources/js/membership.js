var q_btnAll = document.querySelectorAll('.q_btn');
var answerAll = document.querySelectorAll('.answer');
console.log(q_btnAll);
console.log(answerAll);
            
for(var i=0; i<q_btnAll.length; i++){
    q_btnAll[i].addEventListener('click',function() {
    var q_btnNum = this.getAttribute('data-num');
    showHideToggle(q_btnNum);
    console.log(q_btnNum);
    }); 
};

function showHideToggle(index) {
    answerAll[index].classList.toggle('active');
};
/*
const bmiBtn = document.getElementById('button2');
            bmiBtn.onclick = function(){
                const kg = document.getElementById('kg').value;
                const meter = document.getElementById('cm').value * 0.01;
                const judgement2 = document.getElementById('judgement2');
                const sensor = document.getElementById('chart').querySelector('.sensor');
                const clacBmi = kg/(meter*meter);
                const result = clacBmi.toFixed(1);
                let resultPos = 0;

                if(result >0 && result <= 18.5){
                    judgement2.innerHTML = '나의 신체질량지수(BMI) : '+result+'입니다. 따라서 저체중입니다.';
                    resultPos = Math.round((result/18.5)*100);
                    sensor.style.left = resultPos + 'px';
                }
                if(result >18.5 && result <= 23){
                    judgement2.innerHTML = '나의 신체질량지수(BMI) : '+result+'입니다. 따라서 정상체중입니다.';
                    judgement2.style.color = 'blue';
                    resultPos = Math.round(((result-18.5)/4.5)*100)+100;
                    sensor.style.left = resultPos + 'px';
                }
                if(result >23 && result <= 25){
                    judgement2.innerHTML = '나의 신체질량지수(BMI) : '+result+'입니다. 따라서 과체중입니다.';
                    judgement2.style.color = 'navy';
                    resultPos = Math.round(((result-23)/2)*100)+200;
                    sensor.style.left = resultPos + 'px';
                }
                if(result >25 && result <= 30){
                    judgement2.innerHTML = '나의 신체질량지수(BMI) : '+result+'입니다. 따라서 비만입니다.';
                    judgement2.style.color = 'violet';
                    resultPos = Math.round(((result-25)/5)*100)+300;
                    sensor.style.left = resultPos + 'px';
                }
                if(result >30){
                    judgement2.innerHTML = '나의 신체질량지수(BMI) : '+result+'입니다. 따라서 고도비만입니다.';
                    judgement2.style.color = 'red';
                    resultPos = Math.round(((result-30)/10)*100)+400;
                    sensor.style.left = resultPos + 'px';
                }
                console.log(result);
                console.log(resultPos);
            };

            */