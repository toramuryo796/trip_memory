function add_member () {
  const addBtn = document.getElementById('add-member');
    let count = 0;
  addBtn.addEventListener("click" , (e) => {
    const addPlace = document.getElementById("add-member-list")
    const HTML = `
      <li class="member-box-list">
        <input name="group[members][]" type=text class="member-input-text" placeholder="メンバーのユーザー名を入力してください" >
      </li>`
    addPlace.insertAdjacentHTML("beforeend", HTML)
  })
}
window.addEventListener("load", add_member)