function add_member () {
  const addBtn = document.getElementById('add-member');
    let count = 0;
  addBtn.addEventListener("click" , (e) => {
    const member1 = document.getElementById("add-member1")
    const member2 = document.getElementById("add-member2")
    const member3 = document.getElementById("add-member3")
    const member4 = document.getElementById("add-member4")
    const member5 = document.getElementById("add-member5")
    const maxMember= document.getElementById("member-max")
    count += 1
    console.log("aiu")
    switch(count){
      case 1 :
        member1.style.display = "block";
        break;
      case 2 :
        member2.style.display = "block";
        break;
      case 3 :
        member3.style.display = "block";
        break;
      case 4 :
        member4.style.display = "block";
        break;
      case 5 :
        member5.style.display = "block";
        break;
      default :
        maxMember.style.display = "block";
        break;
    }
    
  })
}

window.addEventListener("load", add_member)