export const state = () => ({
  isLoading: false
});

export const mutations = {
  setLoading(state, payload) {
    state.isLoading = payload
  }
};

export const actions = {};