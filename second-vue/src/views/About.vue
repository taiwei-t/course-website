<template>
  <div>
    <el-image :src="imgSrc"></el-image>
    <div>
      <h2 align="center" style="font-size: 28px;font-family: 华文楷体">关于我们</h2>
      <el-container>
        <div style="width: 800px;padding: 20px;font-size: 16px;color: rgb(153, 153, 153)">
          <p>重庆师范大学创办于1954年，是一所以文理为主，多学科协调发展的多科性高等学府，校园面积2688亩，包括大学城校区、沙坪坝校区和北碚校区。办学60年来，学校始终坚持“立教无类，以文化人”的办学理念，秉承“自强不息，躬行师道”的重师精神，践行“厚德、笃学、砺志、创新”的校训，立足重庆、面向西部、服务全国，突出教师教育特色，构建形成了师范教育和非师范教育。</p>
          <p>奋进扬蹄，乘风破浪。习近平、贾庆林、贺国强、刘延东、许嘉璐、彭佩云、韩启德、张梅颖、郑万通等党和国家领导人曾亲临学校视察；教育部、重庆市主要领导多次来校关心指导工作，有力促进了学校的改革和发展。学校将按照校第三次党代会确定的发展目标，不忘初心，牢记使命，深入贯彻习近平新时代中国特色社会主义思想，加强党的全面领导，深入推进内涵式发展，切实提升治校能力和办学水平，大力推进本科教育振兴战略、学科引领联动战略、重师文化建设战略、特色发展战略，积极融入成渝地区双城经济圈建设，为加快建设教师教育特色鲜明的高水平综合性师范大学而努力奋斗。</p>
        </div>
        <el-image style="width:400px;height:300px" :src="require('../assets/image/25.jpg')"></el-image>
      </el-container>

    </div>
    <div>
      <h3 align="center" style="font-size: 24px;font-family: 新宋体">地理位置</h3>
      <baidu-map class="map" :center="center" zoom="15">
        <bm-marker :position="center">
          <bm-label content="重庆师范大学" :labelStyle="{color: '#fffff', fontSize : '20px'}" :offset="{width: -50, height: 25}"/>
        </bm-marker>
      </baidu-map>
    </div>
  </div>
</template>

<script>
export default {
  name: "About",
  data() {
    return{
      imgSrc: require('../assets/image/banner22.jpg'),
      center: {lng: 106.3062, lat: 29.6194}
    }
  }
}
</script>

<style scoped>
.map{
  width: 100%;
  height: 300px;
}
</style>