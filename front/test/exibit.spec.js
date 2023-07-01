import { shallowMount } from '@vue/test-utils'
import login from '@/pages/sample.vue'

describe('HelloWorld', () => {
  test('display Hello World', () => {
    const wrapper = shallowMount(login, {
      stubs: {
        userFormEmail:  "<div>Email</div>",
        userFormPassword:  "<div>Password</div>"
      }
    })
    wrapper.setData({
      params: { auth:
        { email: 'tokugawa@gmail.com'}
      },
    })

    expect(wrapper.text()).toEqual('Email')
  })
})