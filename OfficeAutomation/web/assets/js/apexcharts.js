$(function() {
  'use strict';

  // Apex Line chart start
  var options = {
    chart: {
      height: 300,
      type: "line",
      parentHeightOffset: 0
    },
    colors: ["#4d8af0"],
    grid: {
      borderColor: "rgba(77, 138, 240, .1)",
      padding: {
        bottom: -15
      }
    },
    series: [
      {
        name:
          "工作量",
        data: [2336.6, 6704.75, 6767.67]
      }
    ],
    xaxis: {
    	type: 'category',
        categories: ['2018年', '2019年','2020年']
    },
    markers: {
      size: 0
    },
    stroke: {
      width: 3,
      curve: "smooth",
      lineCap: "round"
    },
    legend: {
      show: true,
      position: "top",
      horizontalAlign: 'left',
      containerMargin: {
        top: 30
      }
    },
    responsive: [
      {
        breakpoint: 500,
        options: {
          legend: {
            fontSize: "11px"
          }
        }
      }
    ]
  };
  var apexLineChart = new ApexCharts(document.querySelector("#apexLine"), options);
  apexLineChart.render();
  // Apex Line chart end


  // Apex Donut chart start
  var options = {
    chart: {
      height: 300,
      type: "donut"
    },
    stroke: {
      colors: ['rgba(0,0,0,0)']
    },
    colors: ["#f77eb9", "#7ee5e5","#4d8af0","#fbbc06"],
    legend: {
      position: 'top',
      horizontalAlign: 'center'
    },
    dataLabels: {
      enabled: false
    },
    series: [5, 23, 18, 30, 13],
    labels: ['设计', '编程画面', '调试', '经营','日常']
  };
  
  var chart = new ApexCharts(document.querySelector("#apexDonut"), options);
  
  chart.render();
  // Apex Donut chart end

  
  

  

});