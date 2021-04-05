import { createLocalVue, shallowMount } from '@vue/test-utils'
import Vuex from 'vuex'
import VueRouter from 'vue-router'
import travelNew from '~/pages/travelNew'

const localVue = createLocalVue()
localVue.use(Vuex)
localVue.use(VueRouter)
const router = new VueRouter()

describe('createTravel', () => {
  let wrapper

  beforeEach(() => {
    wrapper = shallowMount(travelNew, { localVue,router })
  })

  it('正常にサインアップするか', () => {
		const name = "ただ"
		const departure_day= ""
		const departure_place = ""
		const arrival_place = ""
		const departure_time = ""
		const arrival_time = ""
		wrapper.vm.createTravel(departure_day,departure_place,arrival_place,departure_time,arrival_time,name)
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
  // it('正常にゲストログインできるか', () => {
	// 	const GUEST_LOGIN_EMAIL = process.env.GUEST_LOGIN_EMAIL
	// 	const GUESTPW = process.env.GUESTPW
	// 	wrapper.vm.guestLogin(GUEST_LOGIN_EMAIL, GUESTPW)
	// 	expect(wrapper.vm.$route.path).toBe('/')
	// })
	// サインアップしたユーザー登録を削除する記述書く

})
