document.addEventListener('turbolinks:load', function() {
  const preview = document.querySelector('#preview');
  if (preview) {
    preview.remove();
  }
  const input = document.querySelector('#memory_movie');
  if (input) {
    input.addEventListener('change', function() {
      if (this.files && this.files[0]) {
        const video = document.createElement('video');
        video.setAttribute('id', 'preview');
        video.setAttribute('width', '200');
        video.setAttribute('height', '200');
        video.setAttribute('controls', '');
        const src = URL.createObjectURL(this.files[0]);
        video.src = src;
        const previews = document.querySelector('#previews-movie');
        previews.innerHTML = '';
        previews.appendChild(video);
      } else {
        const preview = document.querySelector('#preview');
        if (preview) {
          preview.remove();
        }
      }
    });
  }
});