document.addEventListener("DOMContentLoaded", function() {
  const favorite_btn = document.querySelector('.posts-show #favorite_btn')

  if (favorite_btn) {
    favorite_btn.addEventListener("click", function(e) {
      //不會執行a連結默認行動
      e.preventDefault()
      const ax = require('axios')

      //網路上搜尋來axios token
      const token = document.querySelector('[name=csrf-token]').content
      ax.defaults.headers.common['X-CSRF-TOKEN'] = token
      //e.currentTarget：指的是註冊事件物件
      // e.target：指的是實際觸發事件的物件
      
      //會標明事件指向（current target）
      const postId = e.currentTarget.dataset.id
      //屬性總會指向目前於冒泡或捕捉階段正在處理該事件之事件處理器所註冊的 DOM 物件
      const icon = e.target

      ax.post(`/posts/${postId}/favorite`, {})
        .then(function(resp){
          if (resp.data.status == "added") {
            icon.classList.remove("far")
            icon.classList.add("fas")
          } else {
            icon.classList.remove("fas")
            icon.classList.add("far")
          }
        })
        .catch(function(err) {
          console.log(err);
        })
    })
  }
})