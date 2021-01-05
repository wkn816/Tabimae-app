export const state = () => ({
  currentUser: null,

  travels: []
});

export const mutations = {
  setUser(state, payload) {
    state.currentUser = payload
  },

  setTravels(state, payload) {
    state.travels = payload
  },
};

export const actions = {};
