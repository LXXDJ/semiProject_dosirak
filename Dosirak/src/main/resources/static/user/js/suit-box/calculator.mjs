

const $absCarbo = document.querySelector('#absCarbo');
const $absSugar = document.querySelector('#absSugar');
const $absProtein = document.querySelector('#absProtein');
const $absFat = document.querySelector('#absFat');
const $absSaturatedFat = document.querySelector('#absSaturatedFat');
const $absTransFat = document.querySelector('#absTransFat');
const $absCholesterol = document.querySelector('#absCholesterol');
const $absNatrium = document.querySelector('#absNatrium');
const $absCalory = document.querySelector('#absCalory');
const $totalPrice = document.querySelector('#totalPrice')

const $relativeCarbo = document.querySelector('#relativeCarbo');
const $relativeSugar = document.querySelector('#relativeSugar');
const $relativeProtein = document.querySelector('#relativeProtein');
const $relativeFat = document.querySelector('#relativeFat');
const $relativeSaturatedFat = document.querySelector('#relativeSaturatedFat');
const $relativeTransFat = document.querySelector('#relativeTransFat');
const $relativeCholesterol = document.querySelector('#relativeCholesterol');
const $relativeNatrium = document.querySelector('#relativeNatrium');
const $relativeCalory = document.querySelector('#relativeCalory');

const $plusButton = document.querySelector('#plusButton')
const $minusButton = document.querySelector('#minusButton')
const $quantity = document.querySelector('#quantity')

let userCarbo = 0;
let userSugar = 0;
let userProtein = 0;
let userFat = 0;
let userSaturatedFat = 0;
let userTransFat = 0;
let userCholesterol = 0;
let userNatrium = 0;
let userCalory = 0;

if(surveyResult){
    const BMR = userGender == '남'
        ?66.47 + (13.75 * surveyResult.surveyWeight) + (5 * surveyResult.surveyHeight) - (6.76 * surveyResult.surveyAge)
        :655.1 + (9.56 * surveyResult.surveyWeight) + (1.85 * surveyResult.surveyHeight) - (4.68 * surveyResult.surveyAge)


    if(surveyResult.surveyDiet == 'normal'){
        userCalory = BMR * 1.2
        userCarbo = userCalory * 0.5 / 4
        userProtein = userCalory * 0.3 / 4
        userFat = userCalory * 0.2 / 9
        userSaturatedFat = userCalory * 0.1 / 9
    } else if (surveyResult.surveyDiet == 'diet'){
        userCalory = BMR * 0.9
        userCarbo = userCalory * 0.4 / 4
        userProtein = userCalory * 0.4 / 4
        userFat = userCalory * 0.2 / 9
        userSaturatedFat = userCalory * 0.1 / 9
    } else {
        userCalory = BMR * 1.5
        userCarbo = userCalory * 0.3 / 4
        userProtein = userCalory * 0.5 / 4
        userFat = userCalory * 0.2 / 9
        userSaturatedFat = userCalory * 0.1 / 9
    }
    userTransFat = 300;
    userSugar = userGender == '남'?36:25;
    userCholesterol = 300;
    userNatrium = 2500;
    }
console.log(userCarbo)

// 현재 선택된 메뉴
let rice;
let main;
let side;
let kimchi;
// 모든 영양소가 합쳐진 객체
const combine = {}
// 카테고리별로 저장해두기
function sortCategory(selectMenu){
    switch(selectMenu.menuCategory){
        case('rice'): rice = selectMenu; break;
        case('main'): main = selectMenu; break;
        case('side'): side = selectMenu; break;
        case('kimchi'): kimchi = selectMenu; break;
    }
}
// 저장된 메뉴의 영양소를 모두 합쳐 combine 객체에 할당
function updateNutrition(selectMenu){
    for(const key in selectMenu){
        if(typeof selectMenu[key] === 'number' && key!='menuCode'){
            combine[key] = (rice?rice[key]:0) + (main?main[key]:0) + (side?side[key]:0) + (kimchi?kimchi[key]:0)
        }
    }
}

function setNutritionTable($abs, $relative, userNutrition, menuNutrition){
    $abs.textContent = Math.round((menuNutrition || 0) * 100) / 100
    if(surveyResult){
        $relative.textContent = Math.round($abs.textContent/userNutrition * 100)
    } else {
        $relative.textContent = 0
    }
}

// 만들어진 영양소 합계 객체 테이블로 전달
function combineToAbsTable(combine) {
    setNutritionTable($absCarbo, $relativeCarbo, userCarbo, combine.menuCarbo);
    setNutritionTable($absSugar, $relativeSugar, userSugar, combine.menuSugar);
    setNutritionTable($absProtein, $relativeProtein, userProtein, combine.menuProtein);
    setNutritionTable($absFat, $relativeFat, userFat, combine.menuFat);
    setNutritionTable($absSaturatedFat, $relativeSaturatedFat, userSaturatedFat, combine.menuSaturatedFat);
    setNutritionTable($absTransFat, $relativeTransFat, userTransFat, combine.menuTransFat);
    setNutritionTable($absCholesterol, $relativeCholesterol, userCholesterol, combine.menuCholesterol);
    setNutritionTable($absNatrium, $relativeNatrium, userNatrium, combine.menuNatrium);
    setNutritionTable($absCalory, $relativeCalory, userCalory, combine.menuCalory);


    $totalPrice.textContent = ((7000 + (combine.menuExtracash || 0)) * $quantity.value).toLocaleString();
}

//이벤트핸들러
const $selectTags = document.querySelectorAll('.menu-select')
$selectTags.forEach((select)=>{
    select.addEventListener('change', ()=>{
        const selectMenu = JSON.parse(select.value)
        sortCategory(selectMenu)    //카테코리별로 selectMenu 객체에 저장하는 함수
        updateNutrition(selectMenu)   //받은 객체를 바탕으로 합계 객체를 최신화 하는 함수
        combineToAbsTable(combine)  //합계된 영양소, 총액 table text 에 표시
        setMenuCodeAndQuantity()    //구매 시 넘어갈 상품 코드와 수량 셋팅
    })
})
$plusButton.addEventListener('click', ()=>{
    $quantity.value++
    $totalPrice.textContent = ((7000 + (combine.menuExtracash || 0)) * $quantity.value).toLocaleString();
    setMenuCodeAndQuantity()
})
$minusButton.addEventListener('click', ()=>{
    if($quantity.value>1){$quantity.value--}
    $totalPrice.textContent = ((7000 + (combine.menuExtracash || 0)) * $quantity.value).toLocaleString();
    setMenuCodeAndQuantity()
})
$quantity.addEventListener('change',()=>{
    if($quantity.value<1){$quantity.value = 1}
    $totalPrice.textContent = ((7000 + (combine.menuExtracash || 0)) * $quantity.value).toLocaleString();
    setMenuCodeAndQuantity()
})

// 메뉴 선택시 코드와 수령 저장
const $cartButton = document.querySelector('#cart')
const $butButton = document.querySelector('#buy')
$cartButton.addEventListener('click', sendSuitBox)

async function sendSuitBox(){
    const $suitBoxForm = document.querySelector('#productForm')
    const response = await fetch('suit-box/cart',{
        method: 'POST',
        body: new FormData($suitBoxForm)
    })
    const result = await response
    alert('상품을 장바구니에 담았습니다.')
}

function setMenuCodeAndQuantity() {
    const $productForm = document.querySelector('#productForm')
    const $selectMenuSpan = document.querySelector('#selectMenuSpan')
    const selectedRice = $selectMenuSpan.querySelector('#rice')
    const selectedMain = $selectMenuSpan.querySelector('#main')
    const selectedSide = $selectMenuSpan.querySelector('#side')
    const selectedKimchi = $selectMenuSpan.querySelector('#kimchi')
    const selectedQuantity = $selectMenuSpan.querySelector('#quantity')
    const rice = $productForm.querySelector('input[name="riceCode"]')
    const main = $productForm.querySelector('input[name="mainCode"]')
    const side = $productForm.querySelector('input[name="sideCode"]')
    const kimchi = $productForm.querySelector('input[name="kimchiCode"]')
    const quantity = $productForm.querySelector('input[name="quantity"]')
    rice.value = JSON.parse(selectedRice.value).menuCode
    main.value = JSON.parse(selectedMain.value).menuCode
    side.value = JSON.parse(selectedSide.value).menuCode
    kimchi.value = JSON.parse(selectedKimchi.value).menuCode
    quantity.value = selectedQuantity.value
}

