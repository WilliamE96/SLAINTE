import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static targets = ["map"]

  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  // #addMarkersToMap() {
  //   this.markersValue.forEach((marker) => {
  //     new mapboxgl.Marker()
  //       .setLngLat([ marker.lng, marker.lat ])
  //       .addTo(this.map)
  //   })
  // }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const el = document.createElement('a');
      el.href = `${window.location.origin}/posts/${marker.id}`;
      el.target = '_blank';

      el.className = 'marker';
      el.style.width = '30px';
      el.style.height = '30px';
      el.style.backgroundImage = 'url(https://cdn-icons-png.flaticon.com/512/3362/3362651.png)';
      el.style.backgroundSize = 'cover';

      // Create the marker using the custom element
      new mapboxgl.Marker(el)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
}

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}

// orange-circle-1462825_1280.png
