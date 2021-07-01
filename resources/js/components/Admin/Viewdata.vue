<template>
    <div v-if="!seen">
        <index/>
        <div class="row">
            <div class="col-2"  >
                <Sidebar/>

            </div>
            <div class="col-9 mt-5" >
                <table class="table table-hover">
                    <thead>
                    <tr>

                        <th scope="col">Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Casts</th>
                        <th scope="col">Run Time</th>
                        <th scope="col">Release Year</th>

                        <th scope="col" colspan="2">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="data in movie_list" v-bind:key="data.id">
                        <td>{{data.name}}</td>
                        <td><img :src="/uploads/+data.image" /> </td>
                        <td>{{data.casts}}</td>
                        <td>{{data.runtime}}</td>
                        <td>{{data.release_year}}</td>


                        <td>
                            <button class="btn btn-info" v-on:click="ViewdatabyID(data.id)">
                                <i class="far fa-eye"></i></button>
                        </td>
                        <td>
                            <button class="btn btn-danger"
                                    v-on:click="DeleteData(data.id)">
                                <i class="fas fa-trash"></i></button>
                        </td>

                    </tr>
                    </tbody>

                </table>

            </div>

        </div>
        <Footer/>

    </div>
</template>

<script>
import index from '../index';
import Sidebar from "../Sidebar";
import Footer from "../Footer";
export default {
    name: "Viewdata",
    components:{
        index,
        Sidebar,
        Footer
    },
    data(){
        return{
            movie_list: '',
            seen:false,
        }
    },
    methods: {
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
        ViewdatabyID(id){
            // this.seen=true
            this.$router.push('/viewdata/'+id)

        },
        DeleteData(id){
            axios.delete('/api/deletedata/'+id,{
                headers:{
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then(resp=>{
                // console.warn('resp' , resp)
                this.Viewdata()
            })

        },
    },

    mounted() {
        this.Viewdata()
    }
}
</script>

<style scoped>
table{
    background-color:whitesmoke;
}
img{
    width: 100px;
    height:100px;
}

</style>
