const riceSelect = document.querySelector('#rice')
const mainSelect = document.querySelector('#main')
const sideSelect = document.querySelector('#side')
const kimchiSelect = document.querySelector('#kimchi')

const riceNone = { menuName: "none", menuCategory: "rice", menuCode: 0, menuStatus: "Y", menuCarbo: 0, menuSugar: 0, menuProtein: 0, menuFat: 0, menuSaturatedFat: 0, menuTransFat: 0, menuCholesterol: 0, menuNatrium: 0, menuExtracash: 0, menuCalory: 0 };
const mainNone = { menuName: "none", menuCategory: "main", menuCode: 0, menuStatus: "Y", menuCarbo: 0, menuSugar: 0, menuProtein: 0, menuFat: 0, menuSaturatedFat: 0, menuTransFat: 0, menuCholesterol: 0, menuNatrium: 0, menuExtracash: 0, menuCalory: 0 };
const sideNone = { menuName: "none", menuCategory: "side", menuCode: 0, menuStatus: "Y", menuCarbo: 0, menuSugar: 0, menuProtein: 0, menuFat: 0, menuSaturatedFat: 0, menuTransFat: 0, menuCholesterol: 0, menuNatrium: 0, menuExtracash: 0, menuCalory: 0 };
const kimchiNone = { menuName: "none", menuCategory: "kimchi", menuCode: 0, menuStatus: "Y", menuCarbo: 0, menuSugar: 0, menuProtein: 0, menuFat: 0, menuSaturatedFat: 0, menuTransFat: 0, menuCholesterol: 0, menuNatrium: 0, menuExtracash: 0, menuCalory: 0 };

const noneList = [riceNone, mainNone, sideNone, kimchiNone]

let targetSelect
import{insertOption} from '/user/js/module/functions.mjs'




for(const none of noneList){
    switch(none.menuCategory){
        case('rice'): targetSelect = riceSelect; break;
        case('main'): targetSelect = mainSelect; break;
        case('side'): targetSelect = sideSelect; break;
        case('kimchi'): targetSelect = kimchiSelect; break;
    }
    insertOption(targetSelect, '메뉴를 선택해주세요.', JSON.stringify(none))
}


function isMenuStatus (menu){
    if(menu.menuStatus == 'S'){
        return false;
    } else {
        return true;
    }
}

for(const menu of menuList){
    switch(menu.menuCategory){
        case('rice'): targetSelect = riceSelect; break;
        case('main'): targetSelect = mainSelect; break;
        case('side'): targetSelect = sideSelect; break;
        case('kimchi'): targetSelect = kimchiSelect; break;
    }
    const text = (menu.menuStatus == 'S'?' (품절)':'') + menu.menuName + (menu.menuExtracash?` (+${menu.menuExtracash})`:'')
    insertOption(targetSelect, text, JSON.stringify(menu), isMenuStatus(menu))
}
