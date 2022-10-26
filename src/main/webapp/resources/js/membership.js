/* Q&A */
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

/* 이용횟수 카운터 그래프 */
const use = document.getElementById("use").value;
const grade = document.getElementById("grade").value;
const counterNormal = document.getElementById("counterNormal");
const counterBronze = document.getElementById("counterBronze");
const counterSilver = document.getElementById("counterSilver")
const countOnOff = document.querySelectorAll(".countOnOff");
const useTxt = document.getElementById("useTxt");
console.log(use);
console.log(grade);
console.log(countOnOff);
counterBronze.style.visibility = "hidden";
counterSilver.style.visibility = "hidden";
if(grade=="Bronze") {
	counterNormal.style.visibility = "hidden";
	counterBronze.style.visibility = "visible";
	counterSilver.style.visibility = "hidden";
	countOnOff[use].style.background = "orange";
	countOnOff[use].style.visibility = "visible";
} else if(grade=="Silver") {
	counterNormal.style.visibility = "hidden";
	counterBronze.style.visibility = "hidden";
	counterSilver.style.visibility = "visible";
	countOnOff[use].style.background = "silver";
	countOnOff[use].style.visibility = "visible";
} else if(grade=="Gold") {
	counterNormal.style.visibility = "hidden";
	counterBronze.style.visibility = "hidden";
	counterSilver.style.visibility = "visible";
	countOnOff[20].style.background = "Gold";
	countOnOff[20].style.visibility = "visible";
} else if(grade=="Normal") {
	counterNormal.style.visibility = "visible";
	counterBronze.style.visibility = "hidden";
	counterSilver.style.visibility = "hidden";
	countOnOff[use].style.background = "gray";
	countOnOff[use].style.visibility = "visible";
} else {
	counterNormal.style.visibility = "visible";
	counterBronze.style.visibility = "hidden";
	counterSilver.style.visibility = "hidden";
	countOnOff[0].style.background = "gray";
	countOnOff[0].style.visibility = "visible";
}
useTxt.textContent = use+"회 이용";