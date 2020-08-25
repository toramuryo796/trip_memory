function delete_member_Box () {
  const btns = []
  debugger
  btns = document.getElementsByClassName("delete-btn");
  for (let i = 0; i < btns.length; i++){
    btns.addEventListener("click", (e) => {
      console.log("aiu")
      this.parent().remove();
    }, false);
  }
}

window.addEventListener("load", delete_member_Box);