function apexPieInfo(partner,juJian,shiChang,Internet) {
//	var options = {
//    	    chart: {
//    	      height: 300,
//    	      type: "pie"
//    	    },
//    	    colors: ["#f77eb9", "#7ee5e5","#4d8af0","#fbbc06"],
//    	    legend: {
//    	      position: 'top',
//    	      horizontalAlign: 'center',
//    	      labels: {
//    	          colors: 'white',
//    	          useSeriesColors: false
//    	      }
//    	    },
//    	    stroke: {
//    	      colors: ['rgba(0,0,0,0)']
//    	    },
//    	    dataLabels: {
//    	      enabled: false
//    	    },
//    	    series: [partner, juJian, shiChang, Internet],
//    	    labels: ['合作伙伴', '居间人', '市场推广活动', '互联网营销']
//    	  };
//    	  var chart = new ApexCharts(document.querySelector("#apexPie"), options);
//    	  chart.render();
	Highcharts.chart('apexPie', {
		chart: {
			backgroundColor: '#0C1427',
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false,
			type: 'pie'
		},
		title: {
			text: '客户来源分布'
		},
		tooltip: {
			pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b><br>数目: <b>{point.y}个</b>'
		},
		plotOptions: {
			pie: {
				allowPointSelect: true,
				cursor: 'pointer',
				dataLabels: {
					enabled: false
				},
				showInLegend: true
			}
		},
		series: [{
			name: '比例',
			colorByPoint: true,
			data: [{
				name: '合作伙伴',
				y: 1
				//sliced: true,//单独展示
				//selected: true//始终被选中
			}, {
				name: '居间人',
				y: Number(juJian)
			}, {
				name: '市场推广活动',
				y: Number(shiChang)
			}, {
				name: '互联网营销',
				y: Number(Internet)
			}]
		}]
	});
}
    	  
    	  var chart = Highcharts.chart('container', {
    	        chart: {
    	        	backgroundColor:'#0c1427',
    	            type: 'funnel',
    	            marginRight: 100
    	        },
    	        title: {
    	            text: '销售漏斗',
    	            style:{
    	            	color:'#EEF4FF'
    	            },
    	            x: -50
    	        },
    	        plotOptions: {
    	            series: {
    	                dataLabels: {
    	                    enabled: true,
    	                    crop : false,
    	                    overflow: 'none',
    	                    format: '<b>{point.name}</b> ({point.y:,.0f})',
    	                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
    	                    softConnector: true
    	                },
    	                neckWidth: '30%',
    	                neckHeight: '25%'
    	                //-- Other available options
    	                // height: pixels or percent
    	                // width: pixels or percent
    	            }
    	        },
    	        legend: {
    	            enabled: false
    	        },
    	        series: [{
    	            name: '用户',
    	            data: [
    	                ['01.跟踪阶段',5654],
    	                ['02.洽谈阶段',4064],
    	                ['03.方案阶段',1987],
    	                ['04.投标阶段',976],
    	                ['05.投标准备阶段',846],
    	                ['06.设计阶段',423],
    	                ['07.实施阶段',342],
    	                ['08.验收阶段',126]
    	            ]
    	        }]
    	    });
    	    
    	        $(function() { 
    	            var winWidth=$(window).width();
    	            if (parseInt(winWidth)>parseInt("900")) {
    	                $("#title1").addClass("search-form");
    	                $("#titleText").css("font-size","24px");
    	            }
    	            else {
    	                $("#title1").removeClass("search-form");
    	            }
    	        });
    	        
    	        function shangJi(gzNum,gzMoney,qtNum,qtMoney,faNum,faMoney,tbNum,tbMoney,tbzbNum,tbzbMoney,sjNum,sjMoney,ssNum,ssMoney,ysNum,ysMoney) {
    	        	var chart = Highcharts.chart('apexMixed', {
    	        		chart: {
    	        			backgroundColor: '#0C1427',
    	        			zoomType: 'xy'
    	        		},
    	        		title: {
    	        			text: '商机分布图'
    	        		},
    	        		xAxis: [{
    	        			categories: ['跟踪阶段', '洽谈阶段', '方案阶段', '投标阶段','投标准备阶段','设计阶段','实施阶段','验收阶段'],
    	        			crosshair: true
    	        		}],
    	        		yAxis: [{ // Primary yAxis
    	        			labels: {
    	        				format: '{value}万元',
    	        				style: {
    	        					color:'#64E572'
    	        				}
    	        			},
    	        			title: {
    	        				text: '项目金额',
    	        				style: {
    	        					color:'#64E572'
    	        				}
    	        			}
    	        		}, { // Secondary yAxis
    	        			title: {
    	        				text: '项目数',
    	        				style: {
    	        					color: '#2b908f'
    	        				}
    	        			},
    	        			labels: {
    	        				format: '{value} 个',
    	        				style: {
    	        					color: '#2b908f'
    	        				}
    	        			},
    	        			opposite: true
    	        		}],
    	        		tooltip: {
    	        			shared: true
    	        		},
    	        		legend: {
    	        			layout: 'vertical',
    	        			align: 'left',
    	        			x: 0,
    	        			verticalAlign: 'top',
    	        			y: 0,
    	        			floating: true,
    	        			backgroundColor: '#0C1427'
    	        		},
    	        		series: [{
    	        			name: '项目数',
    	        			color: '#2b908f',
    	        			borderColor: '#0C1427',
    	        			type: 'column',
    	        			yAxis: 1,
    	        			data: [parseInt(gzNum), parseInt(qtNum), parseInt(faNum), parseInt(tbNum),
    	        				parseInt(tbzbNum), parseInt(sjNum), parseInt(ssNum), parseInt(ysNum)],
    	        			tooltip: {
    	        				valueSuffix: ' 个'
    	        			}
    	        		}, {
    	        			name: '项目金额',
    	        			color:'#64E572',
    	        			type: 'spline',
    	        			data: [parseFloat(gzMoney), parseFloat(qtMoney), parseFloat(faMoney), parseFloat(tbMoney),
    	        				parseFloat(tbzbMoney), parseFloat(sjMoney),parseFloat(ssMoney),parseFloat(ysMoney)],
    	        			tooltip: {
    	        				valueSuffix: '万元'
    	        			}
    	        		}]
    	        	});
    	        }
    	        
    	        function mapInits(tmp1,tmp2,tmp3,tmp4,tmp5,tmp6,tmp7,tmp8,tmp9,tmp10,tmp11,tmp12,tmp13,tmp14,tmp15,tmp16,tmp17,tmp18,tmp19,tmp20,tmp21,tmp22,tmp23,tmp24,tmp25,tmp26,tmp27,tmp28,tmp29,tmp30,tmp31,tmp32,tmp33,tmp34) {
    	        	var provinces = [ 'shanghai', 'hebei', 'shanxi','neimenggu', 'liaoning', 'jilin','heilongjiang', 'jiangsu', 'zhejiang', 'anhui','fujian', 'jiangxi', 'shandong', 'henan','hubei', 'hunan', 'guangdong', 'guangxi','hainan', 'sichuan', 'guizhou', 'yunnan','xizang', 'shanxi1', 'gansu', 'qinghai','ningxia', 'xinjiang', 'beijing', 'tianjin','chongqing', 'xianggang', 'aomen' ];
                    var provincesText = [ '上海', '河北', '山西', '内蒙古', '辽宁','吉林', '黑龙江', '江苏', '浙江', '安徽', '福建', '江西','山东', '河南', '湖北', '湖南', '广东', '广西', '海南', '四川','贵州', '云南', '西藏', '陕西', '甘肃', '青海', '宁夏', '新疆','北京', '天津', '重庆', '香港', '澳门' ];
                     
                    var seriesData = [ {
                        name : '北京',
                        value : tmp1
                    }, {
                        name : '天津',
                        value : tmp2
                    }, {
                        name : '上海',
                        value : tmp3
                    }, {
                        name : '重庆',
                        value : tmp4
                    }, {
                        name : '河北',
                        value : tmp5
                    }, {
                        name : '河南',
                        value : tmp6
                    }, {
                        name : '云南',
                        value : tmp7
                    }, {
                        name : '辽宁',
                        value : tmp8
                    }, {
                        name : '黑龙江',
                        value : tmp9
                    }, {
                        name : '湖南',
                        value : tmp10
                    }, {
                        name : '安徽',
                        value : tmp11
                    }, {
                        name : '山东',
                        value : tmp12
                    }, {
                        name : '新疆',
                        value : tmp13
                    }, {
                        name : '江苏',
                        value : tmp14
                    }, {
                        name : '浙江',
                        value : tmp15
                    }, {
                        name : '江西',
                        value : tmp16
                    }, {
                        name : '湖北',
                        value : tmp17
                    }, {
                        name : '广西',
                        value : tmp18
                    }, {
                        name : '甘肃',
                        value : tmp19
                    }, {
                        name : '山西',
                        value : tmp20
                    }, {
                        name : '内蒙古',
                        value : tmp21
                    }, {
                        name : '陕西',
                        value : tmp22
                    }, {
                        name : '吉林',
                        value : tmp23
                    }, {
                        name : '福建',
                        value : tmp24
                    }, {
                        name : '贵州',
                        value : tmp25
                    }, {
                        name : '广东',
                        value : tmp26
                    }, {
                        name : '青海',
                        value : tmp27
                    }, {
                        name : '西藏',
                        value : tmp28
                    }, {
                        name : '四川',
                        value : tmp29
                    }, {
                        name : '宁夏',
                        value : tmp30
                    }, {
                        name : '海南',
                        value : tmp31
                    }, {
                        name : '台湾',
                        value : tmp32
                    }, {
                        name : '香港',
                        value : tmp33
                    }, {
                        name : '澳门',
                        value : tmp34
                    }, {
                        name : '南海诸岛',
                        value : 0
                    } ];    
                    var myChart = echarts.init(document.getElementById('china-map'));
                    initEcharts("china", "中国");

                    // 初始化echarts
                    function initEcharts(pName, Chinese_) {
                      var tmpSeriesData = pName === "china" ? seriesData : [];

                      var option = {
                        title: {
                          text: '项目分布图',
                          left: 'center',
                          textStyle:{
                              fontSize: 28,
                                fontWeight: 'bolder',
                                color: '#ffffff'
                          }
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{b}<br/> 项目数 ：{c} 个'
                        },
                        dataRange: {
            	            min: 0,
            	            max: 10,
            	            x: 'left',
            	            y: 'bottom',
            	            text:['高','低'],
            	            color:['#90EE7E','#2B908F'],
            	            calculable : true
            	        },
                        series: [
                          {
                            name: Chinese_ || pName,
                            type: 'map',
                            //aspectScale : 0.65,//长宽比
                            mapType: pName,
                            roam: false,//是否开启鼠标缩放和平移漫游
                            data: tmpSeriesData,
                            top: "5%",//组件距离容器的距离
                              zoom:1.1,
                              selectedMode : 'single',

                              label: {
                                  normal: {
                                      show: true,//显示省份标签
                                      textStyle:{color:"#fbfdfe"}//省份标签字体颜色
                                  },
                                  emphasis: {//对应的鼠标悬浮效果
                                      show: true,
                                      textStyle:{color:"#323232"}
                                  }
                              },
                              itemStyle: {
                                  normal: {
                                      borderWidth: .5,//区域边框宽度
                                      borderColor: '#0550c3',//区域边框颜色
                                      areaColor:"#4ea397",//区域颜色

                                  },

                                  emphasis: {
                                      borderWidth: .5,
                                      borderColor: '#4b0082',
                                      areaColor:"#ece39e",
                                  }
                              },
                          }
                        ]

                           };

                      myChart.setOption(option);

                      myChart.off("click");

                      if (pName === "china") { // 全国时，添加click 进入省级
                        myChart.on('click', function (param) {
                          console.log(param.name);
                          // 遍历取到provincesText 中的下标  去拿到对应的省js
                          for (var i = 0; i < provincesText.length; i++) {
                            if (param.name === provincesText[i]) {
                              //显示对应省份的方法
                              //showProvince(provinces[i], provincesText[i]);
                              break;
                            }
                          }
                            if (param.componentType === 'series') {
                                var provinceName =param.name;
                                $('#box').css('display','block');
                                $("#box-title").html(provinceName);

                            }
                        });
                      } else { // 省份，添加双击 回退到全国
                        myChart.on("dblclick", function () {
                          initEcharts("china", "中国");
                        });
                      }
                    }

                    // 展示对应的省
                    function showProvince(pName, Chinese_) {
                      //这写省份的js都是通过在线构建工具生成的，保存在本地，需要时加载使用即可，最好不要一开始全部直接引入。
                      loadBdScript('$' + pName + 'JS', './js/map/province/' + pName + '.js', function () {
                        initEcharts(Chinese_);
                      });
                    }

                    // 加载对应的JS
                    function loadBdScript(scriptId, url, callback) {
                      var script = document.createElement("script");
                      script.type = "text/javascript";
                      if (script.readyState) {  //IE
                        script.onreadystatechange = function () {
                          if (script.readyState === "loaded" || script.readyState === "complete") {
                            script.onreadystatechange = null;
                            callback();
                          }
                        };
                      } else {  // Others
                        script.onload = function () {
                          callback();
                        };
                      }
                      script.src = url;
                      script.id = scriptId;
                      document.getElementsByTagName("head")[0].appendChild(script);
                    };
				}
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
    	        
