import { createLocalVue, shallowMount } from '@vue/test-utils'
import Vuex from 'vuex'
import VueRouter from 'vue-router'
import signup from '~/pages/signup'

const localVue = createLocalVue()
localVue.use(Vuex)
localVue.use(VueRouter)
const router = new VueRouter()

describe('signup', () => {
  let wrapper

  beforeEach(() => {
    wrapper = shallowMount(signup, { localVue,router })
  })

  it('正常にサインアップするか', () => {
		const name = "ただ"
		const email = "hoge@example.com"
		const password = "aaaaaa"
		const passwordConfirm = "aaaaaa"
		wrapper.vm.signup(name, email, password, passwordConfirm)
		expect(wrapper.vm.$route.path).toBe('/')
		// 期待結果
	})
  // it('名前エラーになるか', () => {
	// 	const name = ""
	// 	const email = "hoge@example.com"
	// 	const password = "aaaaaa"
	// 	const passwordConfirm = "aaaaaa"
	// 	wrapper.vm.signup(name, email, password, passwordConfirm)
	// 	expect(wrapper.vm.$route.path).toBe("名前を入力してください")
	// 	// 期待結果
	// })
  it('正常にゲストログインできるか', () => {
		const GUEST_LOGIN_EMAIL = process.env.GUEST_LOGIN_EMAIL
		const GUESTPW = process.env.GUESTPW
		wrapper.vm.guestLogin(GUEST_LOGIN_EMAIL, GUESTPW)
		expect(wrapper.vm.$route.path).toBe('/')
	})
	// サインアップしたユーザー登録を削除する記述書く

})
