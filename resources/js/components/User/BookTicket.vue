<template>
<div>
    <User_Side_Bar/>
    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-2"></div>
            <div class="9">
                <img  class="rounded" :src="/uploads/+movie_detail.image"/> <br><br><br>
                <h1><u>{{movie_detail.name}}</u></h1><br>
                <h5>Ticket Prize: 100/-</h5>
                <form method="post" @submit.prevent="BookTicket(movie_detail.id)">
                    How Much tickets you want?<br>
                    <input class="form-control" type="text" name="qty" v-model="qty" required>
                       <br><br>
                    Select Date:<br>
                    <input type="date" class="form-control" name="showDate" id="date" v-model="showDate" required>
                    <br><br><br><br>
                    <div v-for="n in 10">
                     <input type="checkbox" class="big-checkbox"  :value='"A"+n' v-model="selectedSeat"
                            @click="check($event)">
                       <input type="checkbox" class="big-checkbox"  :value='"B"+n' v-model="selectedSeat" @click="check($event)">
                       <input type="checkbox" class="big-checkbox" :value='"C"+n' v-model="selectedSeat" @click="check($event)">
                       <input type="checkbox" class="big-checkbox"  :value='"D"+n' v-model="selectedSeat" @click="check($event)">
                       <input type="checkbox" class="big-checkbox"  :value='"E"+n' v-model="selectedSeat" @click="check($event)">


                    </div><br><br>
                    <div style="margin-bottom: 100px">
                        <button type="submit" class="btn btn-outline-success form-control">Book</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import User_Side_Bar from "../User_Side_Bar";
export default {
    name: "BookTicket",
    components:{
        User_Side_Bar
    },
    data(){
        return{
            movie_detail:[],
            screen:'',
            seat:[],
            qty:'',
            showDate:'',
            selectedSeat:[],
            isChecked: true,


        }
    },
    methods:{
        showdata(){
            axios.get('/api/viewdata/' + this.$route.params.id , {
                headers : {
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then(view2 => {
                // console.warn('view', view2)
                this.movie_detail = view2.data.data
            })

        },
        BookTicket(id){
            let data = new FormData();
            data.append('seat', this.selectedSeat);
            data.append('qty', this.qty);
            data.append('showDate', this.showDate);

            axios.post('/api/booking/'+id, data,{
                headers : {
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then(result =>{
                        console.warn('result',result)
            })

        },
      getBookedSeat(){
            axios.get('/api/bookedticket/'+ this.$route.params.id,{
                headers : {
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then(resp =>{
                // console.warn('resp',resp)
                this.selectedSeat = resp.data.ticket

            })
      },
        check: function(e) {
            if (e.target.checked) {
                console.log(e.target.value)
            }
        }


    },
    mounted() {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0 so need to add 1 to make it 1!
        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = yyyy + '-' + mm + '-' + dd;
        $("#date").attr("min", today);

        this.showdata()
        this.getBookedSeat()
    }


}
</script>

<style scoped>
img{
    width:900px;
    height: 500px;
}
.big-checkbox
{
    width: 30px;
    height: 30px;
}
</style>
