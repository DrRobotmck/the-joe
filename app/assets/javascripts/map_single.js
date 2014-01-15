function mapSingle(shop, address){
  function initialize() {
    function singleGeocode(addressed) {
      geocoder.geocode({'address': addressed},function(response){
        map.setCenter(new google.maps.LatLng(response[0].geometry.location.b,response[0].geometry.location.d));
      })
    };
    var geocoder = new google.maps.Geocoder;
    google.maps.visualRefresh = true;
    var isMobile = (navigator.userAgent.toLowerCase().indexOf('android') > -1) ||
    (navigator.userAgent.match(/(iPod|iPhone|iPad|BlackBerry|Windows Phone|iemobile)/));
    if (isMobile) {
      var viewport = document.querySelector("meta[name=viewport]");
      viewport.setAttribute('content', 'initial-scale=1.0, user-scalable=no');
    }
    var mapDiv = document.getElementById('googft-mapCanvas');
    mapDiv.style.width = isMobile ? '100%' : '100%';
    mapDiv.style.height = isMobile ? '300px' : '300px';


    var map = new google.maps.Map(mapDiv, {
      center: singleGeocode(address),
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    var style = [
    {
      featureType: 'landscape',
      elementType: 'all',
      stylers: [
      {
       color:"#948d98" }
       ]
     },
     {
      featureType: 'administrative.country',
      elementType: 'all',
      stylers: [
      { visibility: 'off' }
      ]
    },
    {
      featureType: 'administrative.province',
      elementType: 'all',
      stylers: [
      { visibility: 'off' }
      ]
    },
    {
      featureType: 'administrative.locality',
      elementType: 'all',
      stylers: [
      { visibility: 'off' }
      ]
    },
    {
      featureType: 'administrative.land_parcel',
      elementType: 'all',
      stylers: [
      { visibility: 'off' }
      ]
    },
    {
      featureType: 'poi',
      elementType: 'all',
      stylers: [
      { visibility: 'off'}
      ]
    },
    {
      featureType: 'transit.line',
      elementType: 'all',
      stylers: [
      { color: "#E9D1BE"}
      ]
    },
    {
      featureType: 'transit.station',
      elementType: 'all',
      stylers: [
      { visibility: 'off'}
      ]
    },
    {
      featureType: 'water',
      elementType: 'all',
      stylers: [
      { color: "#f4f3f9"}
      ]
    }
    ];
    map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(document.getElementById('googft-legend-open'));
    map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(document.getElementById('googft-legend'));

    layer = new google.maps.FusionTablesLayer({
      map: map,
      heatmap: { enabled: false },
      query: {
        select: "col6",
        from: "1bf4GLLf6NEs4Qp9Mw5MqjPgg1MvIzCxhCDWk_iY",
        where: "'Address' CONTAINS IGNORING CASE '" + shop + "'"
      },
      options: {
        styleId: 4,
        templateId: 5
      }
    });

    if (isMobile) {
      var legend = document.getElementById('googft-legend');
      var legendOpenButton = document.getElementById('googft-legend-open');
      var legendCloseButton = document.getElementById('googft-legend-close');
      legend.style.display = 'none';
      legendOpenButton.style.display = 'block';
      legendCloseButton.style.display = 'block';
      legendOpenButton.onclick = function() {
        legend.style.display = 'block';
        legendOpenButton.style.display = 'none';
      }
      legendCloseButton.onclick = function() {
        legend.style.display = 'none';
        legendOpenButton.style.display = 'block';
      }
    }
    
    var styledMapType = new google.maps.StyledMapType(style, {
      map: map,
      name: 'Styled Map'
    });
    map.mapTypes.set('map-style', styledMapType);
    map.setMapTypeId('map-style');
  }
  // function changeMap_0() {
  //   var whereClause;
  //   var searchString = document.getElementById('search-string_0').value.replace(/'/g, "\\'");
  //   if (searchString != '--Select--') {
  //     whereClause = "'Name' CONTAINS IGNORING CASE '" + searchString + "'";
  //   }
  //   layer.setOptions({
  //     query: {
  //       select: "col6",
  //       from: "1bf4GLLf6NEs4Qp9Mw5MqjPgg1MvIzCxhCDWk_iY",
  //       where: whereClause
  //     }
  //   });
  // }
  google.maps.event.addDomListener(window, 'load', initialize);
  initialize();
}