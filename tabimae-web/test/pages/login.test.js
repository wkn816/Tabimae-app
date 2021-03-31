import { createLocalVue, shallowMount } from '@vue/test-utils'
import Vuex from 'vuex'
import VueRouter from 'vue-router'
import login from '~/pages/login'

const localVue = createLocalVue()
localVue.use(Vuex)
localVue.use(VueRouter)
const router = new VueRouter()

describe('login', () => {
  let wrapper

  beforeEach(() => {
    wrapper = shallowMount(login, { localVue,router })
                            // 発火させるメソッド
  })

  it('正常にログインできるか', () => {
		const email = "hoge@example.com"
		const password = "aaaaaa"
		wrapper.vm.login(email, password)
		expect(wrapper.vm.$route.path).toBe('/')
		// 期待結果
	})

})
