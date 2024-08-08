// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["map"]

  connect() {
    mapboxgl.accessToken = '<YOUR_MAPBOX_ACCESS_TOKEN>';
    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/mapbox/streets-v11',
      zoom: 12
    });

    navigator.geolocation.getCurrentPosition(
      this.userLocationSuccess.bind(this),
      this.userLocationError.bind(this),
      { enableHighAccuracy: true }
    );

    this.fetchUserLocations();
  }

  userLocationSuccess(position) {
    const userCoords = [position.coords.longitude, position.coords.latitude];

    this.map.setCenter(userCoords);

    new mapboxgl.Marker({ color: "blue" })
      .setLngLat(userCoords)
      .setPopup(new mapboxgl.Popup().setText("You are here"))
      .addTo(this.map);
  }

  userLocationError(error) {
    console.error("Error getting user's location:", error);
  }

  fetchUserLocations() {
    fetch('/users/locations')
      .then(response => response.json())
      .then(users => {
        users.forEach(user => {
          const userCoords = [user.longitude, user.latitude];
          new mapboxgl.Marker({ color: "red" })
            .setLngLat(userCoords)
            .setPopup(new mapboxgl.Popup().setText(user.name))
            .addTo(this.map);
        });
      })
      .catch(error => console.error("Error fetching user locations:", error));
  }
}
