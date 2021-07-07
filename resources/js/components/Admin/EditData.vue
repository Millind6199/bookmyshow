<template>
    <div v-if="!seen">
        <index/>
        <div class="row">
            <div class="col-3">
                <Sidebar/>

            </div>
            <div class="col-6 mt-5">
                <form @submit.prevent="UpdateData(movie_detail.id)" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="movie">Movie Name</label>
                        <input type="text" class="form-control" id="movie" v-model="items.name"
                             value="movie_detail.name"  required>
                    </div>
                    <div class="form-group">
                        <label for="movie_ov">OverView</label>
                        <textarea type="text" class="form-control" id="movie_ov" v-model="items.overview"
                                  required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="movie_img">Movie Image</label>
                        <input type="file" class="form-control" name="image" id="movie_img"
                               ref="file"
                               v-on:change="handleFileUpload()" required >
                    </div>
                    <div class="form-group">
                        <label for="movie_mc">Movie casts</label>
                        <input type="text" class="form-control" id="movie_mc" v-model="items.casts" required>
                    </div>
                    <div class="form-group">
                        <label for="movie_rt">Run time</label>
                        <input type="time" class="form-control" id="movie_rt" v-model="items.runtime" required>
                    </div>
                    <div class="form-group">
                        <label for="movie_ry">Release Year</label>

                        <input type="date" class="form-control" id="movie_ry" v-model="items.release_year" required>
                    </div>

                    <p class=""><b>Press Ctrl and Select Multiple Options</b></p>
                    <div class="form-group">
                        <select class="form-select form-control"
                                multiple aria-label="multiple select example" v-model="items.lang" required>
                            <option value="eng">English</option>
                            <option value="hin">Hindi</option>
                            <option value="tam">Tamil</option>
                            <option value="guj">Gujarati</option>
                            <option value="tel">Telugu</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-select form-control" multiple aria-label="multiple select example"
                                v-model="items.screen" required>
                            <option value="2d">2D</option>
                            <option value="3d">3D</option>
                            <option value="4d">4D</option>
                            <option value="imax2d">IMAX 2D</option>
                            <option value="mx4d">MX4D</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-select form-control" multiple aria-label="multiple select example"
                                v-model="items.category">
                            <option v-for="cat in category_list" :key="cat.id" :value="cat.id">{{cat.type}}</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="form-control btn btn-info">
                    </div>
                </form>
            </div>

        </div>
        <Footer/>

    </div>

</template>

<script>
import index from '../index';
import Sidebar from "../Sidebar";
import Footer from "../Footer";
import axios from "axios";


export default {
    name: "EditData",
    components:{
        index,
        Sidebar,
        Footer
    },
    data(){
      return{
          seen:false,
          items:{
              name:'',
              overview:'',
              casts:null,
              runtime:null,
              release_year:null,
              image:null,
              lang:[],
              screen:[],
              category:[],
          },
          category_list:'',
          movie_detail:[],
      }
    },
    methods:{
        handleFileUpload(   ) {
            this.items.image = this.$refs.file.files[0];
        },
        UpdateData(id){
            let data = new FormData();
            data.append('name', this.items.name);
            data.append('overview', this.items.overview);
            data.append('image', this.items.image);
            data.append('casts', this.items.casts);
            data.append('runtime', this.items.runtime);
            data.append('release_year', this.items.release_year);
            data.append('lang', this.items.lang);
            data.append('screen', this.items.screen);
            data.append('category', this.items.category);

            axios.post('/api/edit/'+id,data,{
                headers : {
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then((result)=>{
                // console.warn('updated',result)
                this.$router.push('/viewdata')
            })
        },
        EditData(){
            axios.get('/api/viewdata/' + this.$route.params.id , {
                headers : {
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then(view2 => {
                 console.warn('Edit', view2)
                this.movie_detail = view2.data.data
                this.items.name=this.movie_detail.name
                this.items.overview = this.movie_detail.overview
                this.items.casts = this.movie_detail.casts
                this.items.runtime=this.movie_detail.runtime
                this.items.release_year=this.movie_detail.release_year

            })
        },
        setValue(){


        },
        ShowCategory(){
            axios.get('/api/categories', {
                headers : {
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then(cat => {
                // console.warn('view', cat)
                this.category_list = cat.data.category
            })
        },
    },
    mounted(){
        // let apurl = process.env.MIX_API_URL;
        // console.log(apurl, 'jjjj')
        this.EditData()
        this.ShowCategory()
    }
}
</script>

<style scoped>

</style>
