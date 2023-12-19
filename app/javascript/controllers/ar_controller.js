import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ar"
export default class extends Controller {
  connect() {
    document.querySelector('a-marker').addEventListener('markerFound', function () {
      document.querySelector('#video').play();
    });

    setInterval(function() {
      const marker = document.querySelector('a-marker');
      const video = document.querySelector('#video');

      // Vérifiez si le marqueur est toujours trouvé
      if (marker.object3D.visible) {
        // Si le marqueur est toujours trouvé, assurez-vous que la vidéo est en cours de lecture
        if (video.paused) {
          video.play();
        }
      } else {
        // Si le marqueur n'est plus trouvé, mettez en pause la vidéo
        video.pause();
      }
    }, 1000);
  }
}
