export const state = () => ({
  currentUser: null,
  travels: []

});

export const mutations = {
  setUser(state, payload) {
    state.currentUser = payload
  },
  //Vue上でcurrentuserと同じ階層にする
  setTravels(state, payload) {
    state.travels = payload
  },
};

export const actions = {};
