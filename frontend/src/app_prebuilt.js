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


var categories_managementzones = {"1": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(51,160,44,1.0)"})
                        })
                        ],
"2": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(31,120,180,1.0)"})
                        })
                        ],
"3": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(253,191,111,1.0)"})
                        })
                        ]};var categoriesSelected_managementzones = {"1": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ],
"2": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ],
"3": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]};
                    var textStyleCache_managementzones={}
                    var clusterStyleCache_managementzones={}
                    var style_managementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categories_managementzones[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_managementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categoriesSelected_managementzones[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };

                    var textStyleCache_samplingsites={}
                    var clusterStyleCache_samplingsites={}
                    var style_samplingsites = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(0,0,0,1.0)"})})
                        })
                        ];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_samplingsites = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})})
                        })
                        ]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_outliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(227,26,28,1.0)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(204,255,0,1.0)"}), angle: 0})
                        })
                        ]};var categoriesSelected_outliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ]};
                    var textStyleCache_outliers={}
                    var clusterStyleCache_outliers={}
                    var style_outliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categories_outliers[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_outliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categoriesSelected_outliers[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var baseLayers = [new ol.layer.Tile({
                        type: 'base',
                        title: 'No base layer'
                    }),new ol.layer.Tile({
    type: 'base',
    title: 'ESRI world imagery',
    source: new ol.source.XYZ({
        attributions: [new ol.Attribution({ html:['Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community']})],
        url: 'http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'
    }),
    projection: 'EPSG:3857'
})
,new ol.layer.Tile({
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
var lyr_21668_teun_huupvdvelden_hemelrijkst_msp_index_ndvi = new ol.layer.Image({
                                opacity: 1.0,
                                 
                                title: "2016-06-08_teun_huupvdvelden_hemelrijkst_msp_index_ndvi",
                                id: "2016_06_08_teun_huupvdvelden_hemelrijkst_msp_index_ndvi20160624165315080",
                                timeInfo: null,
                                source: new ol.source.ImageStatic({
                                   url: "./data/21668_teun_huupvdvelden_hemelrijkst_msp_index_ndvi.jpg",
                                    projection: "EPSG:3857",
                                    alwaysInRange: true,
                                    imageSize: [3719, 3292],
                                    imageExtent: [637890.696536, 6732636.582829, 638684.672422, 6733289.777242]
                                })
                            });
window.wfsCallback_managementzones = function(jsonData) {
                        wfsSource_managementzones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_managementzones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:msp_zones&outputFormat=text/javascript&format_options=callback:wfsCallback_managementzones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_managementzones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_managementzones,  
                            style: style_managementzones,
                            selectedStyle: selectionStyle_managementzones,
                            title: "Management zones",
                            id: "rgic01_msp_zones20160624163346030",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:msp_zones',
                    geometryType: 'MultiPolygon',
                    geometryName: 'the_geom',
                    url: 'http://localhost:8082/geoserver/ows'
                  },
                  isWFST:true,
                            filters: [],
                            timeInfo: null,
                            isSelectable: true,
                            popupInfo: ""
                        });
window.wfsCallback_samplingsites = function(jsonData) {
                        wfsSource_samplingsites.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_samplingsites = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_hemelrijkst_msp_samples&outputFormat=text/javascript&format_options=callback:wfsCallback_samplingsites' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_samplingsites = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_samplingsites,  
                            style: style_samplingsites,
                            selectedStyle: selectionStyle_samplingsites,
                            title: "Sampling sites",
                            id: "rgic01_teun_hemelrijkst_msp_samples20160624163547640",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:teun_hemelrijkst_msp_samples',
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
window.wfsCallback_outliers = function(jsonData) {
                        wfsSource_outliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_outliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_huupvdvelden_hemelrijkst_msp_outliers&outputFormat=text/javascript&format_options=callback:wfsCallback_outliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_outliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_outliers,  
                            style: style_outliers,
                            selectedStyle: selectionStyle_outliers,
                            title: "Outliers",
                            id: "rgic01_teun_huupvdvelden_hemelrijkst_msp_outliers20160624163614265",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:teun_huupvdvelden_hemelrijkst_msp_outliers',
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

lyr_21668_teun_huupvdvelden_hemelrijkst_msp_index_ndvi.setVisible(true);
lyr_managementzones.setVisible(true);
lyr_samplingsites.setVisible(true);
lyr_outliers.setVisible(true);for (var i=0;i<baseLayers.length;i++){baseLayers[i].setVisible(false);}baseLayers[1].setVisible(true);
var layersList = [lyr_21668_teun_huupvdvelden_hemelrijkst_msp_index_ndvi,lyr_managementzones,lyr_samplingsites,lyr_outliers];layersList.unshift(baseLayersGroup);
var legendData = {"rgic01_msp_zones20160624163346030": [{"href": "1_0.png", "title": "1"}, {"href": "1_1.png", "title": "2"}, {"href": "1_2.png", "title": "3"}], "rgic01_teun_hemelrijkst_msp_samples20160624163547640": [{"href": "2_0.png", "title": ""}], "rgic01_teun_huupvdvelden_hemelrijkst_msp_outliers20160624163614265": [{"href": "3_0.png", "title": "Higher"}, {"href": "3_1.png", "title": "Lower"}]};
var view = new ol.View({ maxZoom: 32, minZoom: 1, projection: 'EPSG:3857'});
var originalExtent = [638034.092991, 6732793.200678, 638614.268334, 6733143.282311];

var map = new ol.Map({
  layers: layersList,
  view: view,
  controls: [new ol.control.FullScreen(),
new ol.control.Attribution(),
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
{exclude: true, jsx: React.createElement("a", {className:"navbar-brand", href:"#"}, "RGIC01 test01")}];
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
                                          React.createElement(FeatureTable, {offset: [20, 20], ref: 'table', resizeTo: 'table-panel', layer: lyr_managementzones, pointZoom:16, map: map})
                                    ),
React.createElement("div",{id: "layerlist"},
                                    React.createElement(LayerList, {showOpacity:false, showDownload:false,
                                        showGroupContent:true, showZoomTo:false, allowReordering:false,
                                        allowFiltering:true, tipLabel:'layers', expandOnHover:true,
                                        downloadFormat:'GeoJSON', map:map})),
React.createElement("div", {id:'geolocation-control', className:'ol-unselectable ol-control'},
                                    React.createElement(Geolocation, {map:map})
                                  ),
 React.createElement("div", {id: 'wfst', ref: 'wfstPanel'},
                                      React.createElement(WFST, {map: map})
                                    ),
React.createElement("div",{id: "legend"},
                                React.createElement(QGISLegend, {map:map, legendBasePath:'./resources/legend/',showExpandedOnStartup:false, expandOnHover:true, legendData:legendData})
                            )
      )
    );
  }
});

ReactDOM.render(React.createElement(IntlProvider, {locale: 'en'}, React.createElement(BasicApp)), document.getElementById('main'));


