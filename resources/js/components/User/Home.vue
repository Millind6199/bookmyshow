<template>
    <div>
        <User_Side_Bar/>
        <div class="mt-1 slideshow-container">

            <div v-if="slide == 1" class="mySlides">
                <div class="numbertext">1 / 3</div>
                <img src="uploads/godzilla-vs-kong-et00122511-16-06-2021-12-47-29.jpg"
                     style="width:100%;height:600px" />
                <div class="text">Caption Text</div>
            </div>

            <div v-else-if="slide == 2" class="mySlides">
                <div class="numbertext">2 / 3</div>
                <img src="uploads/jumanji-the-next-level-et00077156-22-10-2020-06-15-23.jpg" style="width:100%;height:600px" >
                <div class="text">Caption Two</div>
            </div>

            <div v-else-if="slide == 3" class="mySlides">
                <div class="numbertext">3 / 3</div>
                <img src="uploads/mumbai-saga-et00105043-16-03-2021-02-46-48.jpg" style="width:100%;height:600px" >
                <div class="text">Caption Three</div>
            </div>

            <a class="prev" v-on:click="plusSlides(-1)">&#10094;</a>
            <a class="next" v-on:click="plusSlides(1)">&#10095;</a>

        </div>
        <br>

        <div style="text-align:center">
            <span class="dot" v-on:click="currentSlide(1)"></span>
            <span class="dot" v-on:click="currentSlide(2)"></span>
            <span class="dot" v-on:click="currentSlide(3)"></span>
        </div>

        <section class="wrapper">
            <div class="container">

                <div class="row">
                    <div class="col-sm-4 mt-4"  v-for="data in movie_list"
                         :key="data.id">
                        <div class="card text-white card-has-bg click-col"
                             v-on:click="getticket(data.id)"
                                    :style="bgDImage(data.image)">
                        <img class="card-img " :src="/uploads/+data.image">
                        <div class="card-img-overlay d-flex flex-column">
                            <div class="card-body">
<!--                                <small class="card-meta mb-2">{{data.name}}</small>-->
                                <h4 class="card-title text-white mt-0 ">{{data.name}}</h4>
                                <small><i class="far fa-clock"></i>
                                    Released On :{{data.release_year}}</small>
                            </div>

                        </div>
                    </div></div>
                </div>

            </div>
        </section>

    </div>

</template>

<script>
import User_Side_Bar from "../User_Side_Bar";
export default {
    name: "Home",
    components:{
        User_Side_Bar
    },
    data(){
      return{
          slide: 1,
          movie_list:[],

      }
    },
    methods:{
        currentSlide(n)
        {
            this.slide = n

        },
        plusSlides(n)
        {
            this.slide += n
        },

        Viewdata() {

            axios.get('/api/viewdata', {
                headers : {
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then(view => {
                console.warn('view', view)
                this.movie_list = view.data.data
            })
        },
        getticket(id){
            this.$router.push('/user/viewdetails/'+id)
        },
        bgDImage (image) {
            console.log(image)
            return {
                backgroundImage: `url(uploads+''${image})`,
                opacity:0.8,
                width:'100%',
            }
        },


    },
    computed: {
        bgImage () {
            return 'uploads/'+ movie_list.image
        },
        inlineStyle() {
            return {
                backgroundImage: `url(${this.bgImage()})`,
                opacity:0.8,
                width:'100%',
            }
        }
    },
    mounted() {
        this.Viewdata()
    }
}
</script>

<style scoped>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
/*.mySlides {display: none}*/
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
    max-width: 1000px;
    position: relative;
    margin: auto;
}

/* Next & previous buttons */
.prev, .next {
    cursor: pointer;
    position: absolute;
    top: 50%;
    width: auto;
    padding: 16px;
    margin-top: -22px;
    color: white;
    font-weight: bold;
    font-size: 18px;
    transition: 0.6s ease;
    border-radius: 0 3px 3px 0;
    user-select: none;
}

/* Position the "next button" to the right */
.next {
    right: 0;
    border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
    background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
    color: #f2f2f2;
    font-size: 15px;
    padding: 8px 12px;
    position: absolute;
    bottom: 8px;
    width: 100%;
    text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
    color: #f2f2f2;
    font-size: 12px;
    padding: 8px 12px;
    position: absolute;
    top: 0;
}

/* The dots/bullets/indicators */
.dot {
    cursor: pointer;
    height: 15px;
    width: 15px;
    margin: 0 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
}

.active, .dot:hover {
    background-color: #717171;
}

/* Fading animation */
.fade {
    -webkit-animation-name: fade;
    -webkit-animation-duration: 1.5s;
    animation-name: fade;
    animation-duration: 1.5s;
}

@-webkit-keyframes fade {
    from {opacity: .4}
    to {opacity: 1}
}

@keyframes fade {
    from {opacity: .4}
    to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
    .prev, .next,.text {font-size: 11px}
}
body{
    background-color:#FCBF49;
}
.wrapper{margin:10vh}
/*//post card styles*/

  .card{
      border: none;
      transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);
      overflow:hidden;
      border-radius:20px;
      min-height:450px;
      box-shadow: 0 0 12px 0 rgba(0,0,0,0.2);

@media (max-width: 768px) {
    min-height:350px;
}

@media (max-width: 420px) {
    min-height:300px;
}

&.card-has-bg{
     transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);
     background-size:120%;
     background-repeat:no-repeat;
     background-position: center center;
&:before {
     content: '';
     position: absolute;
     top: 0;
     right: 0;
     bottom: 0;
     left: 0;
     background: inherit;
     -webkit-filter: grayscale(1);
     -moz-filter: grayscale(100%);
     -ms-filter: grayscale(100%);
     -o-filter: grayscale(100%);
     filter: grayscale(100%);}

&:hover {
     transform: scale(0.98);
     box-shadow: 0 0 5px -2px rgba(0,0,0,0.3);
     background-size:130%;
     transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);

.card-img-overlay {
    transition: all 800ms cubic-bezier(0.19, 1, 0.22, 1);
    background: rgb(35,79,109);
    background: linear-gradient(0deg, rgba(4,69,114,0.5) 0%, rgba(4,69,114,1) 100%);
}
}
}
.card-footer{
    background: none;
    border-top: none;
.media{
img{
    border:solid 3px rgba(234,95,0,0.3);
}
}
}
.card-meta{color:orange}
.card-body{
    transition: all 500ms cubic-bezier(0.19, 1, 0.22, 1);
}
&:hover {
.card-body{
    margin-top:30px;
    transition: all 800ms cubic-bezier(0.19, 1, 0.22, 1);
}
cursor: pointer;
transition: all 800ms cubic-bezier(0.19, 1, 0.22, 1);
}
.card-img-overlay {
    transition: all 800ms cubic-bezier(0.19, 1, 0.22, 1);
    background: rgb(35,79,109);
    background: linear-gradient(0deg, rgba(35,79,109,0.3785889355742297) 0%, rgba(69,95,113,1) 100%);
}
}
</style>
