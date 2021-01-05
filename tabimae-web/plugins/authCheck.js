import firebase from "@/plugins/firebase";
import axios from "@/plugins/axios";

const authCheck = ({ store, redirect }) => {
    firebase.auth().onAuthStateChanged(async user => {
    if (user) {
    const { data } = await axios.get('/v1/users', {

        params: {
            uid: user.uid,
        },
    });
    store.commit("auth/setUser", data)
    console.log('data', data)
    store.commit('auth/setTravels', data.travels)
    // store.commit('auth/serTrains', data.trains)
    } else {
    store.commit("auth/setUser", null)
    store.commit('auth/travels', [])
    // store.commit('auth/trains', [])

    }
    });
};

export default authCheck;