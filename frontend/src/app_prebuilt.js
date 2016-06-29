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


var categories_onionfieldhemelrijkstmanagementzones = {"3": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,0.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(33,112,57,1.0)"})
                        })
                        ],
"2": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,0.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(49,163,17,1.0)"})
                        })
                        ],
"1": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(128,152,72,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(186,228,148,1.0)"})
                        })
                        ]};var categoriesSelected_onionfieldhemelrijkstmanagementzones = {"3": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ],
"2": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ],
"1": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]};
                    var textStyleCache_onionfieldhemelrijkstmanagementzones={}
                    var clusterStyleCache_onionfieldhemelrijkstmanagementzones={}
                    var style_onionfieldhemelrijkstmanagementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categories_onionfieldhemelrijkstmanagementzones[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_onionfieldhemelrijkstmanagementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categoriesSelected_onionfieldhemelrijkstmanagementzones[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_onionfieldhemelrijkstoutliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(0,0,0,1.0)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(204,204,204,1.0)"}), angle: 0})
                        })
                        ]};var categoriesSelected_onionfieldhemelrijkstoutliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ]};
                    var textStyleCache_onionfieldhemelrijkstoutliers={}
                    var clusterStyleCache_onionfieldhemelrijkstoutliers={}
                    var style_onionfieldhemelrijkstoutliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categories_onionfieldhemelrijkstoutliers[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_onionfieldhemelrijkstoutliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categoriesSelected_onionfieldhemelrijkstoutliers[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };

                    var textStyleCache_onionfieldhemelrijkstsamplelocations={}
                    var clusterStyleCache_onionfieldhemelrijkstsamplelocations={}
                    var style_onionfieldhemelrijkstsamplelocations = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 5.7, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(43,140,190,1.0)"})})
                        })
                        ];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_onionfieldhemelrijkstsamplelocations = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 5.7, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})})
                        })
                        ]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_baresoilboermamanagementzones = {"2": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(153,52,4,1.0)"})
                        })
                        ],
"1": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(254,153,41,1.0)"})
                        })
                        ],
"3": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255,255,212,1.0)"})
                        })
                        ]};var categoriesSelected_baresoilboermamanagementzones = {"2": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ],
"1": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ],
"3": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})
                        })
                        ]};
                    var textStyleCache_baresoilboermamanagementzones={}
                    var clusterStyleCache_baresoilboermamanagementzones={}
                    var style_baresoilboermamanagementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categories_baresoilboermamanagementzones[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_baresoilboermamanagementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categoriesSelected_baresoilboermamanagementzones[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };

                    var textStyleCache_baresoilboermasamplelocations={}
                    var clusterStyleCache_baresoilboermasamplelocations={}
                    var style_baresoilboermasamplelocations = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 5.7, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(43,140,190,1.0)"})})
                        })
                        ];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_baresoilboermasamplelocations = function(feature, resolution){
                        
                        var value = "";
                        var style = [ new ol.style.Style({
                            image: new ol.style.Circle({radius: 5.7, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"})})
                        })
                        ]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_baresoilboermaoutliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(0,0,0,1.0)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(204,204,204,1.0)"}), angle: 0})
                        })
                        ]};var categoriesSelected_baresoilboermaoutliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ]};
                    var textStyleCache_baresoilboermaoutliers={}
                    var clusterStyleCache_baresoilboermaoutliers={}
                    var style_baresoilboermaoutliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categories_baresoilboermaoutliers[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_baresoilboermaoutliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categoriesSelected_baresoilboermaoutliers[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_fieldintersnack216622managementzones = {"1": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(128,152,72,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(49,163,17,1.0)"})
                        })
                        ],
"2": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,0.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(33,112,57,1.0)"})
                        })
                        ],
"3": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,0.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(186,228,148,1.0)"})
                        })
                        ]};var categoriesSelected_fieldintersnack216622managementzones = {"1": [ new ol.style.Style({
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
                    var textStyleCache_fieldintersnack216622managementzones={}
                    var clusterStyleCache_fieldintersnack216622managementzones={}
                    var style_fieldintersnack216622managementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categories_fieldintersnack216622managementzones[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_fieldintersnack216622managementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categoriesSelected_fieldintersnack216622managementzones[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_fieldintersnack216622outliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(0,0,0,1.0)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(204,204,204,1.0)"}), angle: 0})
                        })
                        ]};var categoriesSelected_fieldintersnack216622outliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ]};
                    var textStyleCache_fieldintersnack216622outliers={}
                    var clusterStyleCache_fieldintersnack216622outliers={}
                    var style_fieldintersnack216622outliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categories_fieldintersnack216622outliers[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_fieldintersnack216622outliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categoriesSelected_fieldintersnack216622outliers[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_fieldintersnack21666managementzones = {"1": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(128,152,72,1.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(33,112,57,1.0)"})
                        })
                        ],
"2": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,0.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(49,163,17,1.0)"})
                        })
                        ],
"3": [ new ol.style.Style({
                            stroke: new ol.style.Stroke({color: "rgba(0,0,0,0.0)", lineDash: null, width: 0}),
                        fill: new ol.style.Fill({color: "rgba(186,228,148,1.0)"})
                        })
                        ]};var categoriesSelected_fieldintersnack21666managementzones = {"1": [ new ol.style.Style({
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
                    var textStyleCache_fieldintersnack21666managementzones={}
                    var clusterStyleCache_fieldintersnack21666managementzones={}
                    var style_fieldintersnack21666managementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categories_fieldintersnack21666managementzones[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_fieldintersnack21666managementzones = function(feature, resolution){
                        
                        var value = feature.get("zone_number");
                        var style = categoriesSelected_fieldintersnack21666managementzones[value]
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
var categories_fieldintersnack21666outliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(0,0,0,1.0)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(204,204,204,1.0)"}), angle: 0})
                        })
                        ]};var categoriesSelected_fieldintersnack21666outliers = {"higher": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ],
"lower": [ new ol.style.Style({
                            image: new ol.style.RegularShape({points: 5, radius1: 7.6, radius2: 3.8, stroke: new ol.style.Stroke({color: "rgba(255, 204, 0, 1)", lineDash: null, width: 0}), fill: new ol.style.Fill({color: "rgba(255, 204, 0, 1)"}), angle: 0})
                        })
                        ]};
                    var textStyleCache_fieldintersnack21666outliers={}
                    var clusterStyleCache_fieldintersnack21666outliers={}
                    var style_fieldintersnack21666outliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categories_fieldintersnack21666outliers[value];
                        var allStyles = [];
                        
                        allStyles.push.apply(allStyles, style);
                        return allStyles;
                    };
                    var selectionStyle_fieldintersnack21666outliers = function(feature, resolution){
                        
                        var value = feature.get("extreme");
                        var style = categoriesSelected_fieldintersnack21666outliers[value]
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
window.wfsCallback_onionfieldhemelrijkstmanagementzones = function(jsonData) {
                        wfsSource_onionfieldhemelrijkstmanagementzones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_onionfieldhemelrijkstmanagementzones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:msp_zones&outputFormat=text/javascript&format_options=callback:wfsCallback_onionfieldhemelrijkstmanagementzones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_onionfieldhemelrijkstmanagementzones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_onionfieldhemelrijkstmanagementzones,  
                            style: style_onionfieldhemelrijkstmanagementzones,
                            selectedStyle: selectionStyle_onionfieldhemelrijkstmanagementzones,
                            title: "Onion field, Hemelrijkst (Management Zones)",
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
window.wfsCallback_onionfieldhemelrijkstoutliers = function(jsonData) {
                        wfsSource_onionfieldhemelrijkstoutliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_onionfieldhemelrijkstoutliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_huupvdvelden_hemelrijkst_msp_outliers&outputFormat=text/javascript&format_options=callback:wfsCallback_onionfieldhemelrijkstoutliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_onionfieldhemelrijkstoutliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_onionfieldhemelrijkstoutliers,  
                            style: style_onionfieldhemelrijkstoutliers,
                            selectedStyle: selectionStyle_onionfieldhemelrijkstoutliers,
                            title: "Onion field, Hemelrijkst (Outliers)",
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
window.wfsCallback_onionfieldhemelrijkstsamplelocations = function(jsonData) {
                        wfsSource_onionfieldhemelrijkstsamplelocations.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_onionfieldhemelrijkstsamplelocations = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_hemelrijkst_msp_samples&outputFormat=text/javascript&format_options=callback:wfsCallback_onionfieldhemelrijkstsamplelocations' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_onionfieldhemelrijkstsamplelocations = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_onionfieldhemelrijkstsamplelocations,  
                            style: style_onionfieldhemelrijkstsamplelocations,
                            selectedStyle: selectionStyle_onionfieldhemelrijkstsamplelocations,
                            title: "Onion field, Hemelrijkst (Sample Locations)",
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
window.wfsCallback_baresoilboermamanagementzones = function(jsonData) {
                        wfsSource_baresoilboermamanagementzones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_baresoilboermamanagementzones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:bert_boerma_kale_grond_zones&outputFormat=text/javascript&format_options=callback:wfsCallback_baresoilboermamanagementzones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_baresoilboermamanagementzones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_baresoilboermamanagementzones,  
                            style: style_baresoilboermamanagementzones,
                            selectedStyle: selectionStyle_baresoilboermamanagementzones,
                            title: "Bare soil, Boerma (Management Zones)",
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
window.wfsCallback_baresoilboermasamplelocations = function(jsonData) {
                        wfsSource_baresoilboermasamplelocations.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_baresoilboermasamplelocations = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:bert_boerma_kale_grond_samples&outputFormat=text/javascript&format_options=callback:wfsCallback_baresoilboermasamplelocations' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_baresoilboermasamplelocations = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_baresoilboermasamplelocations,  
                            style: style_baresoilboermasamplelocations,
                            selectedStyle: selectionStyle_baresoilboermasamplelocations,
                            title: "Bare soil, Boerma (Sample Locations)",
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
window.wfsCallback_baresoilboermaoutliers = function(jsonData) {
                        wfsSource_baresoilboermaoutliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_baresoilboermaoutliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:bert_boerma_kale_grond_outliers&outputFormat=text/javascript&format_options=callback:wfsCallback_baresoilboermaoutliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_baresoilboermaoutliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_baresoilboermaoutliers,  
                            style: style_baresoilboermaoutliers,
                            selectedStyle: selectionStyle_baresoilboermaoutliers,
                            title: "Bare soil, Boerma (Outliers)",
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
window.wfsCallback_fieldintersnack216622managementzones = function(jsonData) {
                        wfsSource_fieldintersnack216622managementzones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_fieldintersnack216622managementzones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:_2016_06_22_teun_intersnack_a1_zones&outputFormat=text/javascript&format_options=callback:wfsCallback_fieldintersnack216622managementzones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_fieldintersnack216622managementzones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_fieldintersnack216622managementzones,  
                            style: style_fieldintersnack216622managementzones,
                            selectedStyle: selectionStyle_fieldintersnack216622managementzones,
                            title: "Field, Intersnack (2016-06-22) (Management Zones)",
                            id: "rgic01__2016_06_22_teun_intersnack_a1_zones20160629145657979",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:_2016_06_22_teun_intersnack_a1_zones',
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
window.wfsCallback_fieldintersnack216622outliers = function(jsonData) {
                        wfsSource_fieldintersnack216622outliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_fieldintersnack216622outliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:_2016_06_22_teun_intersnack_a1_outliers&outputFormat=text/javascript&format_options=callback:wfsCallback_fieldintersnack216622outliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_fieldintersnack216622outliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_fieldintersnack216622outliers,  
                            style: style_fieldintersnack216622outliers,
                            selectedStyle: selectionStyle_fieldintersnack216622outliers,
                            title: "Field, Intersnack (2016-06-22) (Outliers)",
                            id: "rgic01__2016_06_22_teun_intersnack_a1_outliers20160629145657414",
                            wfsInfo: {featureNS: '',
                    typeName: 'rgic01:_2016_06_22_teun_intersnack_a1_outliers',
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
window.wfsCallback_fieldintersnack21666managementzones = function(jsonData) {
                        wfsSource_fieldintersnack21666managementzones.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_fieldintersnack21666managementzones = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_intersnack_a1_zones_06&outputFormat=text/javascript&format_options=callback:wfsCallback_fieldintersnack21666managementzones' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_fieldintersnack21666managementzones = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_fieldintersnack21666managementzones,  
                            style: style_fieldintersnack21666managementzones,
                            selectedStyle: selectionStyle_fieldintersnack21666managementzones,
                            title: "Field, Intersnack (2016-06-06) (Management Zones)",
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
window.wfsCallback_fieldintersnack21666outliers = function(jsonData) {
                        wfsSource_fieldintersnack21666outliers.addFeatures(new ol.format.GeoJSON().readFeatures(jsonData));
                    };
                    var wfsSource_fieldintersnack21666outliers = new ol.source.Vector({
                        format: new ol.format.GeoJSON(),
                        loader: function(extent, resolution, projection) {
                            var script = document.createElement('script');
                            script.src = 'http://localhost:8082/geoserver/ows?service=WFS&version=1.1.0&request=GetFeature' +
                                '&typename=rgic01:teun_intersnack_a1_outliers_06&outputFormat=text/javascript&format_options=callback:wfsCallback_fieldintersnack21666outliers' +
                                '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
                            document.head.appendChild(script);
                        },
                        strategy: ol.loadingstrategy.tile(new ol.tilegrid.createXYZ({maxZoom: 19}))
                    });
                    var lyr_fieldintersnack21666outliers = new ol.layer.Vector({
                            opacity: 1.0,
                            source: wfsSource_fieldintersnack21666outliers,  
                            style: style_fieldintersnack21666outliers,
                            selectedStyle: selectionStyle_fieldintersnack21666outliers,
                            title: "Field, Intersnack (2016-06-06) (Outliers)",
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
var group_baresoilboerma21643 = new ol.layer.Group({
                                layers: [lyr_baresoilboermamanagementzones,lyr_baresoilboermasamplelocations,lyr_baresoilboermaoutliers],
                                showContent: true,
                                title: "Bare soil, Boerma (2016-04-03)"});
var group_onionfieldhemelrijkst21668 = new ol.layer.Group({
                                layers: [lyr_onionfieldhemelrijkstmanagementzones,lyr_onionfieldhemelrijkstoutliers,lyr_onionfieldhemelrijkstsamplelocations],
                                showContent: true,
                                title: "Onion field, Hemelrijkst (2016-06-08)"});
var group_fieldintersnack216622 = new ol.layer.Group({
                                layers: [lyr_fieldintersnack216622managementzones,lyr_fieldintersnack216622outliers],
                                showContent: true,
                                title: "Field, Intersnack (2016-06-22)"});
var group_fieldintersnack21666 = new ol.layer.Group({
                                layers: [lyr_fieldintersnack21666managementzones,lyr_fieldintersnack21666outliers],
                                showContent: true,
                                title: "Field, Intersnack (2016-06-06)"});

lyr_onionfieldhemelrijkstmanagementzones.setVisible(true);
lyr_onionfieldhemelrijkstoutliers.setVisible(true);
lyr_onionfieldhemelrijkstsamplelocations.setVisible(true);
lyr_baresoilboermamanagementzones.setVisible(true);
lyr_baresoilboermasamplelocations.setVisible(true);
lyr_baresoilboermaoutliers.setVisible(true);
lyr_fieldintersnack216622managementzones.setVisible(true);
lyr_fieldintersnack216622outliers.setVisible(true);
lyr_fieldintersnack21666managementzones.setVisible(true);
lyr_fieldintersnack21666outliers.setVisible(true);for (var i=0;i<baseLayers.length;i++){baseLayers[i].setVisible(false);}baseLayers[1].setVisible(true);
var layersList = [group_onionfieldhemelrijkst21668,group_baresoilboerma21643,group_fieldintersnack216622,group_fieldintersnack21666];layersList.unshift(baseLayersGroup);
var legendData = {"rgic01_teun_intersnack_a1_zones_0620160627101117973": [{"href": "8_0.png", "title": "A"}, {"href": "8_1.png", "title": "B"}, {"href": "8_2.png", "title": "C"}], "rgic01__2016_06_22_teun_intersnack_a1_outliers20160629145657414": [{"href": "7_0.png", "title": "Higher"}, {"href": "7_1.png", "title": "Lower"}], "rgic01_teun_hemelrijkst_msp_samples20160627102540624": [{"href": "2_0.png", "title": ""}], "rgic01_bert_boerma_kale_grond_outliers20160627104056107": [{"href": "5_0.png", "title": "Higher"}, {"href": "5_1.png", "title": "Lower"}], "rgic01_teun_intersnack_a1_outliers_0620160627101117649": [{"href": "9_0.png", "title": "Higher"}, {"href": "9_1.png", "title": "Lower"}], "rgic01_msp_zones20160627102540352": [{"href": "0_0.png", "title": "A"}, {"href": "0_1.png", "title": "B"}, {"href": "0_2.png", "title": "C"}], "rgic01_bert_boerma_kale_grond_samples20160627104056421": [{"href": "4_0.png", "title": ""}], "rgic01_bert_boerma_kale_grond_zones20160627104056741": [{"href": "3_0.png", "title": "Dark soil"}, {"href": "3_1.png", "title": "Medium soil"}, {"href": "3_2.png", "title": "Bright soil"}], "rgic01__2016_06_22_teun_intersnack_a1_zones20160629145657979": [{"href": "6_0.png", "title": "A"}, {"href": "6_1.png", "title": "B"}, {"href": "6_2.png", "title": "C"}], "rgic01_teun_huupvdvelden_hemelrijkst_msp_outliers20160627102540738": [{"href": "1_0.png", "title": "Higher"}, {"href": "1_1.png", "title": "Lower"}]};
var view = new ol.View({ maxZoom: 32, minZoom: 1, projection: 'EPSG:3857'});
var originalExtent = [622017.262389, 6637436.238839, 737152.093659, 6881342.006455];

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
{exclude: true, jsx: React.createElement("a", {className:"navbar-brand", href:"#"}, "Taking Management Zones into the Field")}];
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
                                          React.createElement(FeatureTable, {offset: [20, 20], ref: 'table', resizeTo: 'table-panel', layer: lyr_onionfieldhemelrijkstmanagementzones, pointZoom:16, map: map})
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


