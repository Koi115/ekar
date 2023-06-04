document.addEventListener('DOMContentLoaded', function() {

  let select = document.querySelector('[name="ward-num"]');


    select.addEventListener('change', function() {
      let selectedValue = select.value;
      console.log(selectedValue);
      

    // Ajaxリクエストを送信
    fetch(`/patients?ward_num=${selectedValue}`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.text();
      })
      .then(data => {
        // レスポンスのデータを利用して必要な処理を実行する
        // ...
      })
      .catch(error => {
        console.error('Error:', error);
      });








    });
    
  });