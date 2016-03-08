$(function() {
    function createSidebarLi(json){
      return ("<li><a href='#'>" + json.name + "</a></li>");
    };

    function bindLiToMarker($li, marker){
      $li.on('click', function(){
        handler.getMap().setZoom(14);
        marker.setMap(handler.getMap());
        marker.panTo();
        google.maps.event.trigger(marker.getServiceObject(), 'click');
      })
    };

    function createSidebar(json_array){
      _.each(json_array, function(json){
        var $li = $( createSidebarLi(json) );
        $li.appendTo('#sidebar_container');
        bindLiToMarker($li, json.marker);
      });
    };

    handler = Gmaps.build('Google');
    handler.buildMap({ internal: {id: 'sidebar_builder'}}, function(){
      var json_array = [ // pass data from server
        { lat: 55.7254972, lng: 37.5691502, name: 'Foo', infowindow: "I'm Foo" },
        { lat: 55.6254972, lng: 37.5691502, name: 'Bar', infowindow: "I'm Bar" },
        { lat: 55.5254972, lng: 37.5691502, name: 'Baz', infowindow: "I'm Baz" }
      ];

      var markers = handler.addMarkers(json_array);

      _.each(json_array, function(json, index){
        json.marker = markers[index];
      });

      createSidebar(json_array);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
});