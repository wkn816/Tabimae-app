export const state = () => ({
  currentUser: null,

  travels: [],
  trains: []
});

export const mutations = {
  setUser(state, payload) {
    state.currentUser = payload
  },

  setTravels(state, payload) {
    state.travels = payload
  },
  setTrains(state, payload) {
    // state.trains = payload
  },
};

export const actions = {};
