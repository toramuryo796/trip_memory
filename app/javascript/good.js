function goodBtn() {
  const goodBtns = document.querySelectorAll(".good-btn");
  goodBtns.forEach(function (btn) {
    btn.addEventListener("click", () =>{
      const btnId = btn.dataset.num
      const groupNum = btn.dataset.group
      const XHR = new XMLHttpRequest();
      XHR.open("POST", `/groups/${groupNum}/candidates/${btnId}/goods`, true)
      XHR.responseType = "json";
      XHR.send();

      XHR.onload = () => {
        if (XHR.status != 200) {
          debugger
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const disBtn = XHR.response.post;
        debugger
        if (disBtn){
          // 新たににお気に入りされた場合
          const appResetBtn = document.getElementById(`hidden-reset-good-${btnId}`);
          const disSetBtn = document.getElementById(`set-good-${btnId}`)
          disSetBtn.removeAttribute("class")
          disSetBtn.className = "hidden-set-good good-btn"
          appResetBtn.removeAttribute("class");
          appResetBtn.className = "good-btn reset-good"
          debugger
        }else{
          // お気に入りが解除された場合
          debugger
          const appSetBtn = document.getElementById(`hidden-set-good-${btnId}`);
          const disResetBtn = document.getElementById(`reset-good-${btnId}`);
          disResetBtn.removeAttribute("class");
          disResetBtn.className = "hidden-reset-good good-btn";
          appSetBtn.removeAttribute("class");
          appSetBtn.className = "set-good good-btn"
        }
      };
    });
  });
}
window.addEventListener("load", goodBtn)
