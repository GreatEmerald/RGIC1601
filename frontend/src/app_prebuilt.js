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


var categories_teunhemelrijkstmspzones = {"1": [ new ol.style.Style({
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
                        ]};var categoriesSelected_teunhemelrijkstmspzones = {"1": [ new ol.style.Style({
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
                    var textStyleCache_teunhemelrijkstmspzones={}
                    var clusterStyleCache_teunhemelrijkstmspzones={}
                    var style_teunhemelrijkstmspzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categories_teunhemelrijkstmspzones[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_teunhemelrijkstmspzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categoriesSelected_teunhemelrijkstmspzones[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_teunhemelrijkstmspoutliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(227,26,28,1.0)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(204,255,0,1.0)"}), angle: 0})
                        })
                        ]};var categoriesSelected_teunhemelrijkstmspoutliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ]};
                    var textStyleCache_teunhemelrijkstmspoutliers={}
                    var clusterStyleCache_teunhemelrijkstmspoutliers={}
                    var style_teunhemelrijkstmspoutliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categories_teunhemelrijkstmspoutliers[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_teunhemelrijkstmspoutliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categoriesSelected_teunhemelrijkstmspoutliers[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };

                    var textStyleCache_teunhemelrijkstmspsamples={}
                    var clusterStyleCache_teunhemelrijkstmspsamples={}
                    var style_teunhemelrijkstmspsamples = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(0,0,0,1.0)"})})
                        })
                        ];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_teunhemelrijkstmspsamples = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})})
                        })
                        ]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_teunintersnacka1zones = {"1": [ new ol.style.Style({
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
                        ]};var categoriesSelected_teunintersnacka1zones = {"1": [ new ol.style.Style({
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
                    var textStyleCache_teunintersnacka1zones={}
                    var clusterStyleCache_teunintersnacka1zones={}
                    var style_teunintersnacka1zones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categories_teunintersnacka1zones[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_teunintersnacka1zones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categoriesSelected_teunintersnacka1zones[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_teunintersnacka1outliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(227,26,28,1.0)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(204,255,0,1.0)"}), angle: 0})
                        })
                        ]};var categoriesSelected_teunintersnacka1outliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ]};
                    var textStyleCache_teunintersnacka1outliers={}
                    var clusterStyleCache_teunintersnacka1outliers={}
                    var style_teunintersnacka1outliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categories_teunintersnacka1outliers[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_teunintersnacka1outliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categoriesSelected_teunintersnacka1outliers[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_bertboermakalegrondzones = {"1": [ new ol.style.Style({
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
                        ]};var categoriesSelected_bertboermakalegrondzones = {"1": [ new ol.style.Style({
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
                    var textStyleCache_bertboermakalegrondzones={}
                    var clusterStyleCache_bertboermakalegrondzones={}
                    var style_bertboermakalegrondzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categories_bertboermakalegrondzones[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_bertboermakalegrondzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categoriesSelected_bertboermakalegrondzones[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_bertboermakalegrondoutliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(227,26,28,1.0)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(204,255,0,1.0)"}), angle: 0})
                        })
                        ]};var categoriesSelected_bertboermakalegrondoutliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ]};
                    var textStyleCache_bertboermakalegrondoutliers={}
                    var clusterStyleCache_bertboermakalegrondoutliers={}
                    var style_bertboermakalegrondoutliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categories_bertboermakalegrondoutliers[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_bertboermakalegrondoutliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categoriesSelected_bertboermakalegrondoutliers[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };

                    var textStyleCache_bertboermakalegrondsamples={}
                    var clusterStyleCache_bertboermakalegrondsamples={}
                    var style_bertboermakalegrondsamples = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(0,0,0,1.0)"})})
                        })
                        ];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_bertboermakalegrondsamples = function(feature, resolution){
                        
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
,new ol.layer.Tile({
    type: 'base',
    title: 'ESRI world imagery',
    source: new ol.source.XYZ({
        attributions: [new ol.Attribution({ html:['Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community']})],
        url: 'http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'
    }),
    projection: 'EPSG:3857'
})
];var baseLayersGroup = new ol.layer.Group({showContent: true,'type':
                    'base-group', 'title': 'Base maps', layers: baseLayers});
var overlayLayers = [];var overlaysGroup = new ol.layer.Group({showContent: true, 'title': 'Overlays', layers: overlayLayers});
window.wfsCallback_teunhemelrijkstmspzones = function(jsonData) {
                        wfsSource_teunhemelrijkstmspzones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_teunhemelrijkstmspzones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:msp_zones&outputFormat=text/javascript&format_options=callback:wfsCallback_teunhemelrijkstmspzones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_teunhemelrijkstmspzones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_teunhemelrijkstmspzones,  
                            style: style_teunhemelrijkstmspzones,
                            selectedStyle: selectionStyle_teunhemelrijkstmspzones,
                            title: "Teun Hemelrijkst msp (zones)",
                            id: "rgic01_msp_zones20160627102540352",
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
window.wfsCallback_teunhemelrijkstmspoutliers = function(jsonData) {
                        wfsSource_teunhemelrijkstmspoutliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_teunhemelrijkstmspoutliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_huupvdvelden_hemelrijkst_msp_outliers&outputFormat=text/javascript&format_options=callback:wfsCallback_teunhemelrijkstmspoutliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_teunhemelrijkstmspoutliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_teunhemelrijkstmspoutliers,  
                            style: style_teunhemelrijkstmspoutliers,
                            selectedStyle: selectionStyle_teunhemelrijkstmspoutliers,
                            title: "Teun Hemelrijkst msp (outliers)",
                            id: "rgic01_teun_huupvdvelden_hemelrijkst_msp_outliers20160627102540738",
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
window.wfsCallback_teunhemelrijkstmspsamples = function(jsonData) {
                        wfsSource_teunhemelrijkstmspsamples.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_teunhemelrijkstmspsamples = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_hemelrijkst_msp_samples&outputFormat=text/javascript&format_options=callback:wfsCallback_teunhemelrijkstmspsamples' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_teunhemelrijkstmspsamples = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_teunhemelrijkstmspsamples,  
                            style: style_teunhemelrijkstmspsamples,
                            selectedStyle: selectionStyle_teunhemelrijkstmspsamples,
                            title: "Teun Hemelrijkst msp (samples)",
                            id: "rgic01_teun_hemelrijkst_msp_samples20160627102540624",
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
window.wfsCallback_teunintersnacka1zones = function(jsonData) {
                        wfsSource_teunintersnacka1zones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_teunintersnacka1zones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_intersnack_a1_zones_06&outputFormat=text/javascript&format_options=callback:wfsCallback_teunintersnacka1zones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_teunintersnacka1zones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_teunintersnacka1zones,  
                            style: style_teunintersnacka1zones,
                            selectedStyle: selectionStyle_teunintersnacka1zones,
                            title: "Teun intersnack a1 (zones)",
                            id: "rgic01_teun_intersnack_a1_zones_0620160627101117973",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:teun_intersnack_a1_zones_06',
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
window.wfsCallback_teunintersnacka1outliers = function(jsonData) {
                        wfsSource_teunintersnacka1outliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_teunintersnacka1outliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_intersnack_a1_outliers_06&outputFormat=text/javascript&format_options=callback:wfsCallback_teunintersnacka1outliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_teunintersnacka1outliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_teunintersnacka1outliers,  
                            style: style_teunintersnacka1outliers,
                            selectedStyle: selectionStyle_teunintersnacka1outliers,
                            title: "Teun intersnack a1 (outliers)",
                            id: "rgic01_teun_intersnack_a1_outliers_0620160627101117649",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:teun_intersnack_a1_outliers_06',
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
window.wfsCallback_bertboermakalegrondzones = function(jsonData) {
                        wfsSource_bertboermakalegrondzones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_bertboermakalegrondzones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:bert_boerma_kale_grond_zones&outputFormat=text/javascript&format_options=callback:wfsCallback_bertboermakalegrondzones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_bertboermakalegrondzones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_bertboermakalegrondzones,  
                            style: style_bertboermakalegrondzones,
                            selectedStyle: selectionStyle_bertboermakalegrondzones,
                            title: "Bert Boerma kale grond (zones)",
                            id: "rgic01_bert_boerma_kale_grond_zones20160627104056741",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:bert_boerma_kale_grond_zones',
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
window.wfsCallback_bertboermakalegrondoutliers = function(jsonData) {
                        wfsSource_bertboermakalegrondoutliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_bertboermakalegrondoutliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:bert_boerma_kale_grond_outliers&outputFormat=text/javascript&format_options=callback:wfsCallback_bertboermakalegrondoutliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_bertboermakalegrondoutliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_bertboermakalegrondoutliers,  
                            style: style_bertboermakalegrondoutliers,
                            selectedStyle: selectionStyle_bertboermakalegrondoutliers,
                            title: "Bert Boerma kale grond (outliers)",
                            id: "rgic01_bert_boerma_kale_grond_outliers20160627104056107",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:bert_boerma_kale_grond_outliers',
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
window.wfsCallback_bertboermakalegrondsamples = function(jsonData) {
                        wfsSource_bertboermakalegrondsamples.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_bertboermakalegrondsamples = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:bert_boerma_kale_grond_samples&outputFormat=text/javascript&format_options=callback:wfsCallback_bertboermakalegrondsamples' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_bertboermakalegrondsamples = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_bertboermakalegrondsamples,  
                            style: style_bertboermakalegrondsamples,
                            selectedStyle: selectionStyle_bertboermakalegrondsamples,
                            title: "Bert Boerma kale grond (samples)",
                            id: "rgic01_bert_boerma_kale_grond_samples20160627104056421",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:bert_boerma_kale_grond_samples',
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

lyr_teunhemelrijkstmspzones.setVisible(true);
lyr_teunhemelrijkstmspoutliers.setVisible(true);
lyr_teunhemelrijkstmspsamples.setVisible(true);
lyr_teunintersnacka1zones.setVisible(true);
lyr_teunintersnacka1outliers.setVisible(true);
lyr_bertboermakalegrondzones.setVisible(true);
lyr_bertboermakalegrondoutliers.setVisible(true);
lyr_bertboermakalegrondsamples.setVisible(true);for (var i=0;i<baseLayers.length;i++){baseLayers[i].setVisible(false);}baseLayers[1].setVisible(true);
var layersList = [lyr_teunhemelrijkstmspzones,lyr_teunhemelrijkstmspoutliers,lyr_teunhemelrijkstmspsamples,lyr_teunintersnacka1zones,lyr_teunintersnacka1outliers,lyr_bertboermakalegrondzones,lyr_bertboermakalegrondoutliers,lyr_bertboermakalegrondsamples];layersList.unshift(baseLayersGroup);
var legendData = {"rgic01_teun_intersnack_a1_zones_0620160627101117973": [{"href": "3_0.png", "title": "1"}, {"href": "3_1.png", "title": "2"}, {"href": "3_2.png", "title": "3"}], "rgic01_teun_hemelrijkst_msp_samples20160627102540624": [{"href": "2_0.png", "title": ""}], "rgic01_bert_boerma_kale_grond_outliers20160627104056107": [{"href": "6_0.png", "title": "Higher"}, {"href": "6_1.png", "title": "Lower"}], "rgic01_teun_intersnack_a1_outliers_0620160627101117649": [{"href": "4_0.png", "title": "Higher"}, {"href": "4_1.png", "title": "Lower"}], "rgic01_msp_zones20160627102540352": [{"href": "0_0.png", "title": "1"}, {"href": "0_1.png", "title": "2"}, {"href": "0_2.png", "title": "3"}], "rgic01_bert_boerma_kale_grond_samples20160627104056421": [{"href": "7_0.png", "title": ""}], "rgic01_bert_boerma_kale_grond_zones20160627104056741": [{"href": "5_0.png", "title": "1"}, {"href": "5_1.png", "title": "2"}, {"href": "5_2.png", "title": "3"}], "rgic01_teun_huupvdvelden_hemelrijkst_msp_outliers20160627102540738": [{"href": "1_0.png", "title": "Higher"}, {"href": "1_1.png", "title": "Lower"}]};
var view = new ol.View({ maxZoom: 32, minZoom: 1, projection: 'EPSG:3857'});
var originalExtent = [622017.262389, 6637436.364606, 737151.935898, 6881342.006455];

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
                                          React.createElement(FeatureTable, {offset: [20, 20], ref: 'table', resizeTo: 'table-panel', layer: lyr_teunhemelrijkstmspzones, pointZoom:16, map: map})
                                    ),
React.createElement("div",{id: "layerlist"},
                                    React.createElement(LayerList, {showOpacity:false, showDownload:false,
                                        showGroupContent:true, showZoomTo:false, allowReordering:false,
                                        allowFiltering:true, tipLabel:'layers', expandOnHover:true,
                                        downloadFormat:'GeoJSON', map:map})),
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


