import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const initMapbox = () => {
const mapElement = document.getElementById('map');
const fitMapToMarkers = (map, location) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ location.lng, location.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        // Create a HTML element for your custom marker
        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '45px';
        element.style.height = '45px';

        // Pass the element as an argument to the new marker
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
    });
    const location = JSON.parse(mapElement.dataset.location);
    fitMapToMarkers(map, location);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
  }
};

export { initMapbox };
