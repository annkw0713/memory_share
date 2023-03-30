document.addEventListener("turbolinks:load", function() {
  const input = document.querySelector('input[type="file"]');
  const previewList = document.querySelector('#previews');
  
  input.addEventListener("change", (event) => {
    const alreadyPreview = document.querySelector(".preview");
    if (alreadyPreview) {
      alreadyPreview.remove();
    };

    const file = event.target.files[0];
    const blob = URL.createObjectURL(file);

    const previewWrapper = document.createElement("div");
    previewWrapper.setAttribute("class", "preview");

    const previewImage = document.createElement("img");
    previewImage.setAttribute("class", "preview-image");
    previewImage.setAttribute("src", blob);
    previewImage.setAttribute("width", "200");

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});

