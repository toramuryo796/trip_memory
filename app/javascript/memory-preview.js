document.addEventListener('DOMContentLoaded', function () {
  const imageList = document.getElementById("memory-preview");             // 写真をプレビューさせる位置
  const memoryForm = document.getElementById("memory-form-box");           // 写真formのdiv
  const addBtn = document.getElementById("add-image")                      // 追加ボタン
  
  // 選択した画像を表示する
  const createImageHTML = (blob) => {
    const imageCount = document.querySelectorAll(".memory-image").length  // 表示されている画像数
    addBtn.className = "add-image";                                      // 追加ボタン(hidden状態)のクラス名変更
    let deleteBtn = document.getElementById("delete-image-1");         // 削除ボタン取得(hidden状態)
    deleteBtn.className = "delete-image";                                // 削除ボタンのクラス名変更
    
    // 画像を表示させる記述
    const HTML = `                                                       
    <div class="memory-preview-box" id="memory-preview-box-${imageCount+1}" data-num="${imageCount+1}">
    <img src="${blob}" class="memory-image">
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
  });
  
  // image選択がされたら発火
// =======ファイル選択ボタンの出現==========================================================

  const createFileBtn = () => {
    let imageChooseCount = document.querySelectorAll(".image-choose").length       // 表示されている画像選択ボタン数
    const HTML = `
    <div class="image-choose" data-num="${imageChooseCount+1}">
      <input type="file" name="memory[images][]" class="image-fill" id="image-fill-${imageChooseCount+1}" data-num="${imageChooseCount+1}">
      <input type="button" class="delete-image" id="delete-image-${imageChooseCount+1}" value="削除" data-num="${imageChooseCount+1}">
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
      });
    })
    
    // 削除処理の呼び出し
    let deletes = document.querySelectorAll(".delete-image")             // 追加したものも削除できるように
    
    deletes.forEach(function(btn){                                   
      btn.addEventListener("click", (e) => {                            // 削除ボタンを特定
        btnNum = btn.dataset.num                                       //削除ボタンのdata-numの値を削除処理に持っていく
        deleteImage(btnNum)
        btn.dataset.num = 0                                            // btnのdata-numを0にすることで、それ以降の削除は行われない
      }); 
    });
  } 
  
  // 追加ボタンクリックで発火
  addBtn.addEventListener("click", (e) => {
    createFileBtn();
  });
  
  // =========削除ボタン====================================================
  let chooseImages;
  let memoryPreviewBoxes;                                                 // 画像の外枠
  
  // 削除処理
  const deleteImage = (btnNum) =>{                                        // 削除処理の呼び出し元で取得した削除ボタンのdata-numの値が引数に入っている
    chooseImages = document.querySelectorAll(".image-choose");            // 消したい画像選択の箱を特定する
    memoryPreviewBoxes = document.querySelectorAll(".memory-preview-box") //表示されている画像の外枠取得
    chooseImages.forEach(function(box){
      if (box.dataset.num === btnNum){                                    // 押された削除ボタンと同じ値だと削除
        box.remove();
      }
    });
    memoryPreviewBoxes.forEach(function(box){                             // 押された削除ボタンと同じ値だと削除
      if (box.dataset.num === btnNum){
        box.remove();
      }
    })
    resetNum();
  }

  // deleteした際に、data-numの値をリセットする
  const resetNum = () => {
    let chooseBtns = document.querySelectorAll(".image-choose");
    let fillBoxes = document.querySelectorAll(".image-fill");
    let deleteButtons = document.querySelectorAll(".delete-image");
    let imagePlaces = document.querySelectorAll(".memory-preview-box");
    let count = 0;
    let fillCount = 0;
    let deleteCount = 0;
    let imageCount = 0;
    chooseBtns.forEach(function(btn){                  // 画像formの箱をリセット
      count += 1
      btn.dataset.num = count;
    });
    fillBoxes.forEach(function (box){                    // 入力欄リセット
      fillCount += 1;
      box.dataset.num = fillCount;
      box.id = `image-fill-${fillCount}`;
    });
    deleteButtons.forEach(function (del){                    // 削除ボタンリセット
      deleteCount += 1;
      del.dataset.num = deleteCount;
      del.id = `delete-image-${deleteCount}`
    });
    imagePlaces.forEach(function (img){                    // 画像リセット
      imageCount += 1;
      img.dataset.num = imageCount;
      img.id = `memory-preview-box-${imageCount}`;
    });
    
  }

  let imageDeletes = document.querySelectorAll(".delete-image")             // 削除できるように
  imageDeletes.forEach(function(btn){                                   
    btn.addEventListener("click", (e) => {                            // 削除ボタンを特定
      let btnNum = btn.dataset.num                                    //削除ボタンのdata-numの値を削除処理に持っていく
      deleteImage(btnNum)
    }); 
  });
  // /削除処理
});