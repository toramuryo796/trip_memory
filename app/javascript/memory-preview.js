document.addEventListener('DOMContentLoaded', function () {
  const imageList = document.getElementById("memory-preview");             // 写真をプレビューさせる位置
  const memoryForm = document.getElementById("memory-form-box");           // 写真formのdiv
  const addBtn = document.getElementById("add-image")                      // 追加ボタン
  
  // 選択した画像を表示する
  const createImageHTML = (blob) => {
    const imageCount = document.querySelectorAll(".memory-image").length  // 表示されている画像数
    addBtn.className = "add-image";                                      // 追加ボタン(hidden状態)のクラス名変更
    const deleteBtn = document.getElementById("delete-image-1");         // 削除ボタン取得(hidden状態)
    deleteBtn.className = "delete-image";                                // 削除ボタンのクラス名変更
    
    // 画像を表示させる記述
    const HTML = `                                                       
    <div class="memory-preview-box" id="memory-preview-box" data-num:"${imageCount+1}">
    <img src="${blob}" class="memory-image" data-num:"${imageCount+1}">
    ` ;
    imageList.insertAdjacentHTML("beforeend", HTML);
    fillBtn = document.querySelectorAll(".image-fill")
    // /画像を表示させる記述
  }
  // /選択した画像を表示する
  
  let fillBtn = document.querySelectorAll(".image-fill")
  fillBtn.forEach(function (btn) {
    btn.addEventListener("change", (e) => {
      const file = e.target.files[0] ;                               // 画像情報をfileに格納
      const blob = window.URL.createObjectURL(file)                  // 画像URLを生成
      createImageHTML(blob)                                          // createImageHTML関数を実行
    });
  })
  
  // image選択がされたら発火
// =======ファイル選択ボタンの出現==========================================================

const createFileBtn = () => {
  let imageChooseCount = document.querySelectorAll(".image-choose").length       // 表示されている画像選択ボタン数
    const HTML = `
    <div class="image-choose" data-num="${imageChooseCount+1}">
      <input type="file" name="memory[images][]" class="image-fill" id="image-fill-${imageChooseCount+1}" data-num="${imageChooseCount+1}">
      <input type="button" class="delete-image" id="delete-image-${imageChooseCount+1}" value="削除" data-num="${imageChooseCount}">
    </div>
    `
    memoryForm.insertAdjacentHTML("beforeend", HTML);
    const imageChooses = document.querySelectorAll(".image-choose")       // 表示されている画像選択ボタン
    // 追加された選択ボタンも発火可能に
    imageChooses.forEach(function(btn){
      btn.addEventListener("change", (e) => {
        const file = e.target.files[0] ;                               // 画像情報をfileに格納
        const blob = window.URL.createObjectURL(file)                  // 画像URLを生成
        createImageHTML(blob)                                          // createImageHTML関数を実行
      })
    })
  }

  // 追加ボタンクリックで発火
  addBtn.addEventListener("click", (e) => {
    createFileBtn();
  });

});