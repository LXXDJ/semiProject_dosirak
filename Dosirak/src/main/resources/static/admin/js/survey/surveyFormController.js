const versionId = [[${version.versionId}]]

const $modifyButton = document.querySelector('#modify') // 수정 버튼
$modifyButton.addEventListener('click', modify)


const $thQuestionList = document.querySelectorAll('.question')
$thQuestionList.forEach(() => {
})
setQuestionOrderAndForm(); // text, orderInput value 할당

const $insertQuestion = document.querySelector('#insertQuestion') // 질문 추가 버튼
$insertQuestion.addEventListener('click', () => {
    const $questionDivList = document.querySelectorAll('.questionDiv');
    // 파라미터 value 저장해서 문자열 이어붙힌 뒤 innerHtml 적용시키기
    const $orderDiv = document.querySelector('#orderDiv')
    const $orderDivInputList = $orderDiv.querySelectorAll('input')
    const $orderDivSelectList = $orderDiv.querySelectorAll('select')
    $orderDiv.innerHTML += `<div class="questionDiv">
                        <form class="question">
                            <input style="display: none" name="questionOrder" class="questionOrder">
                            <input style="display: none" name="versionId" value="${versionId}">
                            <table class="datatable">
                                <tr>
                                    <td class="orderText"
                                        style="width: 10%">1
                                    </td>
                                    <td style="width: 10%">
                                        <select name="questionCategory">
                                            <option value="C">
                                                탄수화물
                                            </option>
                                            <option value="P">
                                                단백질
                                            </option>
                                            <option value="F">지방
                                            </option>
                                            <option value="W">운동
                                            </option>
                                        </select>
                                    </td>
                                    <td style="border-right: none">
                                        <input name="questionText"
                                               style="width: 700px" value="질문을 입력해주세요.">
                                    </td>
                                    <td style="border-left: none; width: 800px;">
                                        <button type="button" style="margin-left: 20px"
                                                class="insertAnswerButton"
                                                onclick="insertAnswer(event)">답변 추가
                                        </button>
                                        <button type="button" style="margin-left: 20px" onclick="deleteQuestion(event)"
                                                class="deleteQuestionButton">질문 삭제
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div>
                        </div>
                    </div>`
    //innerText
    const $nowOrderDiv = document.querySelector('#orderDiv')
    const $nowOrderInputList = $nowOrderDiv.querySelectorAll('input')
    const $nowOrderSelectList = $nowOrderDiv.querySelectorAll('select')

    for (let i = 0; i < $orderDivInputList.length; i++) {
        $nowOrderInputList[i].value = $orderDivInputList[i].value
    }
    for (let i = 0; i < $orderDivSelectList.length; i++) {
        $nowOrderSelectList[i].value = $orderDivSelectList[i].value
    }
    setQuestionOrderAndForm()
})

function setQuestionOrderAndForm() {
    const $questionDivList = document.querySelectorAll('.questionDiv')
    let order = 1;
    $questionDivList.forEach($div => {
        const text = $div.querySelector('.orderText')
        const questionOrder = $div.querySelectorAll('.questionOrder')
        questionOrder.forEach(orderQuestion=>orderQuestion.value = order)
        text.textContent = order;
        order++
    })
}

function insertAnswer(event) {
    const $div = event.target.parentElement.parentElement.parentElement.parentElement.parentElement.nextElementSibling;
    const questionIdElement = $div.previousElementSibling.querySelector('.questionId');
    const questionId = questionIdElement ? questionIdElement.value : 0;
    const $divInputList = $div.querySelectorAll('input');
    if ($div.querySelectorAll('form').length < 5) {
        $div.innerHTML += `<form class="answer">
            <input style="display: none" name="questionId" value="${questionId}"> <!-- 질문의 ID를 추가 -->
            <table class="datatable">
                <tr>
                    <td style="width: 10%"></td>
                    <td style="width: 10%"><input name="answerValue" style="width: 50px;" value="1"></td>
                    <td style="border-right: none"><input name="answerText" style="width: 500px;" value="답변을 입력해주세요."></td>
                    <td style="border-left: none; width: 800px;">
                        <button type="button" onclick="deleteAnswer(event)" style="margin-left: 20px" class="deleteAnswer">답변 삭제</button>
                    </td>
                </tr>
            </table>
        </form>`;
    }
    const $nowDivInputList = event.target.parentElement.parentElement.parentElement.parentElement.parentElement.nextElementSibling.querySelectorAll('input');
    for (let i = 0; i < $divInputList.length; i++) {
        $nowDivInputList[i].value = $divInputList[i].value;
    }
}


function deleteAnswer(event) {
    const $answerForm = event.target.parentElement.parentElement.parentElement.parentElement.parentElement
    $answerForm.remove();
}

function deleteQuestion(event) {
    event.target.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove()   // questionDiv 제거
    setQuestionOrderAndForm()
}

async function modify() {
    const $questionDivList = document.querySelectorAll('.questionDiv')
    const $versionSet = document.querySelector('#versionSet')
    let response = await fetch('/admin/survey/fetch/version', {
        method: 'POST',
        body: new FormData($versionSet)
    })
    let responseJson = await response.json();
    for (const $questionDiv of $questionDivList) {
        const question = $questionDiv.querySelector('.question')
        const answerLIst = $questionDiv.querySelectorAll('.answer')
        response = await fetch('/admin/survey/fetch/question', {
            method: 'POST',
            body: new FormData(question)
        })
        const questionId = await response.json()
        console.log(questionId)
        for (const answer of answerLIst) {
            const fd = new FormData(answer)
            console.log(fd.get('questionId'))
            if(fd.get('questionId') == 0){
                fd.set('questionId', questionId)
                console.log(fd.get('questionId'))
            }
            response = await fetch('/admin/survey/fetch/answer', {
                method: 'POST',
                body: fd
            })
            responseJson = await response.json()
        }
    }
}
