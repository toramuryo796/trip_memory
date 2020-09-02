document.addEventListener('DOMContentLoaded', function () {
  const previewSpace = document.getElementById('image-preview');
  const imageForm = document.getElementById("image-form");
  
  imageForm.addEventListener("change", (e) => {
    const file = e.target.files[0]
    const blob = window.URL.createObjectURL(file);
    const HTML = `
      <img src="${blob}" class="candidate-image">
      `
    previewSpace.insertAdjacentHTML("beforeend", HTML) 
  })
})