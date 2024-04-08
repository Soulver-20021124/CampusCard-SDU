<template>
    <div id="myChart" :style="{width: '1400px', height: '800px'}"> </div>

  </template>
  <script>
  import * as echarts from 'echarts';
  import request from "../../utils/request";
  import userApi from "@/api/userManage";
  import { mapGetters } from 'vuex'
  export default {
    computed: {
    ...mapGetters([
      'id'
    ])
  },
  
    name: "Pie",
    mounted() {
        userApi.getPie(this.id).then(res=>{
  
  // 基于准备好的dom，初始化echarts实例
  let myChart = echarts.init(document.getElementById('myChart'))
  myChart.resize({
    width:1400,
    height:800
  })
  
  // 绘制图表
  myChart.setOption({
    title: {
      text: '消费分布',
      
      left: 'center'
    },
    tooltip: {
      trigger: 'item',
      formatter: '{a} <br/>{b} : {c} ({d}%)'
    },
    legend: {
      top: 'bottom'
    },
    toolbox: {
      show: true,
      feature: {
        mark: { show: true },
        dataView: { show: true, readOnly: false },
        restore: { show: true },
        saveAsImage: { show: true }
      }
    },
    series: [
      {
        name: '消费偏好饼状图',
        type: 'pie',
        radius: [50, 250],
        center: ['50%', '50%'],
        roseType: 'area',
        itemStyle: {
          borderRadius: 8
        },
        data: res.data
      }
    ]
  })
})
;

        
    
     
    }
  }
  </script>

  
  