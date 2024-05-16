 // 페이지가 새로고침되었을 때 실행될 함수
    function checkForRefresh() {
    if (performance.navigation.type === 1) {
    // 1은 페이지 새로고침을 나타냅니다.
    // 페이지가 새로고침된 경우, 첫 페이지로 리다이렉트합니다.
    window.location.href = 'http://localhost:8080/admin/customer/askList';
}
}

    // 페이지 로드 시 checkForRefresh 함수를 실행합니다.
    window.onload = checkForRefresh;
