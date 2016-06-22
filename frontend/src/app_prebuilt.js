var defaultFill = new ol.style.Fill({
   color: 'rgba(255,255,255,0.4)'
 });
 var defaultStroke = new ol.style.Stroke({
   color: '#3399CC',
   width: 1.25
 });
 var defaultSelectionFill = new ol.style.Fill({
   color: 'rgba(255,255,0,0.4)'
 });
 var defaultSelectionStroke = new ol.style.Stroke({
   color: '#FFFF00',
   width: 1.25
 });


var ranges_rgic1zones = [[0.079569, 0.080000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(153,52,4,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.080000, 0.100000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(178,69,7,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.100000, 0.120000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(204,86,11,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.120000, 0.140000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(224,106,19,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.140000, 0.160000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(239,129,30,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.160000, 0.180000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(254,153,41,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.180000, 0.200000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(254,178,81,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.200000, 0.220000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(254,204,121,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.220000, 0.240000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(254,224,156,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.240000, 0.260000,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(254,239,184,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]],
[0.260000, 0.266982,
 [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255,255,212,1.0)"})
                        })
                        ], [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]]];
                    var textStyleCache_rgic1zones={}
                    var clusterStyleCache_rgic1zones={}
                    var style_rgic1zones = function(feature, resolution){
                        
                        var value = feature.get("vimeans");
                        var style = ranges_rgic1zones[0][2];
                            for (var i = 0, ii = ranges_rgic1zones.length; i < ii; i++){
                                var range = ranges_rgic1zones[i];
                                if (value > range[0] && value<=range[1]){
                                    style = range[2];
                                    break;
                                }
                            }
                            
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_rgic1zones = function(feature, resolution){
                        
                        var value = feature.get("vimeans");
                        var style = ranges_rgic1zones[0][3];
                            for (var i = 0; i < ranges_rgic1zones.length; i++){
                                var range = ranges_rgic1zones[i];
                                if (value > range[0] && value<=range[1]){
                                    style = range[3];
                                    break;
                                }
                            }
                            
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };

                    var textStyleCache_rgic1outliers={}
                    var clusterStyleCache_rgic1outliers={}
                    var style_rgic1outliers = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(227,26,28,1.0)"})})
                        })
                        ];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_rgic1outliers = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})})
                        })
                        ]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };

                    var textStyleCache_rgic1samples={}
                    var clusterStyleCache_rgic1samples={}
                    var style_rgic1samples = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(0,0,0,1.0)"})})
                        })
                        ];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_rgic1samples = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})})
                        })
                        ]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var baseLayers = [new ol.layer.Tile({
                        type: 'base',
                        title: 'No base layer'
                    }),new ol.layer.Tile({
    type: 'base',
    title: 'CartoDB light',
    source: new ol.source.XYZ({
        url: 'http://s.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
        attributions: [new ol.Attribution({ html: ['&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, &copy; <a href="http://cartodb.com/attributions">CartoDB</a>']
        })]
    }),
    projection: 'EPSG:3857'
})
];var baseLayersGroup = new ol.layer.Group({showContent: true,'type':
                    'base-group', 'title': 'Base maps', layers: baseLayers});
var overlayLayers = [];var overlaysGroup = new ol.layer.Group({showContent: true, 'title': 'Overlays', layers: overlayLayers});
window.wfsCallback_rgic1zones = function(jsonData) {
                        wfsSource_rgic1zones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_rgic1zones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:zones&outputFormat=text/javascript&format_options=callback:wfsCallback_rgic1zones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_rgic1zones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_rgic1zones,  
                            style: style_rgic1zones,
                            selectedStyle: selectionStyle_rgic1zones,
                            title: "rgic01:zones",
                            id: "rgic01_zones20160622104027996",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:zones',
                    geometryType: 'Polygon',
                    geometryName: 'the_geom',
                    url: 'http://localhost:8082/geoserver/ows'
                  },
                  isWFST:true,
                            filters: [],
                            timeInfo: null,
                            isSelectable: true,
                            popupInfo: ""
                        });
window.wfsCallback_rgic1outliers = function(jsonData) {
                        wfsSource_rgic1outliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_rgic1outliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:outliers&outputFormat=text/javascript&format_options=callback:wfsCallback_rgic1outliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_rgic1outliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_rgic1outliers,  
                            style: style_rgic1outliers,
                            selectedStyle: selectionStyle_rgic1outliers,
                            title: "rgic01:outliers",
                            id: "rgic01_outliers20160622104027302",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:outliers',
                    geometryType: 'Point',
                    geometryName: 'the_geom',
                    url: 'http://localhost:8082/geoserver/ows'
                  },
                  isWFST:true,
                            filters: [],
                            timeInfo: null,
                            isSelectable: true,
                            popupInfo: ""
                        });
window.wfsCallback_rgic1samples = function(jsonData) {
                        wfsSource_rgic1samples.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_rgic1samples = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:samples&outputFormat=text/javascript&format_options=callback:wfsCallback_rgic1samples' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_rgic1samples = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_rgic1samples,  
                            style: style_rgic1samples,
                            selectedStyle: selectionStyle_rgic1samples,
                            title: "rgic01:samples",
                            id: "rgic01_samples20160622104027724",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:samples',
                    geometryType: 'Point',
                    geometryName: 'the_geom',
                    url: 'http://localhost:8082/geoserver/ows'
                  },
                  isWFST:true,
                            filters: [],
                            timeInfo: null,
                            isSelectable: true,
                            popupInfo: ""
                        });

lyr_rgic1zones.setVisible(true);
lyr_rgic1outliers.setVisible(true);
lyr_rgic1samples.setVisible(true);for (var i=0;i<baseLayers.length;i++){baseLayers[i].setVisible(false);}baseLayers[1].setVisible(true);
var layersList = [lyr_rgic1zones,lyr_rgic1outliers,lyr_rgic1samples];layersList.unshift(baseLayersGroup);
var legendData = {"rgic01_zones20160622104027996": [{"href": "0_0.png", "title": "0.0795685386235-0.08"}, {"href": "0_1.png", "title": "0.08-0.1"}, {"href": "0_2.png", "title": "0.1-0.12"}, {"href": "0_3.png", "title": "0.12-0.14"}, {"href": "0_4.png", "title": "0.14-0.16"}, {"href": "0_5.png", "title": "0.16-0.18"}, {"href": "0_6.png", "title": "0.18-0.2"}, {"href": "0_7.png", "title": "0.2-0.22"}, {"href": "0_8.png", "title": "0.22-0.24"}, {"href": "0_9.png", "title": "0.24-0.26"}, {"href": "0_10.png", "title": "0.26-0.266981692919"}], "rgic01_outliers20160622104027302": [{"href": "1_0.png", "title": ""}], "rgic01_samples20160622104027724": [{"href": "2_0.png", "title": ""}]};
var view = new ol.View({ maxZoom: 32, minZoom: 1, projection: 'EPSG:3857'});
var originalExtent = [621452.415639, 6879754.340171, 624596.024535, 6881657.419957];

var map = new ol.Map({
  layers: layersList,
  view: view,
  controls: [new ol.control.Attribution(),
new ol.control.ScaleLine({"minWidth": 64, "units": "metric"}),
new ol.control.Rotate({autoHide: false}),
new ol.control.Zoom({"zoomOutTipLabel": "Zoom out", "zoomInTipLabel": "Zoom in", "delta": 1.2, "duration": 250, "zoomInLabel": "+", "zoomOutLabel": "-"})]
});



var BasicApp = React.createClass({
  componentDidMount() {
    map.setTarget(ReactDOM.findDOMNode(this.refs.map));
    view = map.getView();
    view.fit(originalExtent, map.getSize());
    
  },
  _toggle(el) {
    if (el.style.display === 'block') {
      el.style.display = 'none';
    } else {
      el.style.display = 'block';
    }
  },
  _toggleTable() {
    this._toggle(document.getElementById('table-panel'));
    this.refs.table.getWrappedInstance().setDimensionsOnState();
  },
  _toggleWFST() {
    this._toggle(document.getElementById('wfst'));
  },
  _toggleQuery() {
    this._toggle(document.getElementById('query-panel'));
  },
  _toggleEdit() {
    this._toggle(document.getElementById('edit-tool-panel'));
  },
  _toggleAboutPanel() {
    this._toggle(document.getElementById('about-panel'));
  },
  _toggleChartPanel(evt) {
    evt.preventDefault();
    this._toggle(document.getElementById('chart-panel'));
  },
  _navigationFunc() {
    ToolActions.activateTool(null, 'navigation');
  },
  render() {
    var options = [{text: 'Table', icon: 'list-alt', onClick: this._toggleTable.bind(this)},
{text: 'WFS-T', icon: 'pencil', onClick: this._toggleWFST.bind(this)},
{exclude: true, jsx: React.createElement("a", {className:"navbar-brand", href:"#"}, "RGIC01 demostrator app")}];
    return React.createElement("article", null,
      React.createElement(Toolbar, {options: options}
      ),
      React.createElement("div", {id: 'content'},
        React.createElement("div", {id: 'map', ref: 'map'}
          ,
React.createElement("div", {id: 'popup', className: 'ol-popup'},
                                    React.createElement(InfoPopup, {map: map, hover: false})
                                  )
        )
        ,
 React.createElement("div", {id: 'table-panel', className: 'attributes-table'},
                                          React.createElement(FeatureTable, {offset: [20, 20], ref: 'table', resizeTo: 'table-panel', layer: lyr_rgic1zones, pointZoom:16, map: map})
                                    ),
React.createElement("div", {id:'geolocation-control', className:'ol-unselectable ol-control'},
                                    React.createElement(Geolocation, {map:map})
                                  ),
React.createElement("div",{id: "legend"},
                                React.createElement(QGISLegend, {map:map, legendBasePath:'./resources/legend/',showExpandedOnStartup:false, expandOnHover:true, legendData:legendData})
                            ),
 React.createElement("div", {id: 'wfst', ref: 'wfstPanel'},
                                      React.createElement(WFST, {map: map})
                                    )
      )
    );
  }
});

ReactDOM.render(React.createElement(IntlProvider, {locale: 'en'}, React.createElement(BasicApp)), document.getElementById('main'));


