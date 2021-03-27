import { mount } from '@vue/test-utils'
import Home from "../../components/Home";

describe('Home', () => {
	test('コンポーネントが存在する', () => {
		// Logoコンポーネントをマウントする
		const wrapper = mount(Home)
		// expect()の中身がtrueだったらテスト合格
		expect(wrapper.exists()).toBeTruthy()
	})
})
