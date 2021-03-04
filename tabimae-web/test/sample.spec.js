import { mount } from '@vue/test-utils'
import About from '@/components/about.vue'


describe('About', () => {
  test('コンポーネントが存在する', () => {
    // Logoコンポーネントをマウントする
    const wrapper = mount(About)
    // expect()の中身がtrueだったらテスト合格
    expect(wrapper.exists()).toBeTruthy()
  })
})