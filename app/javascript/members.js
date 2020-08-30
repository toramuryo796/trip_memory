function add_member () {
  const addBtn = document.getElementById("add-member");
  let deleteBtn;
  let memberLists;

  // メンバーbox削除処理
  const deleteMemberBox = (btnNum) => {
    memberLists = document.querySelectorAll(".member-box-list");
    memberLists.forEach(function(list){
      if (list.dataset.num === btnNum){
        list.remove();
      }
    });
  }
  // /メンバーbox削除処理

  const addMemberBox =  () => {
    // メンバーboxの追加処理
    const addPlace = document.getElementById("add-member-list");             // メンバーboxのulを取得
    const boxNum = document.querySelectorAll(".member-input-text").length;  // 画面上にいくつメンバーboxがあるか
    const HTML = `
    <li class="member-box-list" data-num="${boxNum+1}">
    <input name="group[members][]" type=text class="member-input-text" placeholder="メンバーのユーザー名を入力してください" data-num="${boxNum+1}">
    <input type="button" value="削除" class="delete-btn" data-num="${boxNum+1}">
    </li>`;
    addPlace.insertAdjacentHTML("beforeend", HTML);
    // /メンバーboxの追加処理
    
    // メンバーbox削除処理の呼び出し
    deleteBtn = document.querySelectorAll(".delete-btn");
    deleteBtn.forEach(function(btn){
      btn.addEventListener("click", (e) =>{
        let btnNum = btn.dataset.num
        deleteMemberBox(btnNum);
      });
    });
    // /メンバーbox削除処理の呼び出し
  }

  // 追加ボタンでメンバーbox追加イベント発火 
  addBtn.addEventListener("click" , (e) => {
    addMemberBox();
  })
  // /追加ボタンでメンバーbox追加イベント発火 
  

  
}

window.addEventListener("load", add_member);