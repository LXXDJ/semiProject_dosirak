// document.addEventListener('DOMContentLoaded', () => {
//     const selectElement = document.getElementById('order-datatable-selector');
//     if (selectElement) {
//         selectElement.addEventListener('change',  (e) => {
//             const selectedValue = e.target.value
//             console.log('선택 된 옵션: ' + selectedValue)
//             if (selectedValue !== 'select') {
//                 axios.post(`orderList/update-Status`, {
//                     status: selectedValue
//                 })
//                     .then(res => {
//                         console.log("성공: " + res.data)
//                     })
//                     .catch(err => {
//                         console.log("에러: " + err)
//                     })
//             }
//         })
//     }
// })