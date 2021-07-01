<template>
    <div>
        <index/>
        <div class="row">
            <div class="col-3">
                <Sidebar/>

            </div>
            <div class="col-9">
                <h1>Dashboard</h1>

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
    name: "Dashboard",
    components:{
        index,
        Sidebar,
        Footer
    },
}
</script>

<style scoped>

</style>
